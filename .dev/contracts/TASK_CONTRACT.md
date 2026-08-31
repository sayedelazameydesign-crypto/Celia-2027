# Task Contract v1

Every agent task is represented by `checkpoint/current-task.json`. A task must define a stable identifier, a human-readable definition, inputs, success criteria, scope, and current state.

Allowed states are `PLANNED`, `RUNNING`, `BLOCKED`, and `COMPLETED`. `COMPLETED` is valid only when the verification and evidence contracts pass. A blocked task must state the blocker and the next action; it must not be reported as complete.

The lifecycle is `PLANNED -> RUNNING -> COMPLETED` or `PLANNED/RUNNING -> BLOCKED`. A blocked task may return to `RUNNING` only after its blocker is recorded as resolved.
