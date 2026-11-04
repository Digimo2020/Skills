---
name: behavioral-evals
description: >-
  Guidance for creating, running, fixing, and promoting behavioral evaluations.
  Use when verifying agent decision logic, tool choice, steerability, or regression testing.
user_invocable: true
---

# Behavioral Evaluations

Validates agent decision-making, tool selection accuracy, and response discipline beyond traditional unit tests.

## Workflow

1. **Define Test Scenarios**: Specify user prompts, expected tool calls, and unacceptable deviations.
2. **Execute Harness**: Run behavioral evaluations in isolated test environments.
3. **Analyze Traces**: Review agent thought processes, tool invocation parameters, and final output.
4. **Prevent Regressions**: Promote passing test fixtures into continuous regression suites.
