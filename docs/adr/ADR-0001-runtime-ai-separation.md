# ADR-0001: Separate deterministic runtime from probabilistic AI planning

## Status
Accepted

## Context
Infrastructure execution must be controlled, auditable, and policy-enforced.

## Decision
C# Semantic Kernel services generate plans/reasoning only. Go services execute all commands and mutate runtime state.

## Consequences
- Clear trust boundary for security and compliance.
- Easier future migration to Kubernetes/k3s with stable runtime contracts.
