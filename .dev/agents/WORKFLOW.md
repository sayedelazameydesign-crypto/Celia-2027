# Agent Workflow Contract

```text
TASK
  -> READ REPO
  -> UNDERSTAND ARCHITECTURE
  -> PLAN
  -> IMPLEMENT
  -> TEST
  -> BUILD
  -> VERIFY
  -> REPORT EVIDENCE
  -> READY
```

An agent must report changed files, commands run, pass/fail/skip results, and anything not verified. A failed gate stops the workflow. A deployment success message is not application verification.
