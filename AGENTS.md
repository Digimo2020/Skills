# Global Engineering, Spec-Driven Development & Workflow Rules

These rules apply globally across all sessions, projects, application creation, and decision-making processes.

---

## 1. Spec-Driven Development (SDD) & Architectural Decisions
- **Code Serves Specifications**: Never write code directly from raw requests without an approved specification and technical plan.
- **Specifications are Executable Source**: Specifications (`spec.md`) and implementation plans (`plan.md`) are the primary source of truth. Code is their generated, verifiable expression.
- **Constitutional Gates**:
  - **Simplicity Gate**: Keep initial project structures minimal (=3 projects/modules). Reject premature abstraction and speculative future-proofing.
  - **Framework Trust**: Use framework capabilities directly rather than introducing redundant wrapper layers.
  - **Complexity Tracking**: Every introduced complexity must have a documented rationale in `plan.md` explaining why it is needed and why simpler alternatives were rejected.
  - **Integration-First Testing**: Test with realistic environments (real schemas, services) over isolated, brittle mocks.
- **Standard Lifecycle Workflow**:
  1. `speckit-constitution` -> Define/verify project principles & gates.
  2. `speckit-specify` -> Draft user journeys (P1 MVP first), acceptance criteria, and functional requirements.
  3. `speckit-clarify` -> Resolve ambiguities through high-leverage targeted questions.
  4. `speckit-plan` -> Determine architecture, layout, schemas, and complexity tracking.
  5. `speckit-checklist` -> Run requirements validation ("unit tests for English").
  6. `speckit-tasks` -> Decompose into dependency-ordered tasks with `[P]` parallel markers.
  7. `speckit-analyze` -> Cross-artifact consistency audit.
  8. `speckit-implement` -> Phased execution starting with MVP.
  9. `speckit-converge` -> Audit codebase against spec and append remediation tasks.

---

## 2. Project Management & Task Structure (Plane)
- **Decompose Work into Work Items**: For any non-trivial feature or project, break down work into discrete, trackable work items (initiatives, modules/epics, and work items/tasks).
- **Track Progress and States**: Keep work items categorized by state (`backlog`, `unstarted`, `started`, `completed`, `cancelled`) with clear priority (`urgent`, `high`, `medium`, `low`).
- **Plane Tool Integration**: When a Plane workspace or Plane MCP server is available, leverage it to read/create work items, manage cycles, and update issue states.

---

## 3. Git & Version Control Conventions
- **Branch Naming**: Strictly follow `<type>/<work-item-id>-<short-description>` (via `branch-name` skill).
- **Pull Request Creation**: Prefix title with work item ID: `[WORK-ITEM-ID] <type>: <concise summary>` (via `create-pull-request` skill).
- **Release Notes**: Parse commits into user-facing sections without internal ticket IDs or raw PR numbers (via `release-notes` skill).

---

## 4. Engineering & Code Quality Standards
- **Strict Typing**: TypeScript strict mode must be enabled for all TypeScript/JavaScript projects.
- **Modern Monorepo & Dependencies**: Use `pnpm` with Turborepo (`turbo`), `oxlint` / `oxfmt`.
- **Frontend & React Standards**: Modular UI, reactive state (MobX or lightweight stores), run `npx react-doctor@latest --verbose --diff` before committing.
- **Backend (Python) Standards**: Manage dependencies with `uv` (`pyproject.toml` and `uv.lock`), lint with `ruff`.
- **Internationalization (i18n)**: Enforce Do-Not-Translate (DNT) terms and CLDR plural forms (via `translate` skill).

---

## 5. Automatic Skill Invocation
Whenever performing relevant tasks in any project or session, automatically invoke and apply the appropriate skill:
- **Spec-Driven Planning & Decisions**: Use `spec-kit`, `speckit-specify`, `speckit-plan`, `speckit-clarify`, `speckit-tasks`, `speckit-implement`, `speckit-constitution`, `speckit-analyze`, `speckit-converge`.
- **Plane & Work Item Management**: Use `plane`.
- **Git Branch Creation**: Use `branch-name`.
- **Pull Requests**: Use `create-pull-request`.
- **React Diagnostics**: Use `react-doctor`.
- **Release Notes**: Use `release-notes`.
- **Localization**: Use `translate`.
