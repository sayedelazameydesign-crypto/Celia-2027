.PHONY: setup lint typecheck test build verify deploy

setup:
	./scripts/setup.sh

lint:
	./scripts/test.sh lint

typecheck:
	./scripts/test.sh typecheck

test:
	./scripts/test.sh test

build:
	./scripts/build.sh

verify:
	./scripts/verify.sh

deploy:
	./scripts/deploy.sh
