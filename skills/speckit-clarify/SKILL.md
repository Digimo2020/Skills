---
name: speckit-clarify
description: >-
  Identify underspecified areas in the feature spec by asking targeted clarification questions
  and encoding answers back into the specification.
user_invocable: true
---

# Spec Kit: Clarify

Identifies ambiguity, unstated assumptions, and missing edge cases in `spec.md` before proceeding to technical planning.

## Workflow

1. **Review Specification**:
   - Read `specs/<feature-name>/spec.md`.
   - Identify flagged `[NEEDS CLARIFICATION]` tags, underspecified boundaries, error paths, and missing data contracts.

2. **Formulate High-Leverage Questions**:
   - Limit to up to 5 concise, actionable questions.
   - Present concrete alternatives/options with trade-offs.
   - Focus on decisions that impact architecture, data models, or user experience.

3. **Encode Answers Back**:
   - Update `specs/<feature-name>/spec.md` with resolved decisions.
   - Remove `[NEEDS CLARIFICATION]` tags and document confirmed assumptions.
