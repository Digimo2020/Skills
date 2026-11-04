---
name: speckit-converge
description: >-
  Assess the current codebase against the feature's spec, plan, and tasks, then append
  any remaining unbuilt work as new tasks to tasks.md so implement can complete it.
user_invocable: true
---

# Spec Kit: Converge

Reconciles the implemented codebase against `spec.md`, `plan.md`, and `tasks.md` to eliminate drift and ensure complete feature delivery.

## Workflow

1. **Codebase Inspection**:
   - Compare actual files, exported symbols, endpoints, and UI screens against design documents.
2. **Gap Detection**:
   - Identify unbuilt acceptance criteria, missing edge case handlers, or broken contracts.
3. **Remediation**:
   - Generate structured remedial tasks and append them directly to `tasks.md`.
   - Update `spec.md` and `plan.md` if deliberate adjustments occurred during build.
4. **Final Sign-off**:
   - Verify all measurable success criteria (`SC-001`, ...) are satisfied before marking the feature complete.
