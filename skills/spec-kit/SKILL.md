---
name: spec-kit
description: >-
  Specification-Driven Development (SDD) master framework. Use whenever creating any new
  application, feature, or making architectural decisions. Guides the entire lifecycle:
  constitution gates, specification (spec.md), clarifying ambiguities, implementation planning
  (plan.md), task breakdown (tasks.md), cross-artifact analysis, structured implementation, and convergence.
user_invocable: true
---

# Spec Kit: Specification-Driven Development (SDD)

Spec Kit operationalizes the power inversion of modern software development: **Code serves specifications**. Specifications and implementation plans are the executable source of truth; code is the continuously generated and verified outcome.

---

## The SDD Lifecycle

Every application, feature, or major decision follows this 9-step progression:

```
1. CONSTITUTION  -> 2. SPECIFY   -> 3. CLARIFY   -> 4. PLAN
      |                                                |
      v                                                v
8. IMPLEMENT    <- 7. ANALYZE   <- 6. TASKS     <- 5. CHECKLIST
      |
      v
9. CONVERGE
```

---

## Phase Details & Associated Skills

### 1. Constitution & Architectural Gates (`speckit-constitution`)
- **Purpose**: Defines non-negotiable principles for the project.
- **Key Checks**:
  - *Article VII (Simplicity)*: Minimal structure (=3 projects/packages). Reject speculative future-proofing.
  - *Article VIII (Anti-Abstraction)*: Framework trust. Use framework features directly without gratuitous wrapper layers.
  - *Article IX (Integration-First)*: Real databases and services over isolated mocks.
- **Artifact**: `.specify/constitution.md`

### 2. Specification (`speckit-specify`)
- **Purpose**: Transform natural language requirements into an unambiguous, testable specification.
- **Key Contents**:
  - Prioritized user stories (P1 MVP, P2, P3...) with independent testability.
  - Acceptance scenarios in Given/When/Then format.
  - Functional requirements (`FR-001`, `FR-002`, ...).
  - Measurable success criteria (`SC-001`, ...).
- **Artifact**: `specs/<feature-name>/spec.md`

### 3. Clarification (`speckit-clarify`)
- **Purpose**: Identify ambiguities, missing assumptions, or edge cases.
- **Workflow**: Ask up to 5 focused, high-leverage multiple choice or clarifying questions before committing to technical architecture.

### 4. Technical Planning & Decisions (`speckit-plan`)
- **Purpose**: Map functional requirements to concrete architecture and technology selections.
- **Key Sections**:
  - Technical context (languages, frameworks, storage, platforms).
  - Project directory layout (concrete file trees).
  - Data models & API contracts (`contracts/`).
  - **Complexity Tracking**: Explicit justifications for any deviations from simplicity gates.
- **Artifact**: `specs/<feature-name>/plan.md`

### 5. Requirements Quality Checklist (`speckit-checklist`)
- **Purpose**: "Unit tests for English" - validate clarity, completeness, and boundary definitions of the specification before breaking down work.
- **Artifact**: `specs/<feature-name>/checklists/<domain>.md`

### 6. Task Decomposition (`speckit-tasks`)
- **Purpose**: Generate an actionable, dependency-ordered task breakdown grouped by user story.
- **Format**: `[ID] [P?] [Story] Description with exact file paths`
  - `[P]`: Denotes tasks that can execute in parallel.
  - Phase 1: Setup & tooling
  - Phase 2: Foundational (blocking prerequisites)
  - Phase 3: User Story 1 (P1 MVP)
  - Phase 4+: Incremental User Stories
- **Artifact**: `specs/<feature-name>/tasks.md`

### 7. Cross-Artifact Analysis (`speckit-analyze`)
- **Purpose**: Non-destructive consistency check across `spec.md`, `plan.md`, and `tasks.md`. Ensures no orphaned tasks, uncovered requirements, or constitution violations.

### 8. Structured Implementation (`speckit-implement`)
- **Purpose**: Systematic execution of tasks strictly following the dependency order.
- **Discipline**: Deliver User Story 1 (MVP) first, test independently, then proceed incrementally.

### 9. Convergence (`speckit-converge`)
- **Purpose**: Reconcile actual codebase state against specifications. Identify unimplemented requirements or deviations, and append catch-up tasks to `tasks.md`.

---

## When to Run Spec Kit Skills

- **Starting a new project or app**: Run `speckit-constitution` then `speckit-specify`.
- **Adding a feature**: Run `speckit-specify` -> `speckit-plan` -> `speckit-tasks`.
- **Making architectural decisions**: Review against `speckit-constitution` and record in `speckit-plan` Complexity Tracking.
- **Executing work**: Run `speckit-implement` followed by `speckit-converge`.
