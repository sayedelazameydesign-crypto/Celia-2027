# Handoff and Checkpoint Contract v1

A new agent must be able to continue from repository state alone. Before stopping, the current agent updates `checkpoint/current-task.json`, `checkpoint/state.json`, `checkpoint/evidence.json`, and `checkpoint/handoff.md`.

The handoff must state the task, current state, completed work, remaining work, blockers, exact next command, commit SHA, changed files, and verification gaps. It must not rely on hidden conversation context.
