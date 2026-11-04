# Universal Skills & Engineering Framework

This repository maintains agent skills and global rules configured for pair programming, full-stack software development, UI/UX excellence, engineering discipline, and autonomous agent workflows.

---

## The 6-Pillar Engineering Architecture

```
+--------------------------------------------------------------------------+
|                 1. TASTE SKILL (HIGHEST PRIORITY FOR UI/UX)              |
|        Anti-slop design: figma.com & x.ai level UI/UX, micro-interactions |
|        One section per screen, equal edges, real product UI & plain copy  |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                       2. SUPERPOWERS (Engineering Discipline)            |
|       Brainstorming -> Systematic Debugging -> TDD -> Evidence Verif     |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                       3. GITHUB SPEC KIT (SDD)                           |
|       Specification-Driven Development & Architectural Constitution       |
|   constitution -> specify -> clarify -> plan -> tasks -> converge        |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                         4. MAKEPLANE (Agile)                             |
|        Agile Tracking, Work Items, Cycles, Modules & PRs                 |
|        branch-name -> work-items -> cycles -> create-pr -> notes         |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                    5. GOOGLE GEMINI CLI (Engineering Standards)          |
|       Strict Engineering, Zero-Any Typing, Anti-Duplication,             |
|            Automated Code Reviews, Testing & Docs Standards              |
|    strict-rules -> code-reviewer -> duplication -> docs-writer           |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                         6. AGENTATION (Visual Feedback)                  |
|         Visual Feedback Toolbar, Element Selection & UI Annotation       |
|  agentation -> select any part of apps -> agentation-self-driving        |
+--------------------------------------------------------------------------+
```

---

## 1. Taste Skill (`taste-skill` / `design-taste-frontend`)
Sourced from [`Leonxlnx/taste-skill`](https://github.com/Leonxlnx/taste-skill.git).
* Primary UI/UX engine: `figma.com` & `x.ai` bar, anti-slop rules, one section per screen, quiet hover micro-interactions, responsive at 1440/1024/768/390.

---

## 2. Superpowers (`superpowers`)
Sourced from [`obra/superpowers`](https://github.com/obra/superpowers.git).

| Skill | Description | Usage |
|---|---|---|
| **`brainstorming`** | Explore alternatives, evaluate trade-offs, and clarify requirements before building. | Pre-Implementation |
| **`systematic-debugging`** | 4-phase investigation (reproduce, isolate root cause, hypothesize, targeted fix). | Debugging & Fixes |
| **`test-driven-development`** | Write failing test first, verify failure (Red), pass (Green), refactor. | Implementation |
| **`verification-before-completion`** | Enforces running commands and presenting output evidence before claiming done. | Quality Verification |
| **`writing-plans`** | Structure multi-step implementation plans before touching code. | Planning |
| **`executing-plans`** | Step-by-step plan execution discipline. | Plan Execution |
| **`subagent-driven-development`** | Dispatch subagents for independent tasks. | Subagent Scaling |
| **`dispatching-parallel-agents`** | Orchestrate multiple parallel agents without shared state conflicts. | Parallelism |
| **`using-git-worktrees`** | Create isolated git worktrees for clean branch development. | Git Isolation |
| **`finishing-a-development-branch`** | Guide branch verification and merge decisions. | Branch Completion |
| **`requesting-code-review`** | Self-review and prepare work for code review. | Code Review Prep |
| **`receiving-code-review`** | Technically evaluate and verify review suggestions before implementing. | Review Response |
| **`writing-skills`** | Create, test, and package new agent skills. | Skill Authoring |
| **`using-superpowers`** | Bootstrap and orchestrate superpowers skills. | Bootstrap |
| **`diagnosing-superpowers`** | Diagnose agent runs, repeated work, or skill firing issues. | Diagnostics |

---

## 3. GitHub Spec Kit (`spec-kit`)
Sourced from [`github/spec-kit`](https://github.com/github/spec-kit.git).
* Master SDD orchestrator (`spec-kit`, `speckit-constitution`, `speckit-specify`, `speckit-clarify`, `speckit-plan`, `speckit-checklist`, `speckit-tasks`, `speckit-analyze`, `speckit-implement`, `speckit-converge`).

---

## 4. MakePlane (`plane`)
Sourced from [`makeplane/plane`](https://github.com/makeplane/plane.git).
* Agile project management (`plane`, `branch-name`, `create-pull-request`, `react-doctor`, `release-notes`, `translate`).

---

## 5. Google Gemini CLI (`gemini-cli`)
Sourced from [`google-gemini/gemini-cli`](https://github.com/google-gemini/gemini-cli.git).
* Strict development rules, zero-any typing, code reviewer, review duplication, string reviewer, docs writer, ci, tui tester, behavioral evals.

---

## 6. Agentation (`agentation`)
Sourced from [`benjitaylor/agentation`](https://github.com/benjitaylor/agentation.git).
* Visual feedback toolbar, element selection, and autonomous UI critique.

---

## Global Integration Status
All six plugins (**`superpowers`**, **`taste-skill`**, **`spec-kit`**, **`plane`**, **`gemini-cli`**, and **`agentation`**) are installed globally under `~/.gemini/config/plugins/` and enabled machine-wide. Their global rules automatically activate whenever creating any applications, designing UI/UX, debugging, testing, planning, selecting UI elements, or executing software tasks.
