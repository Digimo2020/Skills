---
name: speckit-tasks
description: >-
  Generate an actionable, dependency-ordered tasks.md for a feature based on available
  design artifacts, grouped by user story to enable independent delivery.
user_invocable: true
---

# Spec Kit: Tasks

Generates `specs/<feature-name>/tasks.md` containing an ordered, dependency-aware execution plan grouped by user story.

## Format

```text
- [ ] T001 [P] [Story] Description with exact file path
```
- `[P]`: Parallelizable task (different files, no blocking dependencies).
- `[Story]`: User story tag (`[US1]`, `[US2]`, etc.) for direct traceability back to `spec.md`.

## Standard Phasing

1. **Phase 1: Setup (Shared Infrastructure)**: Initial project structure, config, tooling.
2. **Phase 2: Foundational (Blocking Prerequisites)**: Core models, database migrations, middleware. Must be complete before any user story begins.
3. **Phase 3: User Story 1 (P1 MVP)**:
   - Tests (written first to fail)
   - Models & services
   - Endpoints & UI
   - Checkpoint: Verify Story 1 functions independently.
4. **Phase 4+: Incremental User Stories**: Follow same pattern for `P2`, `P3`, etc.
5. **Phase N: Polish & Cross-Cutting**: Documentation, refactoring, performance tuning.
