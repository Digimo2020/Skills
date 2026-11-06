#!/usr/bin/env bash
# Manage this repo's agent skills. Every skill passes a SkillSpector security check
# before it is added to the repo or installed anywhere.
#
#   ./scripts/skills.sh sync      Pull the latest version of every skill in skills-sources.txt.
#                                 Changed skills are security-checked first; a skill that fails is
#                                 held in quarantine/ and the old version is kept.
#   ./scripts/skills.sh install   Security-check every skill, then copy the ones that pass into the
#                                 AI tools on this machine (Claude Code, Codex, Gemini CLI, Antigravity).
#   ./scripts/skills.sh update    sync, then install.
#   ./scripts/skills.sh scan      Security-check every skill and print the result. Changes nothing else.
#   ./scripts/skills.sh approve <skill> <APPROVE|CAUTION> "<reason>"
#                                 Record a reviewed verdict for a skill the scanner blocked (after a
#                                 skill-inspector review). Moves it out of quarantine/ if it is there.
#   ./scripts/skills.sh remove <skill>
#                                 Delete a skill from the repo, its source line, its verdict, and every AI tool.
#
# Needs: bash, git, and the skillspector CLI:
#   uv tool install git+https://github.com/NVIDIA/skillspector.git
# npm is needed only for npm: sources.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCES="$ROOT/skills-sources.txt"
VERIFIED="$ROOT/skills-verified.txt"
SKILLS_DIR="$ROOT/skills"
MIRROR_DIR="$ROOT/.agents/skills"
QUARANTINE="$ROOT/quarantine"

# Skill folders used by each tool. A tool is skipped when its home folder does not exist.
#   tool-home-folder|skills-folder
TARGETS=(
  "$HOME/.claude|$HOME/.claude/skills"                          # Claude Code
  "$HOME/.codex|$HOME/.agents/skills"                           # OpenAI Codex CLI
  "$HOME/.gemini|$HOME/.gemini/skills"                          # Gemini CLI
  "$HOME/.gemini/antigravity|$HOME/.gemini/antigravity/skills"  # Google Antigravity
)

log() { printf '%s\n' "$*"; }

if command -v shasum >/dev/null 2>&1; then SHA=(shasum -a 256); else SHA=(sha256sum); fi

# Content fingerprint of a skill folder: any change to any file gives a new value.
hash_dir() {
  (cd "$1" && find . -type f ! -name .DS_Store -print0 | LC_ALL=C sort -z | xargs -0 "${SHA[@]}") \
    | "${SHA[@]}" | cut -c1-16
}

require_scanner() {
  command -v skillspector >/dev/null 2>&1 && return
  log "SkillSpector is not installed, so skills cannot be security-checked. Install it with:"
  log "  uv tool install git+https://github.com/NVIDIA/skillspector.git"
  exit 1
}

record() { # $1=name $2=hash $3=verdict $4=by $5=note
  touch "$VERIFIED"
  local tmp; tmp="$(mktemp)"
  awk -v n="$1" '$1 != n' "$VERIFIED" > "$tmp"
  printf '%s  %s  %s  %s  %s\n' "$1" "$2" "$3" "$4" "${5:-}" >> "$tmp"
  { grep '^#' "$tmp" || true; grep -v '^#' "$tmp" | LC_ALL=C sort; } > "$VERIFIED"
  rm -f "$tmp"
}

# Security gate. Returns 0 when the skill may be used. Sets GATE_RESULT for reporting.
#   Passes when this exact content was already verified, or SkillSpector rates it SAFE/CAUTION.
#   Fails when SkillSpector says DO_NOT_INSTALL (or cannot scan it) and no review covers this content.
check_skill() { # $1=skill dir $2=name
  local dir="$1" name="$2" h rec report
  h="$(hash_dir "$dir")"
  if [ -f "$VERIFIED" ] && awk -v n="$name" -v h="$h" '$1==n && $2==h {f=1} END {exit !f}' "$VERIFIED"; then
    GATE_RESULT="$(awk -v n="$name" '$1==n {print $3" ("$4")"}' "$VERIFIED")"
    return 0
  fi
  report="$(mktemp)"
  skillspector scan "$dir" --no-llm --format json --output "$report" >/dev/null 2>&1 || true
  rec="$(grep -o '"recommendation": *"[A-Z_]*"' "$report" | head -1 | sed 's/.*"\([A-Z_]*\)"$/\1/')"
  rm -f "$report"
  case "$rec" in
    SAFE|CAUTION)
      record "$name" "$h" "$rec" scan "SkillSpector static scan"
      GATE_RESULT="$rec (scan)"; return 0 ;;
    *)
      GATE_RESULT="BLOCKED: SkillSpector says ${rec:-scan failed}; review with skill-inspector"; return 1 ;;
  esac
}

fetch_source() { # $1=source  $2=cache dir -> prints the folder holding the source's files
  local src="$1" cache="$2" dir
  dir="$cache/$(printf '%s' "$src" | tr '/:@' '___')"
  if [ ! -d "$dir" ]; then
    if [[ "$src" == npm:* ]]; then
      mkdir -p "$dir"
      (cd "$dir" && npm pack "${src#npm:}@latest" --silent >/dev/null && tar xzf ./*.tgz)
    else
      git clone --quiet --depth 1 "https://github.com/$src.git" "$dir"
    fi
  fi
  [[ "$src" == npm:* ]] && dir="$dir/package"
  printf '%s' "$dir"
}

sync() {
  require_scanner
  [ -f "$SOURCES" ] || { log "Missing $SOURCES"; exit 1; }
  local cache; cache="$(mktemp -d)"
  trap 'rm -rf "$cache"' RETURN
  local ok=0 blocked=0 src path base name
  while read -r src path _; do
    [ -z "${src:-}" ] && continue
    [[ "$src" == \#* ]] && continue
    base="$(fetch_source "$src" "$cache")"
    if [ ! -f "$base/$path/SKILL.md" ]; then
      log "  ! $src $path: no SKILL.md there, skipped"
      continue
    fi
    name="$(basename "$path")"
    if check_skill "$base/$path" "$name"; then
      for dest in "$SKILLS_DIR" "$MIRROR_DIR"; do
        rm -rf "${dest:?}/$name"; mkdir -p "$dest"; cp -R "$base/$path" "$dest/$name"
      done
      rm -rf "${QUARANTINE:?}/$name"
      log "  ✔ $name  $GATE_RESULT  ($src)"
      ok=$((ok + 1))
    else
      rm -rf "${QUARANTINE:?}/$name"; mkdir -p "$QUARANTINE"; cp -R "$base/$path" "$QUARANTINE/$name"
      log "  ✘ $name  $GATE_RESULT  ($src)"
      log "      New version held in quarantine/$name; the previous version (if any) is kept."
      blocked=$((blocked + 1))
    fi
  done < "$SOURCES"
  log "Synced $ok skills. Blocked: $blocked."
}

# Prints the names of skills in skills/ that pass the gate; reports the rest on stderr.
passing_skills() {
  local skill name
  for skill in "$SKILLS_DIR"/*/; do
    name="$(basename "$skill")"
    if check_skill "$skill" "$name"; then echo "$name"; else log "  ✘ $name  $GATE_RESULT" >&2; fi
  done
}

install() {
  require_scanner
  local names found=0 home target
  names="$(passing_skills)"
  for entry in "${TARGETS[@]}"; do
    home="${entry%%|*}"; target="${entry#*|}"
    [ -d "$home" ] || continue
    mkdir -p "$target"
    while read -r name; do
      [ -n "$name" ] || continue
      rm -rf "${target:?}/$name"
      cp -R "$SKILLS_DIR/$name" "$target/$name"
    done <<< "$names"
    log "  ✔ $(grep -c . <<< "$names") skills -> $target"
    found=1
  done
  [ "$found" = 1 ] || log "No supported AI tool folders found (~/.claude, ~/.codex, ~/.gemini)."
}

scan() {
  require_scanner
  local skill name pass=0 fail=0
  for skill in "$SKILLS_DIR"/*/; do
    name="$(basename "$skill")"
    if check_skill "$skill" "$name"; then log "  ✔ $name  $GATE_RESULT"; pass=$((pass + 1))
    else log "  ✘ $name  $GATE_RESULT"; fail=$((fail + 1)); fi
  done
  log "Passed: $pass. Blocked: $fail."
  [ "$fail" = 0 ]
}

approve() { # $1=name $2=verdict $3=reason
  local name="${1:-}" verdict="${2:-}" reason="${3:-}" dir
  [ -n "$name" ] && [ -n "$reason" ] || { log 'Usage: approve <skill> <APPROVE|CAUTION> "<reason>"'; exit 1; }
  case "$verdict" in APPROVE|CAUTION) ;; *) log "Verdict must be APPROVE or CAUTION."; exit 1 ;; esac
  if [ -d "$QUARANTINE/$name" ]; then
    dir="$QUARANTINE/$name"
    record "$name" "$(hash_dir "$dir")" "$verdict" review "$reason"
    for dest in "$SKILLS_DIR" "$MIRROR_DIR"; do
      rm -rf "${dest:?}/$name"; mkdir -p "$dest"; cp -R "$dir" "$dest/$name"
    done
    rm -rf "$dir"
    log "  ✔ $name approved and moved from quarantine/ into skills/."
  elif [ -d "$SKILLS_DIR/$name" ]; then
    record "$name" "$(hash_dir "$SKILLS_DIR/$name")" "$verdict" review "$reason"
    log "  ✔ $name approved."
  else
    log "No skill named $name in skills/ or quarantine/."; exit 1
  fi
}

remove() { # $1=name
  local name="${1:-}" home target tmp
  [ -n "$name" ] || { log "Usage: remove <skill>"; exit 1; }
  case "$name" in */*|.|..) log "Give a skill folder name, not a path."; exit 1 ;; esac
  rm -rf "${SKILLS_DIR:?}/$name" "${MIRROR_DIR:?}/$name" "${QUARANTINE:?}/$name"
  for f in "$SOURCES" "$VERIFIED"; do
    [ -f "$f" ] || continue
    tmp="$(mktemp)"
    if [ "$f" = "$SOURCES" ]; then
      # Drop the source line whose skill folder name matches; keep comments and other lines.
      awk -v n="$name" '{ m = $2; sub(/.*\//, "", m) } !($1 !~ /^#/ && NF >= 2 && m == n)' "$f" > "$tmp"
    else
      awk -v n="$name" '$1 != n' "$f" > "$tmp"
    fi
    mv "$tmp" "$f"
  done
  for entry in "${TARGETS[@]}"; do
    home="${entry%%|*}"; target="${entry#*|}"
    [ -d "$target/$name" ] && rm -rf "${target:?}/$name" && log "  ✔ removed from $target"
  done
  log "  ✔ $name removed from the repo, skills-sources.txt and skills-verified.txt."
}

case "${1:-}" in
  sync) sync ;;
  install) install ;;
  update) sync; install ;;
  scan) scan ;;
  approve) shift; approve "$@" ;;
  remove) shift; remove "$@" ;;
  *) sed -n '2,/^set -euo/p' "$0" | sed '$d' | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
