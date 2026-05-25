# Architecture Overview

## Layers

- **Probabilistic AI layer (C# + Semantic Kernel)**: planning, reasoning, review suggestions.
- **Deterministic execution layer (Go)**: workflow execution, infrastructure commands, queue handling.
- **Shared contracts layer**: transport-neutral contracts/schemas used by both layers.

## Event-Driven Pattern

All major state changes are emitted as events. Command intent can flow from planner/reviewer to orchestrator via contract-defined messages, then executed by Go runtime only.
