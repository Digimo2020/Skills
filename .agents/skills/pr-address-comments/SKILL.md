---
name: pr-address-comments
description: >-
  Use this skill to systematically review, verify, and address review comments
  on a Pull Request.
user_invocable: true
---

# Address PR Comments

Systematically audits review feedback, validates technical suggestions, implements required changes, and marks comment threads resolved.

## Workflow

1. **Fetch Comments**: Retrieve inline comments via `gh pr view <PR> --comments`.
2. **Technical Verification**: Evaluate each comment with technical rigor. Avoid blind compliance; verify whether suggestions are correct, necessary, or potentially introduce regressions.
3. **Implement Fixes**: Make targeted code changes addressing valid comments.
4. **Test & Verify**: Run affected unit/integration tests to ensure regressions are not introduced.
5. **Reply & Resolve**: Push commits and post concise explanations linking the resolution commit.
