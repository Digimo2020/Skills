---
name: agentation-self-driving
description: >-
  Autonomous UI critique and element selection using the Agentation toolbar in a browser.
  Use when asked to review UI, critique a web page, auto-annotate, or inspect elements visually.
user_invocable: true
---

# Agentation Self-Driving Mode

Autonomously navigates and critiques web pages by clicking elements and adding design/functional annotations via the Agentation toolbar.

## Workflow

1. **Verify Toolbar Presence**:
   Inspect the DOM for `agentation-toolbar` or `[data-feedback-toolbar]`. Ensure the toolbar is expanded and page interaction blocking is enabled.

2. **Coordinate-Based Element Targeting**:
   - The Agentation overlay intercepts pointer events at the screen-coordinate level.
   - Query target element bounding box: `getBoundingClientRect()`.
   - Calculate center: `centerX = x + width / 2`, `centerY = y + height / 2`.
   - Dispatch mouse events to the center coordinates to trigger the annotation dialog.

3. **Fill Feedback & Submit**:
   - Enter concise, actionable critique in the annotation textbox.
   - Submit annotation to record the element's CSS selector, position, and comment.

4. **Synchronize Annotations**:
   - Deliver annotations directly to the listening coding agent via `agentation-mcp`.
