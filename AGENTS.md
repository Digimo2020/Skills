# Global Engineering, Architecture, UI/UX, Superpowers & Feedback Rules

These rules apply globally across all sessions, projects, application creation, software development, and decision-making processes.

---

## 1. Core Mandate: Superpowers First
**Whenever creating or modifying any apps, features, components, or software, ALWAYS start with Superpowers first before writing code:**
- **Brainstorm First (`brainstorming`)**: Explore design alternatives, clarify intent, evaluate edge cases and trade-offs.
- **Write Plans First (`writing-plans`)**: Structure multi-step work into clear phases before touching code.
- **Test-Driven Development (`test-driven-development`)**: Write failing tests first (Red), verify failure, implement minimal code (Green), and refactor.
- **Verification Before Completion (`verification-before-completion`)**: Evidence over assertions. Always run verification commands and verify output before claiming completion.
- **Systematic Debugging (`systematic-debugging`)**: When errors arise, systematically reproduce, isolate root cause, and apply minimal targeted fixes.

---

## 2. Taste Skill: UI/UX & Design Excellence (Highest Priority for UI)
**Whenever doing anything related to user interfaces, design, styling, layout, components, or user experience—even small or big things—strictly plan and apply Taste Skill:**
- **The Bar**: Meet the standard of `figma.com` and `x.ai`: intentional, refined, functional, and modern. Zero tolerance for generic templates or "AI slop".
- **The 9 House Rules**:
  1. **No Captions Under Visuals**: Keep visuals clean; credits in one footer line.
  2. **Every Visual Renders Fully**: Zero broken assets across 1440, 1024, 768, and 390 viewports.
  3. **One Section Per Screen**: Hero stands alone on the first screen; every section is planned for 1 or 2 screens at 1440x900 without adjacent headers peeking in.
  4. **Equal Left and Right Edges**: Strict alignment to container margins (`.wrap`).
  5. **Quiet Micro-Interactions**: Cards lift 2px on hover, images zoom 1.02–1.03 inside frames, buttons step cleanly on hover/press. No chaotic tilt, carousels, or scroll reveals.
  6. **Real Product UI & Genuine Assets**: Show actual product UI cards, real full-color brand icons, genuine photos/renders.
  7. **Confident, Plain Copy**: Plainly state what is built/sold, for whom, with one hard fact. Headings name things directly; buttons use [Verb + Object].
  8. **Visual Restraint by Domain**: Shaders, canvas scenes, and dark tech themes are strictly for tech, developer tools, and gaming. All other apps use clean type, flat color, and subtle elevation.
  9. **Single Cohesive System**: One button pair, one card family, one radius scale, one typography hierarchy, and accessible contrast.

---

## 3. Specification-Driven Development (GitHub Spec Kit)
- **Code Serves Specifications**: Never write code directly from raw requests without an approved specification (`spec.md`) and technical plan (`plan.md`).
- **Constitutional Gates**:
  - **Simplicity Gate**: Initial project structures must remain minimal (=3 modules/packages). Reject premature abstraction.
  - **Framework Trust**: Rely on framework capabilities directly rather than custom wrapper layers.
  - **Complexity Tracking**: Every introduced complexity must be justified in `plan.md`.
  - **Integration-First**: Real schemas and services over fragile mock suites.
- **SDD Lifecycle Workflow**:
  `speckit-constitution` -> `speckit-specify` -> `speckit-clarify` -> `speckit-plan` (planning UI with Taste Skill) -> `speckit-checklist` -> `speckit-tasks` -> `speckit-analyze` -> `speckit-implement` -> `speckit-converge`.

---

## 4. Project Management & Workflow Tracking (MakePlane)
- **Decompose Work into Work Items**: Break down non-trivial work into initiatives, modules/epics, and work items/tasks.
- **Track Progress and States**: Keep items categorized by state (`backlog`, `unstarted`, `started`, `completed`) with clear priority (`urgent`, `high`, `medium`, `low`).
- **Plane Tool Integration**: When a Plane workspace or MCP server is available, leverage it to manage work items and cycles.
- **Git Branch Naming**: Strictly follow `<type>/<work-item-id>-<short-description>`.
- **Pull Request Creation**: Prefix title with work item ID: `[WORK-ITEM-ID] <type>: <concise summary>`.
- **Release Notes**: Parse commits into user-facing sections without internal ticket IDs or raw PR numbers.
- **Internationalization (i18n)**: Enforce Do-Not-Translate (DNT) terms and CLDR plural forms.

---

## 5. Strict Engineering, Quality & Code Review (Google Gemini CLI)
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

## 6. Visual Selection & Feedback (Agentation)
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

## 7. Execution Order Across All Tools
Whenever you build any app, feature, or software:
1. **Start on Superpowers**: `brainstorming` -> `writing-plans`
2. **Spec Kit**: `speckit-specify` -> `speckit-plan`
3. **Taste Skill**: Enforce UI/UX anti-slop rules on all visual elements
4. **Plane**: `branch-name` -> work items & sprint cycles
5. **Superpowers + Gemini CLI**: `test-driven-development` -> strict typing & implementation
6. **Agentation**: Mount `<Agentation />` toolbar to visually click & select any part of the app
7. **Verification & Review**: `verification-before-completion` -> `review-duplication` -> `code-reviewer` -> `create-pull-request`
