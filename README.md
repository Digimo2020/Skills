# Universal Skills & Engineering Framework

This repository maintains agent skills and global rules configured for pair programming, full-stack software development, UI/UX excellence, engineering discipline, and autonomous agent workflows.

---

## Set Up on Any AI Tool (Copy This Prompt)

Paste the prompt below into any AI coding agent that can run terminal commands: Claude Code, Google Antigravity, Gemini CLI, OpenAI Codex, Cursor and similar. The same prompt works for a first install and for updates.

```text
Set up my agent skills from https://github.com/Digimo2020/Skills.

1. If ~/Skills does not exist, run: git clone https://github.com/Digimo2020/Skills.git ~/Skills
   If it exists, run: git -C ~/Skills pull
2. If the skillspector command is missing, install NVIDIA SkillSpector (needs uv):
   uv tool install git+https://github.com/NVIDIA/skillspector.git
   If it exists, update it: uv tool upgrade skillspector
3. Run: ~/Skills/scripts/skills.sh update
   This pulls the newest version of every upstream skill in skills-sources.txt, security-checks
   every new or changed skill with SkillSpector, and copies only the skills that pass into the
   AI tools on this machine (~/.claude/skills, ~/.agents/skills, ~/.gemini/skills,
   ~/.gemini/antigravity/skills).
4. If any skill is reported as BLOCKED, review it with the skill-inspector skill
   (the new version is in ~/Skills/quarantine/<skill>). Show me your verdict and evidence.
   Only after I agree, record it with:
   ~/Skills/scripts/skills.sh approve <skill> <APPROVE|CAUTION> "<reason>"
   Never approve a REJECT verdict.
5. If any files in ~/Skills changed, commit them with the message
   "chore: update upstream skills" and push to origin main.
6. Read ~/Skills/AGENTS.md and follow its rules for all work in this session.
7. Tell me which skills were added, updated or blocked, and anything that failed.
```

**Chat-only tools** (ChatGPT, Claude.ai, Gemini web) can't run terminal commands, so they can't use the prompt. Download a skill's folder from `skills/` as a zip and upload it wherever the app accepts skills or project files. For the rules alone, paste `AGENTS.md` into the custom instructions.

### Security Check (NVIDIA SkillSpector)

No skill reaches the repo or an AI tool without a security check:

1. [SkillSpector](https://github.com/NVIDIA/SkillSpector) statically scans the skill without running it (`--no-llm`, so file contents stay on your machine; only dependency names go to OSV.dev for known-vulnerability lookups).
2. `SAFE` or `CAUTION` passes. `DO_NOT_INSTALL` blocks the skill: a new skill is held in `quarantine/`, and an updated one keeps its previous version.
3. A blocked skill is reviewed with the **`skill-inspector`** skill, which reads the flagged source and gives an `APPROVE`, `CAUTION` or `REJECT` verdict. The scanner matches keywords, so documentation that mentions `.env` or tokens is often flagged without being dangerous.
4. Every verdict is stored with the skill's content hash in [`skills-verified.txt`](skills-verified.txt). If any file in a skill changes, the hash changes and the skill is checked again.

### Add or Update Skills

- **Add an upstream skill:** add one line to [`skills-sources.txt`](skills-sources.txt) (`owner/repo  path/to/skill`, or `npm:<package>  path/to/skill`), then run `./scripts/skills.sh sync` and push.
- **Add your own skill:** put its folder in `skills/` and run `./scripts/skills.sh scan`.
- **Pull the newest versions:** `./scripts/skills.sh sync` (repo only) or `./scripts/skills.sh update` (repo, then every AI tool on this machine).
- **Install on this machine only:** `./scripts/skills.sh install`.
- **Check every skill:** `./scripts/skills.sh scan`.

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

## 1. Frontend Agent Skills (`frontend-agent-skills`)
Sourced from [`hueyexe/frontend-agent-skills`](https://github.com/hueyexe/frontend-agent-skills.git).
Orchestrates the **Multi-Agent UX Debate & Synthesis Protocol**: every UI/UX decision is thoroughly argued across distinct viewpoints before synthesizing the best-of-the-best UX.

| Skill | Role in Multi-Agent Debate | Domain |
|---|---|---|
| **`frontend-agent-skills`** | Debate Moderator & Executive Synthesizer | Multi-Agent UX Orchestration |
| **`ux-usability-foundations`** | Usability & Cognitive Load Advocate | Feedback, affordances, error prevention |
| **`information-architecture-navigation`** | Information Architecture Advocate | Hierarchy, wayfinding, progressive disclosure |
| **`accessibility-inclusive-design`** | Accessibility & Inclusion Advocate | WCAG AA, keyboard navigation, focus rings |
| **`interaction-patterns-components`** | Interaction Patterns Advocate | Battle-tested UI primitives over modal traps |
| **`forms-inputs-checkout`** | Forms & Data Entry Advocate | Inline forms, validation on blur, error clarity |
| **`ui-visual-composition`** | Visual Layout & Hierarchy Advocate | Spacing rhythm, bento grids, balanced gutters |
| **`ux-writing-content-design`** | Content Design & Microcopy Advocate | Plain language, [Verb + Object] CTAs, recovery text |
| **`ux-research-discovery-testing`** | Research & Usability Testing Advocate | User testing protocols, cognitive walkthroughs |
| **`design-systems-frontend-architecture`** | Frontend Architecture Advocate | Token architecture, component contracts |

---

## 2. UI/UX Pro Max (`ui-ux-pro-max`)
Sourced from [`nextlevelbuilder/ui-ux-pro-max-skill`](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git).

| Skill | Description | Usage |
|---|---|---|
| **`ui-ux-pro-max`** | Design intelligence database: 79 UI styles, 192 product palettes, 74 font pairings, 119 UX guidelines across 22 stacks. | UI/UX Intelligence |
| **`ui-styling`** | Advanced UI styling tokens, CSS frameworks, Tailwind, and canvas fonts. | UI Styling |
| **`design`** | General visual design generation, responsive layouts, and aesthetic decisions. | Layout & Aesthetics |
| **`design-system`** | End-to-end design system generation (tokens, typography, color ramps, component guidelines). | Design Systems |
| **`brand`** | Brand identity, logo concepts, typography, tone of voice, visual identity guidelines. | Branding |
| **`slides`** | Presentation slides design, layouts, hierarchy, visual pacing. | Presentations |
| **`banner-design`** | Banner, hero, and promotional visual design. | Hero & Marketing |

---

## 3. Taste Skill (`taste-skill` / `design-taste-frontend`)
Sourced from [`Leonxlnx/taste-skill`](https://github.com/Leonxlnx/taste-skill.git).
* Primary UI/UX anti-slop engine: `figma.com` & `x.ai` bar, one section per screen, quiet hover micro-interactions, responsive at 1440/1024/768/390.

---

## 4. Superpowers (`superpowers`)
Sourced from [`obra/superpowers`](https://github.com/obra/superpowers.git).
* **Brainstorming first (`brainstorming`)**: Explore alternatives, evaluate trade-offs, and clarify requirements before building.
* **TDD (`test-driven-development`)**: Write failing tests first (Red), verify failure, implement minimal code (Green), and refactor.
* **Verification Before Completion (`verification-before-completion`)**: Evidence over assertions. Always run verification commands and verify output before claiming completion.
* **Systematic Debugging (`systematic-debugging`)**: 4-phase bug investigation (reproduce, isolate root cause, hypothesize, targeted fix).
* **Execution & Worktrees**: `writing-plans`, `executing-plans`, `using-git-worktrees`, `subagent-driven-development`.

---

## 5. GitHub Spec Kit (`spec-kit`)
Sourced from [`github/spec-kit`](https://github.com/github/spec-kit.git).
* Master SDD orchestrator (`spec-kit`, `speckit-constitution`, `speckit-specify`, `speckit-clarify`, `speckit-plan`, `speckit-checklist`, `speckit-tasks`, `speckit-analyze`, `speckit-implement`, `speckit-converge`).

---

## 6. Google Gemini CLI (`gemini-cli`)
Sourced from [`google-gemini/gemini-cli`](https://github.com/google-gemini/gemini-cli.git).
* Strict development rules, zero-any typing, code reviewer, review duplication, string reviewer, docs writer, ci, tui tester, behavioral evals.

---

## 7. Agentation (`agentation`)
Sourced from [`benjitaylor/agentation`](https://github.com/benjitaylor/agentation.git).
* Visual feedback toolbar, element selection, and autonomous UI critique.

---

## 8. Backend, Data, React, Browser & Security Skills (tracked upstream)
Kept current with `./scripts/skills.sh sync` from the sources in [`skills-sources.txt`](skills-sources.txt).

| Skill | Source | Domain |
|---|---|---|
| **`node`** | [`mcollina/skills`](https://github.com/mcollina/skills) | Node.js best practices |
| **`neon`** | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | Neon backend: Postgres, Auth, Storage, Functions, AI Gateway |
| **`neon-postgres`** | [`neondatabase/agent-skills`](https://github.com/neondatabase/agent-skills) | Neon Postgres connections, branching, migrations |
| **`supabase`** | [`supabase/agent-skills`](https://github.com/supabase/agent-skills) | Supabase platform |
| **`supabase-postgres-best-practices`** | [`supabase/agent-skills`](https://github.com/supabase/agent-skills) | Postgres performance & schema design |
| **`react-best-practices`** | [`vercel-labs/agent-skills`](https://github.com/vercel-labs/agent-skills) | React & Next.js performance |
| **`playwright-cli`** | [`@playwright/cli`](https://www.npmjs.com/package/@playwright/cli) | Browser automation & testing |
| **`skill-inspector`** | [`NVIDIA/SkillSpector`](https://github.com/NVIDIA/SkillSpector) | Security review of skills before install |

---

## Global Integration Status
All eight skill groups (**`frontend-agent-skills`**, **`ui-ux-pro-max`**, **`taste-skill`**, **`superpowers`**, **`spec-kit`**, **`gemini-cli`**, **`agentation`**, and the upstream backend/data skills) containing **67 skills** are installed globally under `~/.gemini/config/plugins/` and enabled machine-wide. Their global rules automatically activate whenever creating any applications, designing UI/UX, debating user flows, debugging, testing, planning, selecting UI elements, or executing software tasks.
