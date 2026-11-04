---
name: speckit-constitution
description: >-
  Create or update the project constitution from interactive or provided principle inputs.
  Defines core non-negotiable architectural gates, simplicity constraints, and testing standards.
user_invocable: true
---

# Spec Kit: Constitution

The project constitution defines the non-negotiable architectural principles that govern all specifications, technical plans, and generated code in the project.

## Core Principles

1. **Library-First**: Every distinct capability begins as a self-contained, testable library with a clear boundary.
2. **CLI / Inspectable Interface**: Capabilities expose clean, text-driven interfaces (supporting JSON and human-readable output) for observability.
3. **Test-First / Integration-First**: Validate real contracts with real dependencies (databases, services) over isolated, brittle mocks.
4. **Article VII - Simplicity Gate**:
   - Limit initial project structure to =3 packages/projects.
   - Forbid speculative future-proofing or premature abstraction.
5. **Article VIII - Anti-Abstraction & Framework Trust**:
   - Use framework features directly rather than wrapping them in custom proxy abstractions.
   - Single model representations where feasible.

## Workflow

1. Check if `.specify/constitution.md` exists.
2. If missing, initialize from the constitution template.
3. Review and ratify project-specific constraints (e.g., auth standards, database requirements, performance SLOs).
4. Any violation of constitutional principles in subsequent plans must be documented in the plan's **Complexity Tracking** table.
