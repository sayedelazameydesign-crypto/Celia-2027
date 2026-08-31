# Handoff Checkpoint

**Task:** Bootstrap Agent Contract v1.

**State:** RUNNING until the required commands complete and evidence is updated. The repository has no application runtime or package manifest yet.

**Next command:** `make check && make test && make build && make verify`

**Completion rule:** Update `checkpoint/evidence.json`, set task state to `COMPLETED` only when all applicable gates pass, and report any runtime check that remains unavailable.
