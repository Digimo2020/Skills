#!/usr/bin/env bash
# Manage this repo's agent skills.
#
#   ./scripts/skills.sh sync      Pull the latest version of every skill listed in skills-sources.txt
#                                 into skills/ (and the .agents/skills mirror).
#   ./scripts/skills.sh install   Copy every skill in skills/ into the skill folders of the AI tools
#                                 found on this machine (Claude Code, Codex, Gemini CLI, Antigravity).
#   ./scripts/skills.sh update    sync, then install.
#
# Needs: bash, git. npm is needed only for npm: sources.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCES="$ROOT/skills-sources.txt"
SKILLS_DIR="$ROOT/skills"
MIRROR_DIR="$ROOT/.agents/skills"

# Skill folders used by each tool. A tool is skipped when its home folder does not exist.
#   tool-home-folder|skills-folder
TARGETS=(
  "$HOME/.claude|$HOME/.claude/skills"                          # Claude Code
  "$HOME/.codex|$HOME/.agents/skills"                           # OpenAI Codex CLI
  "$HOME/.gemini|$HOME/.gemini/skills"                          # Gemini CLI
  "$HOME/.gemini/antigravity|$HOME/.gemini/antigravity/skills"  # Google Antigravity
)

log() { printf '%s\n' "$*"; }

fetch_source() { # $1=source  $2=cache dir -> prints the folder holding the source's files
  local src="$1" cache="$2" dir
  dir="$cache/$(printf '%s' "$src" | tr '/:@' '___')"
  if [ ! -d "$dir" ]; then
    if [[ "$src" == npm:* ]]; then
      mkdir -p "$dir"
      (cd "$dir" && npm pack "${src#npm:}@latest" --silent >/dev/null && tar xzf ./*.tgz)
      dir="$dir/package"
    else
      git clone --quiet --depth 1 "https://github.com/$src.git" "$dir"
    fi
  elif [[ "$src" == npm:* ]]; then
    dir="$dir/package"
  fi
  printf '%s' "$dir"
}

sync() {
  [ -f "$SOURCES" ] || { log "Missing $SOURCES"; exit 1; }
  local cache; cache="$(mktemp -d)"
  trap 'rm -rf "$cache"' RETURN
  local count=0 src path base name
  while read -r src path _; do
    [ -z "${src:-}" ] && continue
    [[ "$src" == \#* ]] && continue
    base="$(fetch_source "$src" "$cache")"
    if [ ! -f "$base/$path/SKILL.md" ]; then
      log "  ! $src $path: no SKILL.md there, skipped"
      continue
    fi
    name="$(basename "$path")"
    for dest in "$SKILLS_DIR" "$MIRROR_DIR"; do
      rm -rf "${dest:?}/$name"
      mkdir -p "$dest"
      cp -R "$base/$path" "$dest/$name"
    done
    log "  ✔ $name  ($src)"
    count=$((count + 1))
  done < "$SOURCES"
  log "Synced $count skills from upstream into skills/."
}

install() {
  local found=0 home target name
  for entry in "${TARGETS[@]}"; do
    home="${entry%%|*}"; target="${entry#*|}"
    [ -d "$home" ] || continue
    mkdir -p "$target"
    for skill in "$SKILLS_DIR"/*/; do
      name="$(basename "$skill")"
      rm -rf "${target:?}/$name"
      cp -R "$skill" "$target/$name"
    done
    log "  ✔ $(ls -d "$SKILLS_DIR"/*/ | wc -l | tr -d ' ') skills -> $target"
    found=1
  done
  [ "$found" = 1 ] || log "No supported AI tool folders found (~/.claude, ~/.codex, ~/.gemini)."
}

case "${1:-}" in
  sync) sync ;;
  install) install ;;
  update) sync; install ;;
  *) sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
