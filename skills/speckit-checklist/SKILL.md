---
name: speckit-checklist
description: >-
  Generate a requirements quality checklist ("unit tests for English") to validate
  clarity, completeness, and testability of specifications before implementation.
user_invocable: true
---

# Spec Kit: Checklist

Checklists in Spec Kit are **"unit tests for English"**—they validate that requirements are clear, testable, and complete across specific domains (security, performance, UX, edge cases).

> [!NOTE]
> Checklists test the **quality of the specification itself**, NOT whether the code passes tests.

## Checklist Categories

1. **Completeness**: Are all user journeys and error scenarios specified?
2. **Clarity**: Are requirements free of ambiguity and buzzwords?
3. **Testability**: Can each acceptance criterion be independently verified?
4. **Boundary & Edge Cases**: Are limits, invalid inputs, and network failures addressed?
5. **Constitutional Alignment**: Does the spec adhere to project principles?

## Output
Generated checklist stored at `specs/<feature-name>/checklists/<domain>.md`.
