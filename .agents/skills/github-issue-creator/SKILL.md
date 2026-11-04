---
name: github-issue-creator
description: >-
  Use this skill when asked to create a GitHub issue. It handles issue types
  (bug, feature, task) using repository templates and ensures proper labeling.
user_invocable: true
---

# GitHub Issue Creator

Creates detailed, well-structured GitHub issues using project templates, triage labels, and reproducing steps.

## Workflow
1. Check repository issue templates under `.github/ISSUE_TEMPLATE/`.
2. Extract required reproduction steps, environment details, or user stories.
3. Create issue via `gh issue create --title "..." --body "..." --label "..."`.
