# Universal Skills & Engineering Framework

This repository maintains agent skills and global rules configured for pair programming, full-stack software development, UI/UX excellence, element selection, and autonomous agent workflows.

---

## The Complete Engineering Architecture

```
+--------------------------------------------------------------------------+
|                 1. TASTE SKILL (HIGHEST PRIORITY FOR UI/UX)              |
|        Anti-slop design: figma.com & x.ai level UI/UX, micro-interactions |
|        One section per screen, equal edges, real product UI & plain copy  |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                       2. GITHUB SPEC KIT (SDD)                           |
|       Specification-Driven Development & Architectural Constitution       |
|   constitution -> specify -> clarify -> plan -> tasks -> converge        |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                         3. MAKEPLANE (Agile)                             |
|        Agile Tracking, Work Items, Cycles, Modules & PRs                 |
|        branch-name -> work-items -> cycles -> create-pr -> notes         |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                    4. GOOGLE GEMINI CLI (Engineering)                    |
|       Strict Engineering, Zero-Any Typing, Anti-Duplication,             |
|            Automated Code Reviews, Testing & Docs Standards              |
|    strict-rules -> code-reviewer -> duplication -> docs-writer           |
+--------------------------------------------------------------------------+
                                     |
                                     v
+--------------------------------------------------------------------------+
|                         5. AGENTATION (Visual Feedback)                  |
|         Visual Feedback Toolbar, Element Selection & UI Annotation       |
|  agentation -> select any part of apps -> agentation-self-driving        |
+--------------------------------------------------------------------------+
```

---

## 1. Taste Skill (`taste-skill` / `design-taste-frontend`)
Sourced from [`Leonxlnx/taste-skill`](https://github.com/Leonxlnx/taste-skill.git).

| Skill | Description | Usage |
|---|---|---|
| **`taste-skill`** | Primary UI/UX engine: figma.com & x.ai bar, anti-slop rules, one section per screen, quiet hover micro-interactions, responsive at 1440/1024/768/390. | UI/UX & Design |
| **`design-taste-frontend`** | Standard alias matching the official taste-skill package name for frontend builds. | Frontend Styling |

---

## 2. GitHub Spec Kit (`spec-kit`)
Sourced from [`github/spec-kit`](https://github.com/github/spec-kit.git).

| Skill | Description | Stage |
|---|---|---|
| **`spec-kit`** | Master SDD orchestrator for building apps, planning features, and architectural decisions. | Core Framework |
| **`speckit-constitution`** | Defines project non-negotiables, simplicity gates, and framework trust principles. | 1. Principles & Gates |
| **`speckit-specify`** | Creates testable specifications with prioritized user journeys (P1 MVP first). | 2. Requirements |
| **`speckit-clarify`** | Proactively identifies ambiguities and asks targeted questions to resolve underspecified areas. | 3. Clarification |
| **`speckit-plan`** | Produces technical architecture, directory trees, data schemas, and complexity tracking. | 4. Architecture |
| **`speckit-checklist`** | Generates requirements quality checklists ("unit tests for English"). | 5. Requirements Quality |
| **`speckit-tasks`** | Decomposes plan into dependency-ordered, parallelizable `[P]` tasks grouped by user story. | 6. Work Breakdown |
| **`speckit-analyze`** | Cross-artifact consistency audit between spec, plan, tasks, and constitution. | 7. Consistency |
| **`speckit-implement`** | Step-by-step phased execution of tasks starting with MVP user story. | 8. Execution |
| **`speckit-converge`** | Reconciles actual codebase state with specifications and appends gap-closing tasks. | 9. Convergence |

---

## 3. MakePlane (`plane`)
Sourced from [`makeplane/plane`](https://github.com/makeplane/plane.git).

| Skill | Description | Usage |
|---|---|---|
| **`plane`** | Full Plane workspace, work item, cycle, and module management + codebase architecture guide. | Project Management |
| **`branch-name`** | Enforces `<type>/<work-item-id>-<short-description>` branch naming conventions. | Git Branching |
| **`create-pull-request`** | Auto-generates structured pull requests with work item ID prefix, changelog, and test scenarios. | PR Creation |
| **`react-doctor`** | Scans React codebases for performance, security, and architecture issues (`npx react-doctor@latest`). | Pre-commit Audit |
| **`release-notes`** | Parses commit logs and generates clean, user-facing GitHub release notes. | Releases |
| **`translate`** | Manages i18n locales, preserves Do-Not-Translate (DNT) brand names, and enforces CLDR pluralization rules. | i18n |

---

## 4. Google Gemini CLI (`gemini-cli`)
Sourced from [`google-gemini/gemini-cli`](https://github.com/google-gemini/gemini-cli.git).

| Skill | Description | Usage |
|---|---|---|
| **`gemini-cli`** | Master engineering guide: strict typing, testing rules, decoupled architecture. | Architecture & Rules |
| **`code-reviewer`** | Conducts professional and thorough code reviews on local diffs and remote PRs. | Pre-commit / PR Review |
| **`review-duplication`** | Proactively searches for duplicated logic and eliminates reinvented wheels & AI slop. | Code Deduplication |
| **`string-reviewer`** | Reviews user-facing text, CLI copy, and error messages for clarity, brevity, and tone. | Copy & Localization |
| **`pr-creator`** | Creates standardized pull requests following Conventional Commits and test evidence. | PR Generation |
| **`docs-writer`** | Enforces technical writing standards, active voice, and clear documentation structure. | Documentation |
| **`docs-changelog`** | Compiles release changelogs from commits and PR metadata. | Release Prep |
| **`ci`** | Monitors GitHub Actions runs, triages failures, and replicates errors locally. | CI Diagnostics |
| **`tui-tester`** | Guides testing of terminal UI (TUI) behavior, rendering, and snapshots. | Terminal Testing |
| **`agent-tui`** | Programmatically drives terminal UI applications with automated keystroke injection. | TUI Automation |
| **`behavioral-evals`** | Validates agent decision-making, tool selection accuracy, and steerability. | Agent Evals |
| **`pr-address-comments`** | Systematically audits, verifies, fixes, and resolves review feedback on PRs. | Review Response |
| **`github-issue-creator`** | Creates well-structured GitHub issues using project templates and reproduction steps. | Issue Triage |

---

## 5. Agentation (`agentation`)
Sourced from [`benjitaylor/agentation`](https://github.com/benjitaylor/agentation.git).

| Skill | Description | Usage |
|---|---|---|
| **`agentation`** | Adds the Agentation visual feedback toolbar to React / Next.js apps to select elements, annotate pages, and connect to MCP. | UI Feedback Toolbar |
| **`agentation-self-driving`** | Autonomously drives browser sessions, inspects UI elements, and adds design feedback annotations via Agentation. | Visual Critique Mode |

---

## Global Integration Status
All five plugins (**`taste-skill`**, **`spec-kit`**, **`plane`**, **`gemini-cli`**, and **`agentation`**) are installed globally under `~/.gemini/config/plugins/` and enabled machine-wide. Their global rules automatically activate whenever creating any applications, designing UI/UX, making decisions, selecting UI elements, or executing software tasks.
