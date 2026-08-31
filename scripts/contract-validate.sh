#!/usr/bin/env bash
set -euo pipefail
python3 - <<'PY'
import json
from pathlib import Path
files = ['checkpoint/current-task.json', 'checkpoint/state.json', 'checkpoint/evidence.json', '.dev/config/project.json']
for name in files:
    json.loads(Path(name).read_text())
    print(f'[contract] valid JSON: {name}')
task=json.loads(Path(files[0]).read_text())
if task.get('version') != '1.0': raise SystemExit('task contract version must be 1.0')
if task.get('state') not in {'PLANNED','RUNNING','BLOCKED','COMPLETED'}: raise SystemExit('invalid task state')
evidence=json.loads(Path(files[2]).read_text())
required=['taskId','commitSha','environment','timestampUtc','changedFiles','checks']
missing=[k for k in required if k not in evidence]
if missing: raise SystemExit('evidence missing: '+', '.join(missing))
print('[contract] task and evidence contract fields present')
PY
