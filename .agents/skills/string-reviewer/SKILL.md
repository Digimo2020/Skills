---
name: string-reviewer
description: >-
  Use this skill when asked to review text and user-facing strings within the codebase.
  It ensures that these strings follow rules on clarity, usefulness, brevity, and style.
user_invocable: true
---

# String Reviewer

Ensures user-facing messages, CLI prompts, errors, and tool outputs maintain high clarity, brevity, and consistency.

## Review Principles

1. **Clarity**: State what happened plainly without esoteric internal codes.
2. **Actionability**: For errors, explain the next concrete step the user can take to resolve the issue.
3. **Brevity**: Eliminate filler words; favor concise phrases suitable for terminals and modals.
4. **Consistency**:
   - Capitalization: Sentence case for messages, Title Case for headings.
   - Punctuation: Do not end short single-sentence messages or button labels with periods.
5. **Localization Safety**: Ensure variable interpolation placeholders are structured cleanly (e.g. `{userName}`) and not hard-coded English concatenations.
