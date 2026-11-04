---
name: gemini-cli
description: >-
  Google Gemini CLI engineering standards, strict development rules, monorepo architecture,
  testing conventions, and review workflows. Use whenever developing, reviewing, testing,
  or refactoring high-reliability TypeScript/Node.js applications and CLI/TUI tools.
user_invocable: true
---

# Gemini CLI Engineering Standards & Workflows

Provides the core engineering rules, package architecture, and testing guidelines established in [`google-gemini/gemini-cli`](https://github.com/google-gemini/gemini-cli).

---

## 1. Architectural Principles

- **Package Decoupling**:
  - Non-UI logic (core orchestration, file ops, API drivers, tool executions) belongs strictly in core/backend packages (`packages/core`).
  - Terminal/UI layers (`packages/cli`) must only contain UI components, input event handling, and argument parsing.
  - Core logic must remain environment-agnostic (using abstraction layers like `Output` or event buses rather than assuming a TUI or terminal context).
- **Asynchronous Communication**:
  - Decouple services through centralized event buses (`coreEvents`) rather than direct inter-service coupling.
  - Implement services with clear lifecycles (`initialize()`, `shutdown()`).

---

## 2. Strict Coding Standards

- **Strict TypeScript**:
  - Zero tolerance for unchecked `any` or floating `unknown`. Use Zod or type guards for validation.
  - No floating promises: always await or handle `.catch()`.
  - Handle switches exhaustively with `checkExhaustive(val)`.
- **Clean React & TUI**:
  - NEVER trigger side-effects from inside `setState` callbacks. Use reducers or refs.
  - No synchronous file/network I/O inside components.
  - No unneeded `useEffect` hooks for synchronizing React state.
  - Avoid leaving `console.log` statements in production code.

---

## 3. Testing Rules

- **No Fixed Delays**: Never use `await delay(100)` or hard-coded sleeps. Always use predicate-based `waitFor(() => condition)`.
- **Mock Hygiene**: Avoid mocking the filesystem when possible. Always restore mocks in `afterEach` via `vi.restoreAllMocks()`.
- **Environment Stubs**: Use `vi.stubEnv('VAR', 'val')` in `beforeEach` and `vi.unstubAllEnvs()` in `afterEach`.

---

## 4. Associated Skills

- [**`code-reviewer`**](./code-reviewer/SKILL.md) — Comprehensive pre-commit and PR code review.
- [**`review-duplication`**](./review-duplication/SKILL.md) — Identifies duplicated utilities and enforces architectural reuse.
- [**`string-reviewer`**](./string-reviewer/SKILL.md) — Reviews UI text and error copy.
- [**`docs-writer`**](./docs-writer/SKILL.md) — Technical documentation standards.
- [**`pr-creator`**](./pr-creator/SKILL.md) — Standardized PR generation.
- [**`ci`**](./ci/SKILL.md) — Automated CI monitoring and local reproduction.
