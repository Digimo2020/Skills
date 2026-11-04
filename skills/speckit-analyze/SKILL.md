---
name: speckit-analyze
description: >-
  Perform a non-destructive cross-artifact consistency and quality analysis across
  spec.md, plan.md, tasks.md, and constitution.md.
user_invocable: true
---

# Spec Kit: Analyze

Audits all design artifacts to ensure perfect cross-artifact alignment before code implementation begins.

## Audit Checks

1. **Coverage**: Does every functional requirement in `spec.md` have corresponding architecture in `plan.md` and tasks in `tasks.md`?
2. **Orphaned Tasks**: Are there tasks in `tasks.md` that lack traceable requirements in `spec.md`?
3. **Constitution Compliance**: Does the plan respect all constitutional principles without unapproved exceptions?
4. **Ordering & Dependencies**: Are foundational tasks scheduled before dependent user stories? Are parallel `[P]` tasks truly independent?
5. **Quality Score**: Generates a consistency report with actionable remediation items.
