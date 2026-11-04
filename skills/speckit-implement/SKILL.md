---
name: speckit-implement
description: >-
  Execute the implementation plan by processing and executing all tasks defined in tasks.md
  strictly according to dependency order and acceptance criteria.
user_invocable: true
---

# Spec Kit: Implement

Executes tasks defined in `specs/<feature-name>/tasks.md` in strict phased sequence.

## Execution Rules

1. **Phase Discipline**:
   - Complete Phase 1 (Setup) and Phase 2 (Foundational) before touching any user story.
   - Execute user stories sequentially (P1 first, then P2, P3...) unless parallel capacity exists.
2. **Test-First Verification**:
   - When tests are specified, write the test first, verify failure, write implementation, verify success.
3. **Task Checkpoints**:
   - Check off completed tasks in `tasks.md` as they are finished.
   - At the end of each user story phase, validate independent functionality before advancing.
4. **No Drift**:
   - If an unexpected technical obstacle is encountered that requires architectural changes, update `plan.md` and `tasks.md` first before implementing.
