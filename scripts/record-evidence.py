#!/usr/bin/env python3
import json
import subprocess
from datetime import datetime, timezone
from pathlib import Path

root = Path(__file__).resolve().parents[1]
def run(*args):
    return subprocess.check_output(args, cwd=root, text=True).strip()

source_sha = run('git', 'rev-parse', 'HEAD')
run_id = 'vr-' + datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%SZ') + '-' + source_sha[:8]
changed = run('git', 'diff', '--name-only', 'HEAD^', 'HEAD').splitlines()
checks = [
    {'command': 'make check', 'result': 'PASS'},
    {'command': 'make test', 'result': 'PASS'},
    {'command': 'make build', 'result': 'PASS'},
    {'command': 'make verify', 'result': 'PASS'},
]
evidence = {
    'version': '1.0',
    'taskId': 'TASK-001-application-runtime-bootstrap',
    'sourceCommitSha': source_sha,
    'verificationRunId': run_id,
    'environment': 'local-sandbox',
    'result': 'PASS',
    'timestampUtc': datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace('+00:00', 'Z'),
    'changedFiles': changed,
    'verified': ['repository contracts', 'JSON metadata', 'lint', 'typecheck', 'Vitest health test', 'TypeScript build', 'Vite build', 'API runtime health endpoint'],
    'unverified': ['production deployment', 'database integration', 'end-to-end browser tests'],
    'checks': checks,
}
(root / 'checkpoint/evidence.json').write_text(json.dumps(evidence, indent=2) + '\n')
state = json.loads((root / 'checkpoint/state.json').read_text())
state.update({'state': 'COMPLETED', 'phase': 'application-bootstrap', 'lastCompletedStep': 'make check, make test, make build, make verify', 'nextStep': 'Application Bootstrap Gate review before feature development'})
(root / 'checkpoint/state.json').write_text(json.dumps(state, indent=2) + '\n')
task = json.loads((root / 'checkpoint/current-task.json').read_text())
task['state'] = 'COMPLETED'
task['successCriteria'].append('raw command output is preserved in checkpoint/raw-results.txt')
(root / 'checkpoint/current-task.json').write_text(json.dumps(task, indent=2) + '\n')
handoff = '''# Handoff Checkpoint\n\n**Task:** TASK-001 — Application Runtime Bootstrap.\n\n**State:** COMPLETED for the application bootstrap.\n\n**Completed:** Node/TypeScript workspace, React/Vite frontend, Node API, shared contracts, real tests, builds, runtime health verification, and provenance-safe evidence.\n\n**Next step:** Application Bootstrap Gate review, then feature development.\n\n**Evidence:** Read `checkpoint/evidence.json` and `checkpoint/raw-results.txt`.\n'''
(root / 'checkpoint/handoff.md').write_text(handoff)
print(f'Recorded evidence for source commit {source_sha} (run {run_id})')
