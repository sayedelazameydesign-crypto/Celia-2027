# Evidence Contract v1

Each verification run writes `checkpoint/evidence.json`. The record references the code under test with `sourceCommitSha` and identifies the verification event with a unique `verificationRunId`. The later commit that stores the evidence is intentionally separate and is not represented as the source commit.

Every evidence record contains the command, result, source commit SHA, verification run ID, environment, UTC timestamp, changed files, verified items, and unverified items. Results have strict meanings:

| Result | Meaning |
| --- | --- |
| `PASS` | The command was executed and passed. |
| `FAIL` | The command was executed and failed. |
| `SKIP` | The check is unavailable or not applicable because the required application tooling is not present; a reason is mandatory. |
| `BLOCKED` | The check is required but cannot run; the task cannot be completed until the blocker is resolved. |

A task may be marked complete only when no applicable check is `FAIL` or `BLOCKED`. `SKIP` is acceptable for the current runtime-neutral bootstrap only when recorded with an explicit reason. Evidence must never rewrite a failure as a pass.

The verification workflow is: checkout the source commit, run verification, write evidence referencing that source commit, and commit the evidence separately. This avoids self-referential provenance.
