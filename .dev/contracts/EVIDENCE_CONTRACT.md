# Evidence Contract v1

Each verification run writes `checkpoint/evidence.json`. Every evidence record contains the command, result, commit SHA, environment, UTC timestamp, changed files, verified items, and unverified items. Results are `PASS`, `FAIL`, or `SKIP`.

Evidence is append-only for a task in spirit: a later run may add a new record, but must not rewrite a failure as a pass. The final report must link the evidence file and identify all skips or unavailable runtime checks.
