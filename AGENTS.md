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

## 2. Global UI & UX Development Standards (v1.0) - 2026-11-04
**Apply these standards whenever creating, modifying or reviewing any software interface:**

1. **Always use UI UX Pro Max for visual design and design-system decisions.**
2. **Use UX usability and information architecture skills to evaluate the actual user experience.**
3. **Understand the target users and their tasks before designing.**
4. **Never prioritise visual beauty over usability.**
5. **Keep navigation, menus, forms, buttons and workflows clear and predictable.**
6. **Use consistent branding, typography, spacing, colours and reusable components.**
7. **Every action must provide clear feedback, including loading, success, error and empty states.**
8. **Minimise unnecessary clicks, pop-ups and confusing interactions.**
9. **Make interfaces responsive across desktop, tablet and mobile.**
10. **Follow accessibility standards, including keyboard navigation, readable contrast and clear focus states.**
11. **Test complete user journeys, not just individual screens.**
12. **Review the finished interface for usability problems before considering the work complete.**
13. **Preserve the existing application architecture, functionality and branding.**
14. **Create reusable design components so the same design standards can be applied to future applications.**

> **FINAL PRINCIPLE**:  
> **Build software that looks professional, feels natural and is easy for people to understand without needing instructions.**

---

## 3. Ultra-Modern UI/UX Excellence (Taste Skill & UI/UX Pro Max)
**Whenever doing anything related to user interfaces, design, styling, layout, components, or user experience—even any small or big thing—strictly enforce modern UI/UX design standards using `ui-ux-pro-max` and `taste-skill`:**
- **The Modern Standard**: Always make interfaces ultra-modern, intentional, refined, and functional. Meet the standard of `figma.com` and `x.ai`. Reject generic templates, bootstrap-looking layouts, or "AI slop".
- **Modern Paradigms**:
  - **Bento Grids & Structured Cards**: Asymmetrical modular sections with clear hierarchy.
  - **Modern SaaS & Minimalist Aesthetics**: Crisp typography, high contrast, subtle borders, and delicate elevation.
  - **Sophisticated Glass & Depth**: Subtle `backdrop-blur`, layered surfaces, and fine-line borders where appropriate.
  - **The 9 House Rules of Taste**:
    1. **No Captions Under Visuals**: Keep visuals clean; credits in one footer line.
    2. **Every Visual Renders Fully**: Zero broken assets across 1440, 1024, 768, and 390 viewports.
    3. **One Section Per Screen**: Hero stands alone on the first screen; every section is planned for 1 or 2 screens at 1440x900 without adjacent headers peeking in.
    4. **Equal Left and Right Edges**: Strict alignment to container margins (`.wrap`).
    5. **Quiet Micro-Interactions**: Cards lift 2px on hover, images zoom 1.02–1.03 inside frames, buttons step cleanly on hover/press. No chaotic tilt, carousels, or scroll reveals.
    6. **Real Product UI & Genuine Assets**: Show actual product UI cards, real full-color brand icons, genuine photos/renders.
    7. **Confident, Plain Copy**: Plainly state what is built/sold, for whom, with one hard fact. Headings name things directly; buttons use [Verb + Object].
    8. **Visual Restraint by Domain**: Shaders, canvas scenes, and dark tech themes are strictly for tech, developer tools, and gaming. All other apps use clean type, flat color, and subtle elevation.
    9. **Single Cohesive System**: One button pair, one card family, one radius scale, one typography hierarchy, and accessible contrast.
- **The 10 UX Priorities**:
  1. *Accessibility*: Contrast 4.5:1, visible focus rings, aria-labels on icon buttons.
  2. *Touch Targets*: Minimum 44×44px with 8px+ spacing between interactive elements.
  3. *Performance & CLS*: Zero layout shifts (`CLS < 0.1`), WebP/AVIF formats.
  4. *Responsive Rhythm*: Mobile-first breakpoints (1440, 1024, 768, 390) without horizontal scroll.
  5. *Typography*: Base 16px body, 1.5 line height, curated font pairings.
  6. *Transitions*: 150–250ms micro-interactions; respect `prefers-reduced-motion`.
  7. *Forms*: Visible permanent labels, errors beneath inputs with clear advice.
  8. *Navigation*: Clear active states, predictable back behavior.

---

## 4. Multi-Agent UX Debate & Synthesis Protocol (`frontend-agent-skills`)
**Whenever designing, planning, or creating UI/UX, convene a multi-agent debate across specialized viewpoints. Clash their arguments to eliminate blind spots, and synthesize the executive decision for the "best of the best" UX:**
- **The 6 Specialized Advocates**:
  1. **Usability & Cognitive Load Advocate (`ux-usability-foundations`)**: Fights for zero ambiguity, clear affordances, minimal cognitive load, instant visual feedback, and robust error prevention.
  2. **Information Architecture Advocate (`information-architecture-navigation`)**: Fights for logical content hierarchy, wayfinding, progressive disclosure, and predictable page flow.
  3. **Accessibility & Inclusion Advocate (`accessibility-inclusive-design`)**: Fights for WCAG AA compliance, complete keyboard navigation, visible focus rings, semantic HTML, and screen reader parity.
  4. **Interaction Patterns & Forms Advocate (`interaction-patterns-components` & `forms-inputs-checkout`)**: Fights against modal traps and multistep fatigue; demands inline forms, clear validation on blur, and battle-tested components.
  5. **Visual Craft & Anti-Slop Advocate (`taste-skill` & `ui-visual-composition`)**: Fights against generic templates; demands figma.com/x.ai fidelity, bento grids, balanced gutters, and quiet micro-interactions.
  6. **Content Design & Microcopy Advocate (`ux-writing-content-design`)**: Fights against vague tech jargon; demands plain language, helpful inline error recovery, and [Verb + Object] action buttons.
- **Debate & Synthesis Workflow**:
  1. **Stage 1: Multi-Agent Argument**: Present alternative UX layouts and challenge each proposal against cognitive load, friction points, and edge cases.
  2. **Stage 2: Clash & Critique**: Each advocate identifies failure modes in the competing options.
  3. **Stage 3: Executive UX Synthesis**: Select the definitive, cohesive design taking the best features from each perspective, prioritizing overall user experience above all else.

---

## 5. Specification-Driven Development (GitHub Spec Kit)
- **Code Serves Specifications**: Never write code directly from raw requests without an approved specification (`spec.md`) and technical plan (`plan.md`).
- **Constitutional Gates**:
  - **Simplicity Gate**: Initial project structures must remain minimal (=3 modules/packages). Reject premature abstraction.
  - **Framework Trust**: Rely on framework capabilities directly rather than custom wrapper layers.
  - **Complexity Tracking**: Every introduced complexity must be justified in `plan.md`.
  - **Integration-First**: Real schemas and services over fragile mock suites.
- **SDD Lifecycle Workflow**:
  `speckit-constitution` -> `speckit-specify` -> `speckit-clarify` -> `speckit-plan` (planning UI with Multi-Agent UX Debate, Taste Skill & UI/UX Pro Max) -> `speckit-checklist` -> `speckit-tasks` -> `speckit-analyze` -> `speckit-implement` -> `speckit-converge`.

---

## 6. Strict Engineering, Quality & Code Review (Google Gemini CLI)
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

## 7. Visual Selection & Feedback (Agentation)
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

## 8. Execution Order Across All Tools
Whenever you build any app, feature, or software:
1. **Start on Superpowers**: `brainstorming` -> `writing-plans`
2. **Spec Kit**: `speckit-specify` -> `speckit-clarify` -> `speckit-plan`
3. **Multi-Agent UX Debate & Global Standards**: Apply `Global UI & UX Development Standards (v1.0)` and convene `frontend-agent-skills` to debate alternatives and synthesize the best-in-class UX; style with `ui-ux-pro-max` and `taste-skill`
4. **Superpowers + Gemini CLI**: `test-driven-development` -> strict typing & implementation
5. **Agentation**: Mount `<Agentation />` toolbar to visually click & select any part of the app
6. **Verification & Review**: Complete journey testing -> `verification-before-completion` -> `review-duplication` -> `code-reviewer` -> `pr-creator`
