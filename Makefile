.PHONY: verify

# 하네스의 단일 검증 진입점. Stop hook, scripts/execute.py, step AC가 모두 이 타깃을 호출한다.
# 프로젝트 스택에 맞게 lint / typecheck / test 를 채운다.
verify:
	python3 -m pytest -q
