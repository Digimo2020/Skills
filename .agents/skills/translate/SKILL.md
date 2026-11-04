---
name: translate
description: >-
  Translate or update localization strings in i18n locales. Enforces Do-Not-Translate
  terminology (brand names, product tiers), CLDR plural categories, variable preservation,
  and per-locale conventions.
user_invocable: true
---

# Translate (i18n & Localization)

Single source of truth for translating and reviewing UI strings across localization files.

## The Two Iron Rules

1. **Trademarks, brand marks, plan tier names, third-party product names, and code tokens are never translated.**
   - Plane, Plane AI, Power K, PQL, Active Cycles, Sticky/Stickies, Intake
   - Plan tiers (Pro, Business, Enterprise)
   - Third-party brands (GitHub, Slack, Discord, Google, etc.)
   - Acronyms (API, OAuth, URL, JSON, CSS)
   - Code tokens and interpolation variables (e.g., `{userName}`, `{count}`) must remain intact.
2. **CLDR plural categories are mandatory.**
   - Every target locale must include all required plural keywords (`zero`, `one`, `two`, `few`, `many`, `other`) mandated by Unicode CLDR for that language.

## Workflow

1. **Inspect English Source**: Treat `en/*.json` as the canonical source of keys.
2. **Translate to Target Locales**:
   - Translate common feature nouns (Cycle, Module, Issue, Page, Project) using standard product terminology for the language.
   - Maintain placeholders and HTML/JSX tags without alteration.
3. **Verify Integrity**:
   - Check that no interpolation variable was translated (e.g. `{userName}` must not become `{nomUtilisateur}`).
   - Verify all required CLDR plural forms are present.
