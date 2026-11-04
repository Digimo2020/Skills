---
name: tui-tester
description: >-
  Expert guidance for testing terminal UI (TUI) behavior, rendering, and interactive
  visual output using terminal automation.
user_invocable: true
---

# TUI Tester

Guides testing of interactive terminal UI applications (Ink, curses, ratatui) via headless automation and snapshot checks.

## Key Practices

1. **Deterministic Frames**: Ensure terminal dimensions (columns x rows) are fixed during tests.
2. **Asynchronous Key Handling**: Test fast sequential keystrokes to ensure reducers process queued inputs without dropped events.
3. **Visual Regression**: Use snapshot comparisons of rendered screen buffers rather than brittle raw string matches.
