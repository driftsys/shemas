# `markspec/traceability-graph/v1.json`

Graph payload for visualization and traversal.

**Schema URL:**
`https://driftsys.github.io/schemas/markspec/traceability-graph/v1.json`

Nodes and edges for traceability graph visualization. Produced at
`api/traceability/graph.json`. Nodes are colored by type category (requirement,
architecture, verification, custom, reference) and edges are styled by link kind
(satisfies, derived-from, allocates, verifies, implements). Designed for D3
force-directed layout rendering.

## Quick guide

- Build node lookup by `nodes[].id` first.
- Resolve edge endpoints via `source`/`target` node IDs.
- Use `displayId` only for labels; use `id` for graph joins.

## Properties

| Path                | Type     | Required | Description                        |
| ------------------- | -------- | -------- | ---------------------------------- |
| `nodes[]`           | object[] | yes      | Graph nodes, one per entry         |
| `nodes[].id`        | string   | yes      | Node identifier (display ID)       |
| `nodes[].displayId` | string   | yes      | Human-readable display ID          |
| `nodes[].title`     | string   | yes      | Entry title for tooltip/label      |
| `nodes[].kind`      | string   | yes      | Node kind for categorization       |
| `nodes[].url`       | string   | yes      | Relative URL for click-to-navigate |
| `nodes[].entryType` | string   |          | Entry type abbreviation            |
| `edges[]`           | object[] | yes      | Directed traceability edges        |
| `edges[].source`    | string   | yes      | Display ID of the source node      |
| `edges[].target`    | string   | yes      | Display ID of the target node      |
| `edges[].kind`      | string   | yes      | Link kind (see values below)       |

### Edge kind values

`satisfies`, `satisfiedBy`, `derivedFrom`, `derivedTo`, `allocates`,
`allocatedBy`, `verifies`, `verifiedBy`, `implements`, `implementedBy`

## Common pitfall

Do not assume `nodes[].entryType` exists for all node kinds.
