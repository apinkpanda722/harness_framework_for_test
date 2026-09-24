#!/usr/bin/env bash
# TDD 정책 공통 코어: src/ 아래 .py 파일을 수정하기 전에 tests/ 아래 test_<이름>.py 가 있어야 한다.
#
# 사용법: tdd-guard-core.sh <cwd> <file_path> [<file_path> ...]
# 위반이 있으면 사유를 stderr에 출력하고 exit 2, 없으면 exit 0.
# src/ 밖(eval/, data/, scripts/ 등)과 __init__.py 는 검사하지 않는다.
# 예외 규칙은 이 파일에만 둔다 — Claude/Codex 어댑터에 복사하면 한쪽만 갱신되어 어긋난다.
set -euo pipefail

cwd="${1:?cwd required}"
shift

reasons=()

for file_path in "$@"; do
  [[ -z "$file_path" ]] && continue
  rel="${file_path#"$cwd"/}"
  [[ "$rel" == src/* ]] || continue
  [[ "$rel" == *.py ]] || continue
  name=$(basename -- "$rel")
  [[ "$name" == "__init__.py" ]] && continue

  test_name="test_${name}"
  if [[ -z "$(find "$cwd/tests" -name "$test_name" -print -quit 2>/dev/null)" ]]; then
    reasons+=("TDD 정책: ${rel} 를 수정하기 전에 tests/ 아래에 ${test_name} 를 먼저 작성하세요 (test-first).")
  fi
done

if [[ ${#reasons[@]} -gt 0 ]]; then
  printf '%s\n' "${reasons[@]}" >&2
  exit 2
fi

exit 0
