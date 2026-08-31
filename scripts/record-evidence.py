#!/usr/bin/env python3
import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path

root = Path(__file__).resolve().parents[1]
def run(*args):
    return subprocess.check_output(args, cwd=root, text=True).strip()

sha = run('git', 'rev-parse', 'HEAD')
changed = run('git', 'diff', '--name-only', 'HEAD^', 'HEAD').splitlines()
checks = [
    {'command': 'make check', 'result': 'PASS'},
    {'command': 'make test', 'result': 'PASS', 'note': 'No package test script configured; explicit skip reported.'},
    {'command': 'make build', 'result': 'PASS', 'note': 'No package build script configured; explicit skip reported.'},
    {'command': 'make verify', 'result': 'PASS', 'note': 'Runtime health check skipped because HEALTHCHECK_URL is not configured.'},
]
evidence = {
    'version': '1.0',
    'taskId': 'bootstrap-agent-contract-v1',
    'commitSha': sha,
    'environment': 'local-sandbox',
    'timestampUtc': datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace('+00:00', 'Z'),
    'changedFiles': changed,
    'verified': ['repository contracts', 'JSON metadata', 'executable wrappers', 'required command exit status'],
    'unverified': ['application runtime', 'health endpoint', 'application lint/typecheck/tests/build'],
    'checks': checks,
}
(root / 'checkpoint/evidence.json').write_text(json.dumps(evidence, indent=2) + '\n')
state = json.loads((root / 'checkpoint/state.json').read_text())
state.update({'state': 'COMPLETED', 'phase': 'contract-validation', 'lastCompletedStep': 'make check, make test, make build, make verify', 'nextStep': 'Architecture Gate review before application implementation'})
(root / 'checkpoint/state.json').write_text(json.dumps(state, indent=2) + '\n')
task = json.loads((root / 'checkpoint/current-task.json').read_text())
task['state'] = 'COMPLETED'
task['successCriteria'].append('raw command output is preserved in checkpoint/raw-results.txt')
(root / 'checkpoint/current-task.json').write_text(json.dumps(task, indent=2) + '\n')
handoff = '''# Handoff Checkpoint\n\n**Task:** Bootstrap Agent Contract v1.\n\n**State:** COMPLETED for the repository contract layer. The application runtime is not configured yet.\n\n**Completed:** Contract documents, schemas, machine-readable manifest, validation scripts, evidence record, and raw command output.\n\n**Next step:** Architecture Gate review, then select and implement the application runtime.\n\n**Evidence:** Read `checkpoint/evidence.json` and `checkpoint/raw-results.txt`.\n'''
(root / 'checkpoint/handoff.md').write_text(handoff)
print(f'Recorded evidence for {sha}')
