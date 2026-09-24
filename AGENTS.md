# 프로젝트: {프로젝트명}

> 이 파일이 에이전트 규칙의 단일 원본이다. Codex는 AGENTS.md를, Claude Code는 이 파일을 import하는 CLAUDE.md를 읽는다.

## 기술 스택
- {언어/런타임 (예: Python 3.12, uv)}
- {핵심 라이브러리 (예: FastAPI, LanceDB)}
- {테스트 (예: pytest)}

## 아키텍처 규칙
- CRITICAL: {절대 지켜야 할 규칙 1 (예: 외부 LLM 호출은 src/llm/ 래퍼를 통해서만 한다)}
- CRITICAL: {절대 지켜야 할 규칙 2 (예: 비밀 값은 .env 에서만 읽고 코드·로그에 남기지 않는다)}
- {일반 규칙 (예: 도메인 로직은 src/, 평가 코드는 eval/ 에 분리)}

## 개발 프로세스
- CRITICAL: 새 기능 구현 시 반드시 테스트를 먼저 작성하고, 테스트가 통과하는 구현을 작성할 것 (TDD)
- CRITICAL: `make verify` 가 유일한 검증 진입점이다. 검증 항목을 추가할 때는 Makefile 의 verify 타깃에 넣는다.
- 커밋 메시지는 conventional commits 형식을 따를 것 (feat:, fix:, docs:, refactor:)

## 명령어
make verify      # lint + test (Stop hook, execute.py, CI가 모두 이 명령을 부른다)
{make eval       # 평가 실행 (docs/EVAL.md 참조)}
