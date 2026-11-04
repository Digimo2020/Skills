---
name: react-doctor
description: >-
  Use when finishing a feature, fixing a bug, before committing React code,
  or when the user asks to scan, triage, or clean up React diagnostics.
  Covers lint, accessibility, bundle size, architecture, and health regressions.
---

# React Doctor

Scans React codebases for security, performance, correctness, and architecture issues. Outputs a 0-100 health score.

## After making React code changes:

Run `npx react-doctor@latest --verbose --diff` and verify that the score did not regress.

If the score dropped, fix the regressions before committing.

## For general cleanup or code improvement:

Run `npx react-doctor@latest --verbose` (without `--diff`) to scan the full codebase. Fix issues by severity - errors first, then warnings.

## Common Commands

```bash
# Scan changed files vs base branch with verbose rule output
npx react-doctor@latest --verbose --diff

# Full workspace scan
npx react-doctor@latest --verbose

# Output only the numeric score
npx react-doctor@latest --score
```

| Flag        | Purpose                                       |
| ----------- | --------------------------------------------- |
| `.`         | Scan current directory                        |
| `--verbose` | Show affected files and line numbers per rule |
| `--diff`    | Only scan changed files vs base branch        |
| `--score`   | Output only the numeric score                 |
