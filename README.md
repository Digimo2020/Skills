# Skills Repository

This repository maintains agent skills and global rules configured for pair programming and autonomous software development.

## 1. GitHub Spec Kit (`spec-kit`)
Sourced from [`github/spec-kit`](https://github.com/github/spec-kit.git) — Specification-Driven Development (SDD) framework.

| Skill | Description | Stage |
|---|---|---|
| **`spec-kit`** | Master SDD orchestrator for building apps, planning features, and making architectural decisions. | Core Framework |
| **`speckit-constitution`** | Defines project non-negotiables, simplicity gates, and framework trust principles (`constitution.md`). | 1. Principles & Gates |
| **`speckit-specify`** | Creates testable specifications with prioritized user journeys (P1 MVP) and Given/When/Then scenarios (`spec.md`). | 2. Requirements |
| **`speckit-clarify`** | Proactively identifies ambiguities and asks targeted questions to resolve underspecified areas. | 3. Clarification |
| **`speckit-plan`** | Produces technical architecture, directory trees, data schemas, and complexity tracking (`plan.md`). | 4. Architecture |
| **`speckit-checklist`** | Generates requirements quality checklists ("unit tests for English"). | 5. Requirements Quality |
| **`speckit-tasks`** | Decomposes plan into dependency-ordered, parallelizable `[P]` tasks grouped by user story (`tasks.md`). | 6. Work Breakdown |
| **`speckit-analyze`** | Cross-artifact consistency audit between spec, plan, tasks, and constitution. | 7. Consistency |
| **`speckit-implement`** | Step-by-step phased execution of tasks starting with MVP user story. | 8. Execution |
| **`speckit-converge`** | Reconciles actual codebase state with specifications and appends gap-closing tasks. | 9. Convergence |

---

## 2. MakePlane (`plane`)
Sourced from [`makeplane/plane`](https://github.com/makeplane/plane.git) — Project management, agile workflow, and code health.

| Skill | Description | Usage |
|---|---|---|
| **`plane`** | Full Plane workspace, work item, cycle, and module management + codebase architecture guide. | Project Management |
| **`branch-name`** | Enforces `<type>/<work-item-id>-<short-description>` branch naming conventions. | Git Branching |
| **`create-pull-request`** | Auto-generates structured pull requests with work item ID prefix, changelog, and test scenarios. | PR Creation |
| **`react-doctor`** | Scans React codebases for performance, security, and architecture issues (`npx react-doctor@latest`). | Pre-commit Audit |
| **`release-notes`** | Parses commit logs and generates clean, user-facing GitHub release notes. | Releases |
| **`translate`** | Manages i18n locales, preserves Do-Not-Translate (DNT) brand names, and enforces CLDR pluralization rules. | i18n |

---

## Global Integration Status
Both the **`spec-kit`** and **`plane`** plugins are installed globally under `~/.gemini/config/plugins/` and enabled machine-wide. Their global rules automatically activate whenever creating any applications, making architectural decisions, or executing software tasks.
