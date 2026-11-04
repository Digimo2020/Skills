# Plane Global Engineering & Workflow Rules

These rules apply globally across all sessions, projects, application creation, and coding tasks.
Follow Plane's architectural, engineering, and project management standards automatically as per project requirements.

## 1. Project Management & Task Structure
- **Decompose Work into Work Items**: For any non-trivial feature or project, break down work into discrete, trackable work items (initiatives, modules/epics, and work items/tasks).
- **Track Progress and States**: Keep work items categorized by state (`backlog`, `unstarted`, `started`, `completed`, `cancelled`) with clear priority (`urgent`, `high`, `medium`, `low`).
- **Plane Tool Integration**: When a Plane workspace or Plane MCP server is available, leverage it to read/create work items, manage cycles, and update issue states rather than maintaining ad-hoc scratchpads.

## 2. Git & Version Control Conventions
- **Branch Naming**: When creating or switching branches, strictly follow the format:
  `<type>/<work-item-id>-<short-description>`
  - Types: `feat`, `fix`, `chore`, `refactor`, `docs`, `perf`.
  - Work item ID: lowercased identifier (e.g., `web-1024`, `api-404`).
  - Short description: 2-5 kebab-case words describing the *outcome* (e.g., `feat/web-1024-user-auth-modal`).
  - Refer to the `branch-name` skill for the complete convention.
- **Pull Request Creation**:
  - Title: `[WORK-ITEM-ID] <type>: <concise summary>` (under 70 chars).
  - Body: Follow the structured pull request template: Description, Type of Change, Test Scenarios, and References.
  - Refer to the `create-pull-request` skill.
- **Release Notes**:
  - When generating release notes, parse commit logs, filter out noise/merge commits, categorize by features/enhancements/fixes/security, and write in user-facing product language without internal ticket IDs or raw PR numbers.
  - Refer to the `release-notes` skill.

## 3. Engineering & Code Quality Standards
- **Strict Typing**: TypeScript strict mode must be enabled for all TypeScript/JavaScript projects. Explicit types for function signatures, interfaces, and state stores.
- **Modern Monorepo & Dependencies**:
  - Internal packages use `workspace:*`, external dependencies use catalog or exact pinned versions.
  - Preferred package management: `pnpm` with Turborepo (`turbo`).
  - Tooling commands:
    - Run checks: `pnpm check`, `pnpm check:lint`, `pnpm check:types`
    - Auto-fix issues: `pnpm fix`, `pnpm fix:format`
- **Frontend & React Standards**:
  - Modular UI architecture: Separate UI primitives from composite/feature components.
  - State management: Use clean, reactive store patterns (such as MobX or lightweight reactive stores) with distinct actions and observable state.
  - Code health verification: Run `npx react-doctor@latest --verbose --diff` before committing React changes. Ensure health scores do not regress.
- **Backend (Python) Standards**:
  - Dependency management: Always use `uv` with `pyproject.toml` and pinned `uv.lock`.
  - Linting & formatting: Enforce `ruff` rules.
  - Local setup: `uv sync` (use `uv sync --inexact` inside development containers).
  - Running tools: `uv run python manage.py ...`, `uv run ruff check .`.
- **Internationalization (i18n)**:
  - When writing user-facing strings, ensure support for localization keys.
  - Maintain Do-Not-Translate (DNT) terms for brand names (Plane, Power K, etc.) and adhere to CLDR plural forms. Refer to the `translate` skill.

## 4. Automatic Skill Invocation
Whenever performing relevant tasks in any project or session, automatically invoke and apply the appropriate skill:
- Working with Plane API, project management, or setup: Use the `plane` skill.
- Creating or renaming git branches: Use the `branch-name` skill.
- Drafting or submitting pull requests: Use the `create-pull-request` skill.
- Scanning, diagnosing, or refactoring React/UI code: Use the `react-doctor` skill.
- Compiling release notes or changelogs: Use the `release-notes` skill.
- Localizing strings or updating translation files: Use the `translate` skill.
