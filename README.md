# Universal Skills & Engineering Framework

A public collection of **85 agent skills** and global rules for full-stack development, UI/UX, engineering discipline and autonomous agent workflows. One prompt installs them into any AI coding tool, and every skill is security-checked with [NVIDIA SkillSpector](https://github.com/NVIDIA/SkillSpector) before it is used.

**Contents:** [Quick Start](#quick-start-copy-this-prompt) · [Directions](#directions) · [Command Reference](#command-reference) · [Repo Layout](#repo-layout) · [Lifecycle](#the-unified-development-lifecycle) · [UI & UX Standards](#global-ui--ux-development-standards-v10---2026-11-04) · [Skill Catalog](#skill-catalog)

---

## Quick Start (Copy This Prompt)

Paste this into any AI coding agent that can run terminal commands: Claude Code, Google Antigravity, Gemini CLI, OpenAI Codex, Cursor and similar. It works for a first install and for every update.

```text
Set up my agent skills from https://github.com/Digimo2020/Skills.

1. Get the repo:
   - If ~/Skills exists, run: git -C ~/Skills pull
   - Otherwise run: git clone https://github.com/Digimo2020/Skills.git ~/Skills
2. Make sure NVIDIA SkillSpector is installed (needs uv):
   - If the skillspector command is missing: uv tool install git+https://github.com/NVIDIA/skillspector.git
   - Otherwise: uv tool upgrade skillspector
3. Run: ~/Skills/scripts/skills.sh update
   This pulls the newest version of every upstream skill, security-checks every new or changed
   skill, and installs only the skills that pass into the AI tools on this machine.
4. If any skill is reported as BLOCKED, review it with the skill-inspector skill
   (the new version is in ~/Skills/quarantine/<skill>). Show me your verdict and evidence.
   Only after I agree, record it with:
   ~/Skills/scripts/skills.sh approve <skill> <APPROVE|CAUTION> "<reason>"
   Never approve a REJECT verdict.
5. If any files in ~/Skills changed and I have push access to that repo, commit them with the
   message "chore: update upstream skills" and push to origin main. Otherwise skip this step.
6. Read ~/Skills/AGENTS.md and follow its rules for all work in this session.
7. Tell me which skills were added, updated or blocked, and anything that failed.
```

**Chat-only apps** (ChatGPT, Claude.ai, Gemini web) can't run terminal commands. Download a skill folder from `skills/` as a zip and upload it wherever the app accepts skills or project files, or paste `AGENTS.md` into the custom instructions.

---

## Directions

### 1. Set Up a New Machine

The quick-start prompt does all of this. To do it by hand:

1. **Clone the repo** (no GitHub account needed):
   ```bash
   git clone https://github.com/Digimo2020/Skills.git ~/Skills
   ```
2. **Install SkillSpector** (needs [uv](https://docs.astral.sh/uv/)):
   ```bash
   uv tool install git+https://github.com/NVIDIA/skillspector.git
   ```
3. **Check and install all skills:**
   ```bash
   ~/Skills/scripts/skills.sh install
   ```

Skills are copied into each AI tool found on the machine:

| Tool | Skill folder |
|---|---|
| Claude Code | `~/.claude/skills` |
| OpenAI Codex | `~/.agents/skills` |
| Gemini CLI | `~/.gemini/skills` |
| Google Antigravity | `~/.gemini/antigravity/skills` |

Restart the tool or open a new session to pick up new skills.

### 2. Security Check

No skill reaches the repo or an AI tool without passing this check:

1. **Scan.** SkillSpector statically scans the skill without running it. Scans use `--no-llm`, so file contents stay on your machine; only dependency names go to OSV.dev to look up known vulnerabilities.
2. **Gate.** `SAFE` or `CAUTION` passes. `DO_NOT_INSTALL` blocks the skill: a new skill is held in `quarantine/`, and an updated skill keeps its previous version.
3. **Review.** A blocked skill is reviewed with the **`skill-inspector`** skill, which reads the flagged source and gives an `APPROVE`, `CAUTION` or `REJECT` verdict with evidence. The scanner matches keywords, so documentation that mentions `.env` or tokens is often flagged without being dangerous.
4. **Approve.** After you agree with the verdict, record it:
   ```bash
   ./scripts/skills.sh approve <skill> <APPROVE|CAUTION> "<reason>"
   ```
5. **Re-check on change.** Every verdict is stored with the skill's content hash in [`skills-verified.txt`](skills-verified.txt). If any file in a skill changes, it is checked again.

To check every skill now:
```bash
./scripts/skills.sh scan
```

### 3. Update

Pull the newest version of every upstream skill, check them, and reinstall on this machine:
```bash
cd ~/Skills && git pull && ./scripts/skills.sh update
```
If you own the repo (or a fork), commit and push any changes so your other machines get them. To update only the repo without installing, use `./scripts/skills.sh sync`.

### 4. Add or Remove Skills

- **Add an upstream skill:** add one line to [`skills-sources.txt`](skills-sources.txt), then sync and push:
  ```text
  owner/repo            path/to/skill-folder
  npm:<package-name>    path/to/skill-folder
  ```
  ```bash
  ./scripts/skills.sh sync
  ```
- **Add your own skill:** put its folder (with a `SKILL.md`) in `skills/`, then run `./scripts/skills.sh scan` and `./scripts/skills.sh install`.
- **Remove a skill:** this deletes it from the repo, `skills-sources.txt`, `skills-verified.txt` and every AI tool on this machine:
  ```bash
  ./scripts/skills.sh remove <skill>
  ```

Commit and push after any change.

---

## Command Reference

| Command | What it does |
|---|---|
| `./scripts/skills.sh update` | `sync`, then `install` |
| `./scripts/skills.sh sync` | Pull the newest upstream skills into the repo, checking each one |
| `./scripts/skills.sh install` | Check every skill, then install the ones that pass into all AI tools |
| `./scripts/skills.sh scan` | Check every skill and print the result; changes nothing else |
| `./scripts/skills.sh approve <skill> <APPROVE\|CAUTION> "<reason>"` | Record a reviewed verdict for a blocked skill |
| `./scripts/skills.sh remove <skill>` | Delete a skill everywhere |

---

## Repo Layout

| Path | Purpose |
|---|---|
| `skills/` | Every skill, one folder each with a `SKILL.md` |
| `.agents/skills/` | Mirror of `skills/` for tools that read `.agents/skills` |
| `skills-sources.txt` | Upstream source of each tracked skill |
| `skills-verified.txt` | Security verdict and content hash for each skill |
| `scripts/skills.sh` | Sync, check, install, approve and remove skills |
| `quarantine/` | Blocked skills waiting for review (not committed) |
| `AGENTS.md` | Global rules every agent follows |

---

## The Unified Development Lifecycle

Whenever creating or modifying any apps, features, or software, execute across the integrated system in strict order:

```
+--------------------------------------------------------------------------+
| 1. START HERE: SUPERPOWERS (Engineering & Agent Discipline)              |
|    Mandatory Brainstorming -> Multi-Step Planning -> TDD First           |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
| 2. GITHUB SPEC KIT (Planning & Specifications)                           |
|    Constitution & Gates -> Specify -> Clarify -> Plan -> Tasks           |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
| 3. MULTI-AGENT UX DEBATE & SYNTHESIS (Frontend Agent Skills)             |
|    Adversarial debate across 6 specialized perspectives:                 |
|    Usability • Information Architecture • Accessibility • Interactions   |
|    Visual Anti-Slop • Content Design -> Best-of-the-Best UX Synthesis    |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
| 4. UI/UX PRO MAX & TASTE SKILL (Ultra-Modern UI/UX Excellence)           |
|    79 UI Styles • 192 Palettes • 74 Font Pairings • 119 UX Guidelines    |
|    figma.com & x.ai bar • Anti-slop • One section/screen • Real assets   |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
| 5. GOOGLE GEMINI CLI (Engineering Standards & Quality)                   |
|    Strict Types -> Deterministic Tests -> Anti-Duplication -> Docs       |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
| 6. AGENTATION (Visual Feedback Toolbar & Element Selection)              |
|    Click to select any UI element -> Exact DOM selectors -> MCP sync     |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
| 7. EVIDENCE-BASED VERIFICATION & CODE REVIEW                             |
|    Complete Journey Testing -> verification-before-completion ->         |
|    review-duplication -> code-reviewer                                   |
+--------------------------------------------------------------------------+
```

---

## Global UI & UX Development Standards (v1.0) - 2026-11-04

Apply these standards whenever creating, modifying or reviewing any software interface:

1. **Always use UI UX Pro Max for visual design and design-system decisions.**
2. **Use UX usability and information architecture skills to evaluate the actual user experience.**
3. **Understand the target users and their tasks before designing.**
4. **Never prioritise visual beauty over usability.**
5. **Keep navigation, menus, forms, buttons and workflows clear and predictable.**
6. **Use consistent branding, typography, spacing, colours and reusable components.**
7. **Every action must provide clear feedback, including loading, success, error and empty states.**
8. **Minimise unnecessary clicks, pop-ups and confusing interactions.**
9. **Make interfaces responsive across desktop, tablet and mobile.**
10. **Follow accessibility standards, including keyboard navigation, readable contrast and clear focus states.**
11. **Test complete user journeys, not just individual screens.**
12. **Review the finished interface for usability problems before considering the work complete.**
13. **Preserve the existing application architecture, functionality and branding.**
14. **Create reusable design components so the same design standards can be applied to future applications.**

> **FINAL PRINCIPLE**:  
> **Build software that looks professional, feels natural and is easy for people to understand without needing instructions.**

---

## Skill Catalog

All 85 skills by group. Groups 8 to 11 are tracked upstream: `sync` pulls their newest versions and security-checks them.

### 1. Frontend Agent Skills: Multi-Agent UX Debate (10)
Source: [`hueyexe/frontend-agent-skills`](https://github.com/hueyexe/frontend-agent-skills). Every UI/UX decision is argued from distinct viewpoints before the best UX is synthesized.

| Skill | What it does |
|---|---|
| `frontend-agent-skills` | Debate moderator and synthesizer |
| `ux-usability-foundations` | Feedback, affordances, error prevention |
| `information-architecture-navigation` | Hierarchy, wayfinding, progressive disclosure |
| `accessibility-inclusive-design` | WCAG AA, keyboard navigation, focus states |
| `interaction-patterns-components` | Proven UI patterns over modal traps |
| `forms-inputs-checkout` | Inline forms, validation, clear errors |
| `ui-visual-composition` | Spacing rhythm, grids, visual hierarchy |
| `ux-writing-content-design` | Plain language, clear calls to action |
| `ux-research-discovery-testing` | User testing and cognitive walkthroughs |
| `design-systems-frontend-architecture` | Design tokens and component contracts |

### 2. UI/UX Pro Max (7)
Source: [`nextlevelbuilder/ui-ux-pro-max-skill`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)

| Skill | What it does |
|---|---|
| `ui-ux-pro-max` | 79 UI styles, 192 palettes, 74 font pairings, 119 UX guidelines across 22 stacks |
| `ui-styling` | Styling tokens, CSS frameworks, Tailwind |
| `design` | Visual design, logos and responsive layouts |
| `design-system` | Full design systems: tokens, type, colour, components |
| `brand` | Brand identity, voice and visual guidelines |
| `slides` | Presentation design and pacing |
| `banner-design` | Banners, heroes and promotional visuals |

### 3. Taste Skill (2)
Source: [`Leonxlnx/taste-skill`](https://github.com/Leonxlnx/taste-skill)

| Skill | What it does |
|---|---|
| `taste-skill` | Anti-slop UI engine: one section per screen, quiet micro-interactions, responsive at 1440/1024/768/390 |
| `design-taste-frontend` | Frontend variant of the same taste system |

### 4. Superpowers: Engineering Discipline (15)
Source: [`obra/superpowers`](https://github.com/obra/superpowers)

| Skill | What it does |
|---|---|
| `using-superpowers` | How to find and use skills at the start of every session |
| `brainstorming` | Explore alternatives and clarify intent before building |
| `writing-plans` | Break multi-step work into phases |
| `executing-plans` | Carry out a written plan step by step |
| `test-driven-development` | Red, green, refactor |
| `systematic-debugging` | Reproduce, isolate the root cause, fix |
| `verification-before-completion` | Evidence before claiming work is done |
| `subagent-driven-development` | Delegate plan steps to subagents |
| `dispatching-parallel-agents` | Run independent tasks in parallel |
| `using-git-worktrees` | Isolated work in git worktrees |
| `finishing-a-development-branch` | Decide how to merge finished work |
| `requesting-code-review` | Ask for review before merging |
| `receiving-code-review` | Weigh review feedback before acting on it |
| `writing-skills` | Create and test new skills |
| `diagnosing-superpowers` | Find out why a session went wrong |

### 5. GitHub Spec Kit: Specification-Driven Development (10)
Source: [`github/spec-kit`](https://github.com/github/spec-kit). Order: constitution, specify, clarify, plan, checklist, tasks, analyze, implement, converge.

| Skill | What it does |
|---|---|
| `spec-kit` | Orchestrates the spec-driven workflow |
| `speckit-constitution` | Project principles and gates |
| `speckit-specify` | Write the feature spec |
| `speckit-clarify` | Resolve open questions in the spec |
| `speckit-plan` | Technical plan |
| `speckit-checklist` | Quality checklist for the spec |
| `speckit-tasks` | Break the plan into tasks |
| `speckit-analyze` | Check spec, plan and tasks agree |
| `speckit-implement` | Build from the tasks |
| `speckit-converge` | Reconcile the build with the spec |

### 6. Google Gemini CLI: Engineering Standards & Review (13)
Source: [`google-gemini/gemini-cli`](https://github.com/google-gemini/gemini-cli)

| Skill | What it does |
|---|---|
| `gemini-cli` | Strict development rules and zero-`any` typing |
| `code-reviewer` | Review local changes or a remote PR |
| `review-duplication` | Find duplicated or reinvented code |
| `string-reviewer` | Review user-facing text |
| `docs-writer` | Write and edit technical docs |
| `docs-changelog` | Generate release changelogs |
| `pr-creator` | Create PRs that follow repo conventions |
| `pr-address-comments` | Work through PR review comments |
| `github-issue-creator` | Create well-formed GitHub issues |
| `ci` | Monitor and fix GitHub Actions failures |
| `behavioral-evals` | Create and run behavioral evaluations |
| `agent-tui` | Drive terminal UI apps programmatically |
| `tui-tester` | Test terminal UI rendering and behavior |

### 7. Agentation: Visual Feedback (2)
Source: [`benjitaylor/agentation`](https://github.com/benjitaylor/agentation)

| Skill | What it does |
|---|---|
| `agentation` | Toolbar to click and select any UI element, with exact selectors |
| `agentation-self-driving` | Autonomous UI critique in a browser |

### 8. Backend & Data (11, tracked upstream)

| Skill | Source | What it does |
|---|---|---|
| `node` | [`mcollina/skills`](https://github.com/mcollina/skills) | Node.js best practices |
| `fastify` | [`mcollina/skills`](https://github.com/mcollina/skills) | Fastify APIs: plugins, hooks, auth, config |
| `typescript-magician` | [`mcollina/skills`](https://github.com/mcollina/skills) | Advanced TypeScript types and inference |
| `neon` | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | Neon backend: Postgres, Auth, Storage, Functions, AI Gateway |
| `neon-postgres` | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | Neon Postgres connections, branching, migrations |
| `neon-auth` | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | Login, users and sessions on Neon |
| `neon-functions` | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | Long-running serverless functions on Neon |
| `neon-object-storage` | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | S3-compatible file storage that branches with your database |
| `supabase` | [`supabase/agent-skills`](https://github.com/supabase/agent-skills) | Supabase platform |
| `supabase-postgres-best-practices` | [`supabase/agent-skills`](https://github.com/supabase/agent-skills) | Postgres performance and schema design |
| `mcp-builder` | [`anthropics/skills`](https://github.com/anthropics/skills) | Build and evaluate MCP servers |

### 9. React, Web & Design (7, tracked upstream)

| Skill | Source | What it does |
|---|---|---|
| `react-best-practices` | [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | React and Next.js performance |
| `composition-patterns` | [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | React component composition |
| `react-view-transitions` | [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | Page and element transitions in React |
| `web-design-guidelines` | [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | Review UI against web design guidelines |
| `frontend-design` | [`anthropics/skills`](https://github.com/anthropics/skills) | Distinctive, non-generic frontend design |
| `web-perf` | [`cloudflare/skills`](https://github.com/cloudflare/skills) | Web performance and Core Web Vitals |
| `figma-implement-design` | [`openai/skills`](https://github.com/openai/skills) | Turn Figma designs into code (governed by the [Figma Developer Terms](https://www.figma.com/legal/developer-terms/), not open source) |

### 10. Testing, Code Quality & Security (6, tracked upstream)

| Skill | Source | What it does |
|---|---|---|
| `playwright-cli` | [`@playwright/cli`](https://www.npmjs.com/package/@playwright/cli) | Browser automation and testing |
| `webapp-testing` | [`anthropics/skills`](https://github.com/anthropics/skills) | Test web apps with Playwright |
| `find-bugs` | [`getsentry/skills`](https://github.com/getsentry/skills) | Hunt for bugs in code |
| `code-simplifier` | [`getsentry/skills`](https://github.com/getsentry/skills) | Simplify and clean up code |
| `security-review` | [`getsentry/skills`](https://github.com/getsentry/skills) | Security review of code (OWASP-based) |
| `skill-inspector` | [`NVIDIA/SkillSpector`](https://github.com/NVIDIA/SkillSpector) | Security review of skills before install |

### 11. Payments & Deployment (2, tracked upstream)

| Skill | Source | What it does |
|---|---|---|
| `stripe-best-practices` | [`stripe/ai`](https://github.com/stripe/ai) | Stripe payments done correctly |
| `deploy-to-vercel` | [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | Deploy apps to Vercel |
