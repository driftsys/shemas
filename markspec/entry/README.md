# `markspec/entry/v1.json`

Typed entry payload used by MarkSpec site APIs.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/entry/v1.json`

Represents a single typed entry (STK, SYS, SRS, SAD, ICD, VAL, SIT, SWT, or
custom type) with its resolved traceability links. Produced by the site builder
at `api/entries/{type}/{display-id}.json` for each entry in the project.

## Quick guide

- Validate strict shape before extracting links.
- Use `id` (ULID) as stable identity when present.
- Use `displayId` for human-facing keys and rendering.
- Parse `links` as resolved targets, not raw source text.

## Properties

| Path                  | Type               | Required | Description                                      |
| --------------------- | ------------------ | -------- | ------------------------------------------------ |
| `displayId`           | string             | yes      | Human-readable display ID (e.g., `SRS_BRK_0001`) |
| `title`               | string             | yes      | Entry title text                                 |
| `entryType`           | string             | yes      | Type abbreviation (e.g., STK, SRS, or custom)    |
| `source`              | string             | yes      | `markdown` or `doc-comment`                      |
| `location`            | object             | yes      | Source location where the entry was defined      |
| `location.file`       | string             | yes      | Relative file path from the project root         |
| `location.line`       | integer            | yes      | Line number (1-based)                            |
| `location.column`     | integer            |          | Column number (1-based)                          |
| `id`                  | string             |          | ULID identifier                                  |
| `body`                | string             |          | Entry body rendered as Markdown                  |
| `attributes[]`        | object[]           |          | Custom attributes (`key`, `value` pairs)         |
| `labels`              | string[]           |          | Labels (e.g., `ASIL-B`)                          |
| `createdAt`           | string (date-time) |          | Creation timestamp                               |
| `createdBy`           | string             |          | Creation author                                  |
| `updatedAt`           | string (date-time) |          | Latest update timestamp                          |
| `updatedBy`           | string             |          | Latest update author                             |
| `links`               | object             |          | Resolved traceability links                      |
| `links.satisfies`     | linkTarget[]       |          | Entries this entry satisfies                     |
| `links.satisfiedBy`   | linkTarget[]       |          | Entries that satisfy this entry                  |
| `links.derivedFrom`   | linkTarget         |          | Entry this is derived from (singular)            |
| `links.derivedTo`     | linkTarget[]       |          | Entries derived from this entry                  |
| `links.allocates`     | linkTarget[]       |          | Components this entry is allocated to            |
| `links.allocatedBy`   | linkTarget[]       |          | Entries allocated to this component              |
| `links.verifies`      | linkTarget[]       |          | Entries this entry verifies                      |
| `links.verifiedBy`    | linkTarget[]       |          | Entries that verify this entry                   |
| `links.implements`    | linkTarget[]       |          | Entries this entry implements                    |
| `links.implementedBy` | linkTarget[]       |          | Entries that implement this entry                |
| `url`                 | string             |          | Relative URL to this entry's detail page         |

## Common pitfall

`derivedFrom` is singular in this schema, while most other link fields are
arrays.
