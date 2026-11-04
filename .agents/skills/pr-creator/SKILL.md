---
name: pr-creator
description: >-
  Use this skill when asked to create a pull request (PR). It ensures all PRs
  follow the repository's established templates, branch conventions, and standards.
user_invocable: true
---

# Pull Request Creator

Guides creation of high-quality pull requests adhering to repository templates, Conventional Commits, and test evidence standards.

## Workflow

1. **Branch Verification**:
   - Verify you are not working directly on `main` or `master`.
   - Ensure the branch follows the designated naming convention (`<type>/<description>` or `<type>/<work-item-id>-<description>`).
2. **Quality Pre-flight**:
   - Ensure linter, type checks, and tests pass before opening the PR.
3. **Drafting PR Details**:
   - **Title**: Follow Conventional Commits format (`feat: ...`, `fix: ...`, `chore: ...`).
   - **Summary**: Concise explanation of the problem, motivation, and solution.
   - **Testing Evidence**: Explicit commands executed and verification results.
4. **Submission**:
   - Use `gh pr create` with body populated via a HEREDOC.
