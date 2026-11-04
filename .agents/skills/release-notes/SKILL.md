---
name: release-notes
description: >-
  Generate release notes for a release PR. Reads PR commits, filters out noise,
  categorizes by conventional-commit type (Features, Enhancements, Bug fixes, Security),
  and writes the result formatted for GitHub Releases.
user_invocable: true
---

# Release Notes Generator

Generate structured release notes from a release PR by parsing its commit list and updating the PR description. Output matches the format used on `github.com/makeplane/plane/releases`.

## Steps

### 1. Fetch commits
```bash
gh pr view <PR_NUM> --json title,body,baseRefName,headRefName,commits \
  --jq '.commits[] | .messageHeadline + "\n---BODY---\n" + .messageBody + "\n===END==="'
```

### 2. Filter out noise
Always exclude:
- Merge artifacts (`fix: merge conflicts`, `Merge branch '...'`)
- Cross-repo automated sync commits (`Sync: Enterprise Changes...`)
- Reverts that were immediately re-applied

### 3. Categorize commits
Map surviving commits into:
- `### ✨ Features`: Brand-new capabilities or major flows. Formatted with `#### **Feature Name**` and a 1-3 sentence user-facing paragraph.
- `### 🚀 Enhancements`: Bullet points describing improvements to existing features.
- `### 🐛 Bug fixes`: Bullet points describing what was broken and is now fixed.
- `### 🔒 Security`: Bullet points describing vulnerability mitigations or CVE upgrades.

### 4. Output Rules
- Write in product-marketing / user-facing voice.
- Do NOT include internal work item ticket IDs (e.g. `[WEB-1234]`) or PR numbers in the end-user release text.
- Drop empty sections entirely.
- Do NOT add a top-level `# Release` header (the release tag handles it).
