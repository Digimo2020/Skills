---
name: review-duplication
description: >-
  Use this skill during code reviews or refactoring to proactively investigate the codebase
  for duplicated functionality, reinvented wheels, or failure to reuse existing project
  best practices and shared utilities.
user_invocable: true
---

# Review Duplication & Reuse

Audits newly introduced or existing code to eliminate redundant utilities, duplicate logic, and AI-generated boilerplate ("AI Slop").

## Audit Steps

1. **Scan New Additions**:
   - Inspect newly introduced utility functions, formatting helpers, validation routines, or string manipulators.
2. **Search the Codebase**:
   - Query project utility directories (e.g., `utils/`, `helpers/`, `shared/`, `core/utils/`) for identical or near-identical implementations.
   - Check if standard library or existing framework features already provide the capability natively.
3. **Refactor for Reuse**:
   - Replace duplicated blocks with imports from the established source of truth.
   - If a new helper is genuinely unique and generally useful, promote it to the shared utility layer with tests rather than keeping it ad-hoc.
