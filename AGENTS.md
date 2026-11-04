# Global Engineering, Architecture, UI/UX & Feedback Rules

These rules apply globally across all sessions, projects, application creation, software development, and decision-making processes.

---

## 1. Taste Skill: UI/UX & Design Excellence (HIGHEST PRIORITY FOR UI)
**Whenever doing anything related to user interfaces, design, styling, layout, components, or user experience—even any small or big thing—strictly plan and apply Taste Skill.**
- **The Bar**: All UI/UX must meet the standard of `figma.com` and `x.ai`: intentional, refined, functional, and modern. Zero tolerance for generic templates or "AI slop".
- **The 9 House Rules**:
  1. **No Captions Under Visuals**: Never put descriptions or apologies under images; licensing credits go in a single footer line.
  2. **Every Visual Renders Fully**: Assets and diagrams draw cleanly across 1440, 1024, 768, and 390 viewports with zero empty grounds.
  3. **One Section Per Screen**: The hero stands alone on the first screen; every section is planned for 1 or 2 screens at 1440x900 without adjacent headings peeking in.
  4. **Equal Left and Right Edges**: Strict alignment to container margins (`.wrap`). No asymmetrical horizontal spills or side-scrolling.
  5. **Quiet Micro-Interactions**: Cards lift 2px on hover, images zoom 1.02–1.03 inside frames, buttons step cleanly on hover/press. No chaotic tilt, carousels, or scroll reveals.
  6. **Real Product UI & Genuine Assets**: Show actual product UI cards, real full-color brand icons, genuine photos/renders. Never drawn lookalike logos or cheesy stock photos.
  7. **Confident, Plain Copy**: Plainly state what is built/sold, for whom, with one hard fact. Headings name things directly; buttons use [Verb + Object].
  8. **Visual Restraint by Domain**: Shaders, canvas scenes, and dark tech themes are strictly for tech, developer tools, and gaming. All other apps use clean type, flat color, and subtle elevation.
  9. **Single Cohesive System**: One button pair, one card family, one radius scale, one typography hierarchy, and accessible contrast.
- **Verification**: Test responsive layout at 1440px, 1024px, 768px, and 390px.

---

## 2. Specification-Driven Development (GitHub Spec Kit)
- **Code Serves Specifications**: Never write code directly from raw requests without an approved specification (`spec.md`) and technical plan (`plan.md`).
- **Constitutional Gates**:
  - **Simplicity Gate**: Initial project structures must remain minimal (=3 modules/packages). Reject premature abstraction.
  - **Framework Trust**: Rely on framework capabilities directly rather than custom wrapper layers.
  - **Complexity Tracking**: Every introduced complexity must be justified in `plan.md`.
  - **Integration-First**: Real schemas and services over fragile mock suites.
- **SDD Lifecycle Workflow**:
  `speckit-constitution` -> `speckit-specify` -> `speckit-clarify` -> `speckit-plan` (planning UI with Taste Skill) -> `speckit-checklist` -> `speckit-tasks` -> `speckit-analyze` -> `speckit-implement` -> `speckit-converge`.

---

## 3. Project Management & Workflow Tracking (MakePlane)
- **Decompose Work into Work Items**: Break down non-trivial work into initiatives, modules/epics, and work items/tasks.
- **Track Progress and States**: Keep items categorized by state (`backlog`, `unstarted`, `started`, `completed`) with clear priority (`urgent`, `high`, `medium`, `low`).
- **Plane Tool Integration**: When a Plane workspace or MCP server is available, leverage it to manage work items and cycles.
- **Git Branch Naming**: Strictly follow `<type>/<work-item-id>-<short-description>`.
- **Pull Request Creation**: Prefix title with work item ID: `[WORK-ITEM-ID] <type>: <concise summary>`.
- **Release Notes**: Parse commits into user-facing sections without internal ticket IDs or raw PR numbers.
- **Internationalization (i18n)**: Enforce Do-Not-Translate (DNT) terms and CLDR plural forms.

---

## 4. Strict Engineering, Quality & Code Review (Google Gemini CLI)
- **Zero-Tolerance Typing**: Strictly forbid unvalidated `any` and unconstrained `unknown`. Narrow all unknown types with type guards or Zod schemas.
- **Promise & Error Safety**: Never leave unhandled floating promises (`@typescript-eslint/no-floating-promises`). Exhaustive matching in `switch` statements (`checkExhaustive`).
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

## 5. Visual Selection & Feedback (Agentation)
- **Select Any Part of Apps**: Whenever creating React / Next.js / frontend web applications, install `agentation` as a dev dependency and mount `<Agentation />` in development mode:
  ```tsx
  {process.env.NODE_ENV === "development" && (
    <Agentation endpoint="http://localhost:4747" />
  )}
  ```
- **Annotation Ingestion & Pinpoint Targeting**:
  - When users provide visual annotations, query pending annotations via `agentation-mcp` tools or parse structured Agentation output.
  - Use exact CSS selectors (e.g. `.sidebar > button.primary`) and bounding boxes to locate and modify code precisely without guesswork.
- **Autonomous UI Critique**: Use `agentation-self-driving` to drive browser sessions, inspect visual hierarchy, and annotate design improvements.

---

## 6. Automatic Skill Invocation
Whenever performing relevant tasks in any project or session, automatically invoke and apply the appropriate skill:
- **UI/UX Design, Styling & Polish**: Use `taste-skill` (or `design-taste-frontend`).
- **Visual Feedback & UI Selection**: Use `agentation`, `agentation-self-driving`.
- **Spec-Driven Planning & Decisions**: Use `spec-kit`, `speckit-specify`, `speckit-plan`, `speckit-clarify`, `speckit-tasks`, `speckit-implement`, `speckit-constitution`, `speckit-analyze`, `speckit-converge`.
- **Plane & Work Item Management**: Use `plane`.
- **Git Branch Creation**: Use `branch-name`.
- **Pull Requests**: Use `create-pull-request` or `pr-creator`.
- **React Diagnostics**: Use `react-doctor`.
- **Code Review & Audits**: Use `code-reviewer`, `review-duplication`, `string-reviewer`.
- **Documentation**: Use `docs-writer`, `docs-changelog`.
- **CI & TUI Automation**: Use `ci`, `tui-tester`, `agent-tui`, `behavioral-evals`.
