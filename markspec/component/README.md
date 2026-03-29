# `markspec/component/v1.json`

Single BOM component detail payload used by MarkSpec site APIs.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/component/v1.json`

Represents a single BOM component entry (CMP namespace) with deployment,
allocation, and verification detail. Produced by the site builder at
`api/entries/component/{display-id}.json` for each component in the project.
Components use `Part-of` to build the product tree and `Deployable-on` for
deployment chains.

## Quick guide

- Use `displayId` for human-facing keys and rendering.
- Use `id` (ULID) as stable identity when present.
- `partOf` is the parent component's display ID; `null` for root components.
- `deployedOn` is a resolved link target, not a raw string.

## Properties

| Path                 | Type               | Required | Description                                                  |
| -------------------- | ------------------ | -------- | ------------------------------------------------------------ |
| `displayId`          | string             | yes      | Human-readable display ID (e.g., `CMP_BRK_001`)              |
| `title`              | string             | yes      | Component title                                              |
| `nodeType`           | string             | yes      | `component`, `part`, `module`, `service`, or `device`        |
| `source`             | string             | yes      | `markdown` or `doc-comment`                                  |
| `location`           | object             | yes      | Source location where the component was defined              |
| `location.file`      | string             | yes      | Relative file path from the project root                     |
| `location.line`      | integer            | yes      | Line number (1-based)                                        |
| `location.column`    | integer            |          | Column number (1-based)                                      |
| `id`                 | string             |          | ULID identifier                                              |
| `partOf`             | string \| null     |          | Parent component display ID (from `Part-of`). Null for roots |
| `attributes[]`       | object[]           |          | Custom attributes (`key`, `value` pairs)                     |
| `labels`             | string[]           |          | Labels (e.g., `ASIL-B`)                                      |
| `createdAt`          | string (date-time) |          | Creation timestamp                                           |
| `createdBy`          | string             |          | Creation author                                              |
| `updatedAt`          | string (date-time) |          | Latest update timestamp                                      |
| `updatedBy`          | string             |          | Latest update author                                         |
| `deployedOn`         | linkTarget \| null |          | Deployment target (from `Deployable-on`)                     |
| `allocatedReqs`      | linkTarget[]       |          | Requirements allocated to this component                     |
| `verifiedBy`         | linkTarget[]       |          | Verification entries for this component                      |
| `coverage`           | object             |          | Per-component coverage summary                               |
| `coverage.allocated` | integer            |          | Number of allocated requirements                             |
| `coverage.verified`  | integer            |          | Number of verification entries                               |
| `url`                | string             |          | Relative URL to this component's detail page                 |

## Common pitfall

`partOf` is a display ID string, not a linkTarget object — unlike `deployedOn`
which is a full resolved link.
