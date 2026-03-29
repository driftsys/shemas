# `markspec/traceability-graph/v1.json`

Graph payload for visualization and traversal.

## Agent quick guide

- Build node lookup by `nodes[].id` first.
- Resolve edge endpoints via `source`/`target` node IDs.
- Use `displayId` only for labels; use `id` for graph joins.

## Required top-level fields

- `nodes`
- `edges`

## Node required fields

- `id`
- `displayId`
- `title`
- `kind`
- `url`

## Edge required fields

- `source`
- `target`
- `kind`

## Common pitfall

Do not assume `nodes[].entryType` exists for all node kinds.
