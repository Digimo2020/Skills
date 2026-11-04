# Global Engineering, Architecture & UI Feedback Rules

These rules apply globally across all sessions, projects, application creation, software development, and decision-making processes.

---

## 1. Specification-Driven Development (GitHub Spec Kit)
- **Code Serves Specifications**: Never write code directly from raw requests without an approved specification (`spec.md`) and technical plan (`plan.md`). Specifications and plans are the executable source of truth.
- **Architectural & Constitutional Gates**:
  - **Simplicity Gate**: Initial project structures must remain minimal (maximum 3 modules/packages). Reject premature abstraction and speculative future-proofing.
  - **Framework Trust**: Rely on framework capabilities directly rather than inventing custom wrapper layers or bespoke abstractions.
  - **Complexity Tracking**: Every introduced complexity must be justified in `plan.md` explaining why it is needed and why simpler alternatives were rejected.
  - **Integration-First**: Real schemas, services, and realistic dependencies take precedence over fragile mock suites.
- **SDD Lifecycle Workflow**:
  1. `speckit-constitution` -> Define/verify project principles & gates.
  2. `speckit-specify` -> Draft user journeys (P1 MVP first), acceptance criteria (Given/When/Then), and functional requirements.
  3. `speckit-clarify` -> Resolve ambiguities through high-leverage targeted questions.
  4. `speckit-plan` -> Determine architecture, layout, schemas, and complexity tracking.
  5. `speckit-checklist` -> Run requirements validation ("unit tests for English").
  6. `speckit-tasks` -> Decompose into dependency-ordered tasks with `[P]` parallel markers.
  7. `speckit-analyze` -> Cross-artifact consistency audit.
  8. `speckit-implement` -> Phased execution starting with MVP.
  9. `speckit-converge` -> Audit codebase against spec and append remediation tasks.

---

## 2. Project Management & Workflow Tracking (MakePlane)
- **Decompose Work into Work Items**: For any non-trivial feature or project, break down work into discrete, trackable work items (initiatives, modules/epics, and work items/tasks).
- **Track Progress and States**: Keep work items categorized by state (`backlog`, `unstarted`, `started`, `completed`, `cancelled`) with clear priority (`urgent`, `high`, `medium`, `low`).
- **Plane Tool Integration**: When a Plane workspace or Plane MCP server is available, leverage it to read/create work items, manage cycles, and update issue states.
- **Git Branch Naming**: Strictly follow `<type>/<work-item-id>-<short-description>` (via `branch-name` skill).
- **Pull Request Creation**: Prefix title with work item ID: `[WORK-ITEM-ID] <type>: <concise summary>` (via `create-pull-request` or `pr-creator`).
- **Release Notes**: Parse commits into user-facing sections without internal ticket IDs or raw PR numbers (via `release-notes` or `docs-changelog`).
- **Internationalization (i18n)**: Enforce Do-Not-Translate (DNT) terms and CLDR plural forms (via `translate` skill).

---

## 3. Strict Engineering, Quality & Code Review (Google Gemini CLI)
- **Zero-Tolerance Typing**: Strictly forbid unvalidated `any` and unconstrained `unknown`. Narrow all unknown types with type guards or Zod schemas.
- **Promise & Error Safety**: Never leave unhandled floating promises (`@typescript-eslint/no-floating-promises`). Use exhaustive matching in `switch` statements (`checkExhaustive`).
- **Testing Hygiene**:
  - NEVER use arbitrary delays or fixed sleeps (e.g. `await delay(100)`). Use predicate-based `waitFor`.
  - Always clean up mocks in `afterEach` via `vi.restoreAllMocks()`.
  - Stub environment variables cleanly with `vi.stubEnv` and restore with `vi.unstubAllEnvs()`.
- **Mandatory Review & Anti-Duplication Pass**:
  - Run `review-duplication` before committing to eliminate reinvented wheels and AI slop.
  - Run `code-reviewer` to verify correctness, edge cases, and maintainability.
  - Review user-facing copy via `string-reviewer` for clarity, brevity, and actionability.
- **Documentation Standards**: Follow `docs-writer` principles (active voice, clear structure, copy-pasteable snippets).

---

## 4. Visual Selection & Feedback (Agentation)
- **Select Any Part of Apps**: Whenever creating or bootstrapping React / Next.js / frontend web applications, install `agentation` as a dev dependency and mount `<Agentation />` in development mode:
  ```tsx
  {process.env.NODE_ENV === "development" && (
    <Agentation endpoint="http://localhost:4747" />
  )}
  ```
- **Annotation Ingestion & Pinpoint Targeting**:
  - When users provide visual annotations or element feedback, query pending annotations via `agentation-mcp` tools or parse structured Agentation output.
  - Use exact CSS selectors (e.g. `.sidebar > button.primary`) and bounding boxes to locate and modify code precisely without guesswork.
- **Autonomous UI Critique**: Use `agentation-self-driving` to drive browser sessions, inspect visual hierarchy, and annotate design improvements.

---

## 5. Automatic Skill Invocation
Whenever performing relevant tasks in any project or session, automatically invoke and apply the appropriate skill:
- **Spec-Driven Planning & Decisions**: Use `spec-kit`, `speckit-specify`, `speckit-plan`, `speckit-clarify`, `speckit-tasks`, `speckit-implement`, `speckit-constitution`, `speckit-analyze`, `speckit-converge`.
- **Plane & Work Item Management**: Use `plane`.
- **Git Branch Creation**: Use `branch-name`.
- **Pull Requests**: Use `create-pull-request` or `pr-creator`.
- **React Diagnostics**: Use `react-doctor`.
- **Code Review & Audits**: Use `code-reviewer`, `review-duplication`, `string-reviewer`.
- **Documentation**: Use `docs-writer`, `docs-changelog`.
- **CI & TUI Automation**: Use `ci`, `tui-tester`, `agent-tui`, `behavioral-evals`.
- **Visual Feedback & UI Selection**: Use `agentation`, `agentation-self-driving`.
