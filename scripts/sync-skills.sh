#!/usr/bin/env bash
# Copy the shared skills/ into each plugin directory. `--check` fails if a copy has drifted (for CI).
set -euo pipefail
cd "$(dirname "$0")/.."
for p in claude codex; do
  if [ "${1:-}" = "--check" ]; then
    diff -r skills "$p/skills" >/dev/null || { echo "$p/skills is out of date: run scripts/sync-skills.sh" >&2; exit 1; }
  else
    rm -rf "$p/skills" && cp -R skills "$p/skills"
  fi
done
