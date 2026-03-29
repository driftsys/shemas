# `markspec/reference/v1.json`

Reference entry payload (standards, norms, external documents).

**Schema URL:** `https://driftsys.github.io/schemas/markspec/reference/v1.json`

Represents a reference entry for external standards, documents, or norms. Same
base shape as an entry but with different required fields and additional
metadata (document number, external URL, lifecycle status). Produced at
`api/entries/refs/{display-id}.json`.

## Quick guide

- Treat references as first-class nodes with distinct ID rules.
- Use `displayId` pattern for matching external standard IDs.
- Check lifecycle fields (`status`, `supersededBy`) before presenting as active.

## Properties

| Path                 | Type               | Required | Description                                     |
| -------------------- | ------------------ | -------- | ----------------------------------------------- |
| `displayId`          | string             | yes      | Human-readable display ID (e.g., `ISO-26262-6`) |
| `title`              | string             | yes      | Reference title                                 |
| `source`             | string             | yes      | `markdown` or `doc-comment`                     |
| `location`           | object             | yes      | Source location where the reference was defined |
| `location.file`      | string             | yes      | Relative file path from the project root        |
| `location.line`      | integer            | yes      | Line number (1-based)                           |
| `location.column`    | integer            |          | Column number (1-based)                         |
| `id`                 | string             |          | ULID identifier                                 |
| `body`               | string             |          | Reference body rendered as Markdown             |
| `document`           | string \| null     |          | Document number or standard identifier          |
| `externalUrl`        | string \| null     |          | URL to the external document                    |
| `status`             | string \| null     |          | `active`, `superseded`, or `withdrawn`          |
| `supersededBy`       | string \| null     |          | Display ID of the superseding reference         |
| `attributes[]`       | object[]           |          | Custom attributes (`key`, `value` pairs)        |
| `labels`             | string[]           |          | Labels attached to this reference               |
| `createdAt`          | string (date-time) |          | Creation timestamp                              |
| `createdBy`          | string             |          | Creation author                                 |
| `updatedAt`          | string (date-time) |          | Latest update timestamp                         |
| `updatedBy`          | string             |          | Latest update author                            |
| `links`              | object             |          | Incoming links                                  |
| `links.referencedBy` | linkTarget[]       |          | Entries that reference this document            |
| `url`                | string             |          | Relative URL to this reference's detail page    |

## Common pitfall

Do not require `entryType` for references.
