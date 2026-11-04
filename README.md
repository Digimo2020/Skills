# Skills Repository

This repository contains reusable skills and agent rules.

## Configured Skills (MakePlane / Plane)

Sourced from [`makeplane/plane`](https://github.com/makeplane/plane.git):

| Skill | Description | Invocable Command / Workflow |
|---|---|---|
| **`plane`** | Full Plane project management & development standard guide (work items, cycles, modules, architecture, uv backend, Next.js). | Interactive / Auto |
| **`branch-name`** | Enforces `<type>/<work-item-id>-<short-description>` branch naming conventions. | Slash command or git branch setup |
| **`create-pull-request`** | Auto-generates structured pull requests with work item ID prefix, changelog, and test scenarios. | PR creation |
| **`react-doctor`** | Scans React codebases for performance, security, and architecture issues (`npx react-doctor@latest`). | Pre-commit health check |
| **`release-notes`** | Parses commit logs and generates clean, user-facing GitHub release notes. | Release & tag creation |
| **`translate`** | Manages i18n locales, preserves Do-Not-Translate (DNT) brand names, and enforces CLDR pluralization rules. | i18n key updates |

## Global Rule Configuration

The Plane plugin has been installed globally under `~/.gemini/config/plugins/plane/` and is active machine-wide across all projects and sessions.
The global rules in `~/.gemini/config/plugins/plane/rules/AGENTS.md` instruct the agent to automatically apply these architectural standards, workflows, and skills across all project sessions.
