---
name: create-pull-request
description: >-
  Use when creating a pull request for the current branch - gathers branch context,
  generates a PR description following the repo's pull_request_template.md, and
  creates the PR with a Plane work item ID prefix in the title.
user_invocable: true
---

# Create PR

Create a pull request using the repo's PR template, a Plane work item ID as the title prefix, and a fully filled-out description based on the actual diff.

## Workflow

1. **Determine the base branch**: Default to `preview` (or `main`/`master` per repository conventions) unless the user specifies otherwise.

2. **Gather context** (in parallel):
   - `git status -s` - check for uncommitted changes
   - `git diff <base>...HEAD --stat` - files changed
   - `git log <base>...HEAD --oneline` - all commits on the branch
   - `git diff <base>...HEAD --no-color` - full diff for understanding changes
   - `git rev-parse --abbrev-ref --symbolic-full-name @{u}` - check if branch tracks a remote
   - Read `.github/pull_request_template.md` from the repo root if present

3. **Determine work item ID**:
   - Extract from branch name if it contains an identifier (e.g., `chore/silo-1146-foo` -> `SILO-1146`, `feat/web-1234-x` -> `WEB-1234`)
   - If not found in branch name, ask the user

4. **Draft the PR**:

   **Title**: `[WORK-ITEM-ID] <type>: <concise summary>` (under 70 chars)
   - Type reflects the change: `fix`, `feat`, `chore`, `refactor`, `docs`, `perf`, etc.

   **Body**: Fill in every section based on the actual diff:
   - **Description**: Clear, concise summary of what the PR does and why. Focus on the "what" and "why", not line-by-line changes. Mention important implementation decisions.
   - **Type of Change**: Check appropriate boxes (Bug fix, Feature, Improvement, Code refactoring, Performance improvements, Documentation update).
   - **Screenshots and Media**: Leave a placeholder: `<!-- Add screenshots here -->`
   - **Test Scenarios**: Concrete scenarios grounded in actual changes.
   - **References**: Include the work item ID and any linked issues.

5. **Push and create**:
   - Push branch with `-u` if no upstream is set
   - Create PR via `gh pr create` using a HEREDOC for the body

6. **Return the PR URL** to the user.

## Example Title

```text
[SILO-1146] fix: allow relative URLs for configuration_url and improve app tile visibility
```

## Guidelines

- Keep the description concise but informative.
- Use bullet points when listing multiple changes.
- Focus on user-facing impact, not implementation details.
- Don't fabricate test scenarios that aren't relevant to the actual changes.
