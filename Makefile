SHELL := /bin/bash

.PHONY: bootstrap bootstrap-local bootstrap-aws bootstrap-ci \
validate-structure docs-lint test-smoke up down

bootstrap: bootstrap-local

bootstrap-local:
	./bootstraps/local/bootstrap.sh

bootstrap-aws:
	./bootstraps/aws/bootstrap.sh

bootstrap-ci:
	./bootstraps/ci/bootstrap.sh

validate-structure:
	@test -d apps/orchestrator-go
	@test -d apps/planner-sk
	@test -d internal/workflow-engine/engine
	@test -d shared/contracts/events
	@test -d shared/schemas/events
	@test -d docs/adr
	@test -f shared/contracts/events/envelope.v1.json
	@test -f shared/schemas/events/workflow.lifecycle.v1.schema.json
	@echo "Structure validation passed"

docs-lint:
	@test -f README.md
	@test -f docs/architecture/overview.md
	@test -f docs/adr/ADR-0001-runtime-ai-separation.md
	@echo "Docs skeleton validation passed"

test-smoke: validate-structure docs-lint

up:
	docker compose up -d

down:
	docker compose down
