---
name: speckit-specify
description: >-
  Create or update the feature specification (spec.md) from a natural language feature description.
  Produces prioritized, independently testable user stories, acceptance criteria, and functional requirements.
user_invocable: true
---

# Spec Kit: Specify

Translate user requests and high-level ideas into an actionable, unambiguous feature specification at `specs/<feature-name>/spec.md`.

## Workflow

1. **Capture Feature Concept**:
   - Extract primary intent, user roles, and business value.
   - Assign feature branch name: `[###-feature-name]`.

2. **Structure Prioritized User Stories**:
   - Organize into distinct stories ordered by priority (`P1`, `P2`, `P3`...).
   - **P1 MUST represent the standalone MVP**: If only P1 is built, it provides usable, verifiable value.
   - For each story, provide:
     - Plain-language journey description
     - Priority rationale
     - Independent test scenario
     - Concrete acceptance criteria (**Given** [state], **When** [action], **Then** [outcome])

3. **Enumerate Requirements**:
   - Explicit functional requirements (`FR-001`, `FR-002`, ...).
   - Flag unclear items with `[NEEDS CLARIFICATION]`.
   - Data entities and relationships.

4. **Define Measurable Success Criteria**:
   - Technology-agnostic, quantifiable metrics (`SC-001`, `SC-002`, ...).

5. **Document Assumptions & Edge Cases**:
   - Explicitly list boundary conditions, error cases, and scope limits.
