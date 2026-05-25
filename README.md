# AI SDLC Orchestrator Monorepo Blueprint

Enterprise-ready monorepo scaffold for an AI-driven SDLC orchestration platform with strict separation between deterministic execution (Go runtime) and probabilistic reasoning (C# Semantic Kernel).

## Core Architectural Rules

1. AI agents **never execute infrastructure commands** directly.
2. Go runtime is the **only execution authority** for infrastructure, Git, and QA actions.
3. C# Semantic Kernel services provide **planning, reasoning, and review recommendations only**.
4. Contracts under `shared/contracts` and `shared/schemas` define boundaries between services.
5. Messaging is abstraction-first and transport-agnostic to support future NATS or gRPC.

## Suggested Project Names

- **Platform**: `ai-sdlc-orchestrator`
- **Go services**:
  - `orchestrator-go`
  - `worker-go`
  - `qa-runner-go`
- **C# Semantic Kernel services**:
  - `planner-sk`
  - `reviewer-sk`

## Monorepo Structure

```text
ai-sdlc-orchestrator/
├── apps/
│   ├── orchestrator-go/
│   ├── worker-go/
│   ├── qa-runner-go/
│   ├── planner-sk/
│   └── reviewer-sk/
├── internal/
│   ├── workflow-engine/
│   │   ├── engine/
│   │   ├── definitions/
│   │   ├── handlers/
│   │   ├── state/
│   │   └── transitions/
│   ├── runtime/
│   ├── execution/
│   ├── queue/
│   ├── memory/
│   ├── agents/
│   ├── planning/
│   ├── validation/
│   ├── git/
│   ├── observability/
│   ├── policies/
│   └── security/
├── integrations/
│   ├── aha/
│   ├── gitlab/
│   ├── aws/
│   ├── postman/
│   └── documentation-rag/
├── shared/
│   ├── contracts/
│   │   ├── api/
│   │   ├── events/
│   │   └── grpc/
│   ├── schemas/
│   │   ├── commands/
│   │   └── events/
│   ├── prompts/
│   │   ├── planning/
│   │   └── review/
│   ├── configs/
│   └── sdk/
│       ├── go/
│       └── csharp/
├── company-knowledge/
│   ├── architecture/
│   ├── coding-standards/
│   ├── runbooks/
│   ├── common-failures/
│   ├── api-guides/
│   ├── deployment-guides/
│   └── postman-guides/
├── docs/
│   ├── architecture/
│   ├── workflows/
│   ├── adr/
│   ├── diagrams/
│   └── demos/
├── bootstraps/
│   ├── local/
│   ├── aws/
│   └── ci/
├── deployments/
│   ├── docker/
│   ├── k8s/
│   │   └── base/
│   └── k3s/
├── scripts/
├── tests/
│   ├── integration/
│   ├── regression/
│   ├── smoke/
│   └── fixtures/
├── .env.example
├── docker-compose.yml
├── Makefile
└── .gitignore
```

## Naming Conventions

- Domain-oriented package paths (e.g., `internal/workflow-engine/engine`).
- Event names: `<domain>.<entity>.<action>.v<version>` (e.g., `workflow.run.started.v1`).
- Schema filenames: kebab-case and versioned (e.g., `workflow.lifecycle.v1.schema.json`).
- ADRs: `ADR-XXXX-short-title.md`.
- Environment files: `.env.<stage>` and `shared/configs/<stage>.yaml`.

## Development Commands

```bash
make bootstrap
make validate-structure
make docs-lint
make up
make down
```

## Workflow Engine Scope

`internal/workflow-engine` contains deterministic orchestration logic:

- workflow definitions and transitions
- execution handlers and retry policies
- run state and checkpoint management
- event publishing hooks (NATS/gRPC compatible)

## Event Schema Scope

- Event envelope contract: `shared/contracts/events/envelope.v1.json`
- Workflow lifecycle schema: `shared/schemas/events/workflow.lifecycle.v1.schema.json`

## ADR Index

See `docs/adr/README.md`.
