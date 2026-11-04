---
name: plane
description: >-
  Manage Plane workspaces, work items, cycles, modules, and projects, or develop
  and maintain Plane-based codebases following official Plane architectural standards.
  Use when interacting with Plane via MCP or REST API, creating or triaging work items,
  managing project roadmaps, or working on Plane applications and services.
---

# Plane Project Management & Development

This skill provides full guidance for interacting with [Plane](https://plane.so) (the open-source project management platform) as well as developing applications within or modeled after Plane's codebase architecture.

---

## 1. Plane Project Management Workflow

Plane organizes work hierarchically:
- **Workspaces**: The organization boundary.
- **Projects**: Distinct products or teams (e.g., `WEB`, `API`, `MOBILE`).
- **Work Items**: The core unit of work (tasks, issues, bugs, features).
- **Modules / Epics**: Groupings of related work items that deliver a broader initiative.
- **Cycles**: Time-boxed iterations or sprints with clear start and end dates.
- **Intake**: Triage inbox for customer or stakeholder requests before promotion to backlog.

### Work Item Lifecycle & Fields
- **Identifier**: Combined project code and sequence number (e.g., `WEB-1234`).
- **States**: `backlog` -> `unstarted` -> `started` -> `completed` / `cancelled`.
- **Priorities**: `none`, `low`, `medium`, `high`, `urgent`.
- **Assignees & Estimates**: Member assignments and point estimates.

---

## 2. Model Context Protocol (MCP) Integration

Plane provides an official MCP server with 30 resource tools and over 200 operations.

### Transport Options

#### A. Hosted HTTP (OAuth)
```json
{
  "mcpServers": {
    "plane": {
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcp.plane.so/http/mcp"]
    }
  }
}
```

#### B. Hosted HTTP (Personal Access Token)
```json
{
  "mcpServers": {
    "plane": {
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcp.plane.so/http/api-key/mcp"],
      "headers": {
        "Authorization": "Bearer <PLANE_PAT>",
        "X-Workspace-slug": "<workspace-slug>"
      }
    }
  }
}
```

#### C. Local Subprocess (stdio with uvx)
Requires Python 3.10+ and `uv`:
```json
{
  "mcpServers": {
    "plane": {
      "command": "uvx",
      "args": ["plane-mcp-server", "stdio"],
      "env": {
        "PLANE_API_KEY": "<your-api-key>",
        "PLANE_WORKSPACE_SLUG": "<your-workspace-slug>",
        "PLANE_BASE_URL": "https://api.plane.so"
      }
    }
  }
}
```

### Common Tool Invocations
- **Create Work Item**:
  ```python
  workitem(action="create", project_id="<project-id>", name="Implement OAuth login", priority="high")
  ```
- **List / Query Work Items (Plane Query Language - PQL)**:
  ```python
  workitem(action="list", project_id="<project-id>", pql='state__group = "started" AND priority = "urgent"')
  ```
- **Manage Cycles**:
  ```python
  cycle(action="list", project_id="<project-id>")
  cycle(action="create", project_id="<project-id>", name="Sprint 42", start_date="2026-11-01", end_date="2026-11-14")
  ```
- **Manage Modules**:
  ```python
  module(action="list", project_id="<project-id>")
  ```

---

## 3. Plane Codebase Architecture & Standards

When building, extending, or maintaining Plane applications (or using Plane's repository template):

### Monorepo Structure
- `apps/web`: Next.js web application (port 3000).
- `apps/admin`: Next.js admin portal (port 3001).
- `apps/api`: Python / Django REST backend API.
- `packages/shared-state`: Reactive MobX stores for client-side state.
- `packages/blocks`: Composite UI components (`@plane/blocks/*`).
- `packages/i18n`: Internationalization dictionaries and CLDR pluralization rules.

### Core CLI Commands
- `pnpm dev`: Start all development servers.
- `pnpm build`: Build all packages and applications via Turbo.
- `pnpm check`: Run format, OxLint, and TypeScript type checks.
- `pnpm check:lint`: Run OxLint across all packages.
- `pnpm check:types`: Verify strict TypeScript types.
- `pnpm fix`: Auto-format (`oxfmt`) and auto-fix lint rules.
- `pnpm turbo run <command> --filter=<package>`: Target specific package or app.

### Backend Development with `uv`
- Dependencies are pinned in `apps/api/pyproject.toml` and `apps/api/uv.lock`.
- Environment setup: `cd apps/api && uv sync` (use `uv sync --inexact` in Docker).
- Running Django commands: `uv run python manage.py migrate`, `uv run python manage.py runserver`.
- Python linting: `uv run ruff check .`.
- Docker test stack:
  ```bash
  docker compose -f docker-compose-test.yml up --build --abort-on-container-exit --exit-code-from api-tests
  ```

---

## 4. Companion Skills & Workflows

Always pair this skill with the specialized Plane workflow skills:
1. **Branch Naming (`branch-name`)**:
   Format: `<type>/<work-item-id>-<short-description>`
2. **Pull Requests (`create-pull-request`)**:
   Title: `[WORK-ITEM-ID] <type>: <concise summary>`
3. **React Diagnostics (`react-doctor`)**:
   Scan with `npx react-doctor@latest --verbose --diff` before committing UI code.
4. **Release Notes (`release-notes`)**:
   Generate clean, user-facing markdown release notes following GitHub Releases conventions.
5. **Localization (`translate`)**:
   Maintain DNT (Do-Not-Translate) terms and CLDR plurals for translations.
