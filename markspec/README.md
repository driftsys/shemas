# MarkSpec schemas

JSON Schema contracts for MarkSpec artifacts.

## Usage

1. Detect payload kind (entry, reference, index, matrix, etc.).
2. Validate against the matching `v1.json` before processing.
3. Parse required fields first, optional fields second.
4. Treat all objects as closed unless the schema explicitly allows extension.

## Schema index

| Schema                                                     | README                                                         | Primary purpose                             | Stable key                |
| ---------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------- | ------------------------- |
| [lock/v1.json](lock/v1.json)                               | [lock/README.md](lock/README.md)                               | Frozen sidecar metadata (`.markspec.lock`). | ULID map key              |
| [link-target/v1.json](link-target/v1.json)                 | [link-target/README.md](link-target/README.md)                 | Shared resolved-link target object.         | `displayId`               |
| [entry/v1.json](entry/v1.json)                             | [entry/README.md](entry/README.md)                             | Typed entry detail payload.                 | `id` (ULID) / `displayId` |
| [reference/v1.json](reference/v1.json)                     | [reference/README.md](reference/README.md)                     | Reference entry payload.                    | `id` (ULID) / `displayId` |
| [index/v1.json](index/v1.json)                             | [index/README.md](index/README.md)                             | Entry listing payloads.                     | `entries[].displayId`     |
| [search/v1.json](search/v1.json)                           | [search/README.md](search/README.md)                           | Search records for client indexing.         | `displayId`               |
| [traceability-matrix/v1.json](traceability-matrix/v1.json) | [traceability-matrix/README.md](traceability-matrix/README.md) | Full traceability matrix rows.              | `rows[].displayId`        |
| [traceability-graph/v1.json](traceability-graph/v1.json)   | [traceability-graph/README.md](traceability-graph/README.md)   | Graph nodes and edges.                      | `nodes[].id`              |
| [coverage/v1.json](coverage/v1.json)                       | [coverage/README.md](coverage/README.md)                       | Coverage summary and gaps.                  | `gaps[].displayId`        |
| [bom/v1.json](bom/v1.json)                                 | [bom/README.md](bom/README.md)                                 | Architecture/BOM tree.                      | `bomNode.displayId`       |
| [deps/v1.json](deps/v1.json)                               | [deps/README.md](deps/README.md)                               | Cross-project dependency payload.           | `refs[].from/to`          |
| [diagnostics/v1.json](diagnostics/v1.json)                 | [diagnostics/README.md](diagnostics/README.md)                 | Validation/build diagnostics.               | `code + location`         |

## Conventions

- each schema lives in `<name>/v1.json`
- schema-local docs live in `<name>/README.md`
- schema fixtures live in `<name>/tests/`
- `$id` follows `https://driftsys.github.io/schemas/markspec/<name>/v1.json`
