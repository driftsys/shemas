# `markspec/lock/v1.json`

Schema for `.markspec.lock`, a machine-managed sidecar for frozen metadata.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/lock/v1.json`

The lock file (`.markspec.lock`) is a machine-managed sidecar that stores frozen
metadata for every entry and reference in the project. Each record is keyed by
ULID and contains stamped identity, attributes, and provenance fields that
survive across edits to the source markdown.

## Quick guide

- Use lock data as durable metadata, separate from markdown authoring text.
- Join lock records to entries/references by ULID map key.
- Treat missing optional provenance/sync fields as unknown, not invalid.

## Properties

| Path                                       | Type               | Required | Description                             |
| ------------------------------------------ | ------------------ | -------- | --------------------------------------- |
| `entries`                                  | object             | yes      | Entry metadata indexed by ULID          |
| `entries.<ULID>`                           | object             | yes      | Metadata for a single entry             |
| `entries.<ULID>.displayId`                 | string             | yes      | Current display ID for the ULID         |
| `entries.<ULID>.createdAt`                 | string (date-time) |          | Creation timestamp                      |
| `entries.<ULID>.createdBy`                 | string             |          | Creation author                         |
| `entries.<ULID>.updatedAt`                 | string (date-time) |          | Latest update timestamp                 |
| `entries.<ULID>.updatedBy`                 | string             |          | Latest update author                    |
| `entries.<ULID>.external`                  | object             |          | External tool sync metadata by tool key |
| `entries.<ULID>.external.<tool>.ref`       | string             | yes      | External system identifier              |
| `entries.<ULID>.external.<tool>.direction` | string             | yes      | `import`, `export`, or `bidirectional`  |
| `entries.<ULID>.external.<tool>.syncedAt`  | string (date-time) |          | Last sync timestamp                     |
| `$schema`                                  | string (uri)       |          | Schema URI                              |

## Common pitfall

Do not assume all entries in markdown are already present in lock during partial
workflows; validation should report drift explicitly.
