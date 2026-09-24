#!/usr/bin/env bash
# PreToolUse adapter for Claude Code (matcher: Write|Edit|MultiEdit).
# tool_input.file_path 하나를 뽑아 tdd-guard-core.sh 에 넘긴다.
set -euo pipefail

input=$(cat)
file_path=$(jq -r '.tool_input.file_path // empty' <<< "$input")
cwd=$(jq -r '.cwd // empty' <<< "$input")

[[ -z "$file_path" ]] && exit 0
[[ -z "$cwd" ]] && cwd="$(pwd)"

exec "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/tdd-guard-core.sh" "$cwd" "$file_path"
