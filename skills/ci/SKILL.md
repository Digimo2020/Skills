---
name: ci
description: >-
  Specialized skill for monitoring GitHub Actions workflows, triaging failures,
  and automatically replicating CI errors locally for fast diagnostic fix cycles.
user_invocable: true
---

# CI Monitoring & Local Replication

Automates monitoring remote CI pipelines (GitHub Actions) and replicating failures locally.

## Workflow

1. **Query Workflow Status**:
   - Inspect active runs for current branch via `gh run list --branch <branch-name>`.
2. **Triage Failed Jobs**:
   - Extract failure logs via `gh run view <run-id> --log-failed`.
3. **Local Replication**:
   - Identify the exact command that failed (e.g., `npm run test`, `pnpm check:types`, `pytest`).
   - Run the command locally in the workspace to reproduce the issue in an interactive debugging session.
4. **Fix & Verify**:
   - Apply fixes and verify locally before pushing changes.
