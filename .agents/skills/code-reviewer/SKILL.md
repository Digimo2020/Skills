---
name: code-reviewer
description: >-
  Use this skill to review code. It supports both local changes (staged or working tree)
  and remote Pull Requests (by ID or URL). It focuses on correctness, maintainability,
  and adherence to project standards.
user_invocable: true
---

# Code Reviewer

Conducts rigorous and structured code reviews for local changes and remote pull requests.

## Workflow

### 1. Determine Review Target
- **Remote PR**: Provide PR number or URL (e.g., `gh pr checkout <PR_NUMBER>`).
- **Local Changes**: Inspect staged and unstaged working tree diffs via `git diff` / `git diff --staged`.

### 2. Review Checklist

#### A. Correctness & Logic
- Are edge cases, empty states, and boundary values handled?
- Are errors typed, captured, and reported gracefully without crashes?
- Are asynchronous operations and promises properly awaited and error-handled?

#### B. Architectural Alignment & Anti-Duplication
- Does this change belong in this package/module?
- Are existing helpers, services, or shared utilities reused instead of introducing duplicates?
- Are package boundaries respected?

#### C. Code Hygiene & TypeScript
- Is typing strict? (No unwarranted `any` or loose `unknown`).
- Are switches exhaustive?
- Are there leftover `console.log` statements or commented-out code blocks?

#### D. Tests & Stability
- Are unit/integration tests included or updated?
- Are tests deterministic? (No hardcoded delays or brittle mocks).
