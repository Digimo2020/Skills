---
name: speckit-plan
description: >-
  Execute implementation planning using the plan template to generate design artifacts,
  technical architecture, concrete directory structures, and constitution gate verifications.
user_invocable: true
---

# Spec Kit: Plan

Transforms the functional requirements of `spec.md` into concrete technical architecture and design artifacts at `specs/<feature-name>/plan.md`.

## Workflow

1. **Constitution Gates**:
   - Check compliance against `.specify/constitution.md`.
   - Verify simplicity (Article VII) and framework trust (Article VIII).
   - If any violation is necessary, log it in **Complexity Tracking** with explicit rationale.

2. **Technical Context**:
   - Define exact languages, runtimes, dependencies, storage solutions, and test frameworks.
   - Establish performance targets and operational constraints.

3. **Project Layout**:
   - Define the concrete file and directory structure for the implementation (e.g. `src/`, `tests/`, or `apps/`, `packages/`).

4. **Data Models & Contracts**:
   - Generate schema definitions and interface contracts in `specs/<feature-name>/contracts/`.
   - Document entities, relationships, and invariants.

5. **Quickstart & Developer Experience**:
   - Outline local setup, build commands, and execution instructions.
