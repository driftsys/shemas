# `markspec/link-target/v1.json`

Shared object for resolved link endpoints.

**Schema URL:**
`https://driftsys.github.io/schemas/markspec/link-target/v1.json`

The link-target object is a shared definition used across multiple schemas
(entry, reference, traceability matrix, BOM, deps) to represent a resolved link
to another entry. It carries the target's display ID, title, and URL, plus an
optional `project` object for cross-project links with PURL identification.

## Quick guide

- Use this schema as a nested type inside entry/matrix/BOM/deps payloads.
- Always read `displayId`, `title`, `url` first (all required).
- If `project` exists, the link may cross project boundaries.

## Properties

| Path           | Type   | Required | Description                                     |
| -------------- | ------ | -------- | ----------------------------------------------- |
| `displayId`    | string | yes      | Human-readable display ID of the target entry   |
| `title`        | string | yes      | Title of the target entry                       |
| `url`          | string | yes      | Relative URL to the target entry's page         |
| `entryType`    | string |          | Entry type abbreviation (absent for references) |
| `project`      | object |          | Present only for cross-project links            |
| `project.name` | string | yes      | Canonical reverse-DNS project ID                |
| `project.purl` | string |          | Package URL (PURL) for the external project     |
| `project.url`  | string |          | URL to the external project's site root         |

## Common pitfall

Do not assume `entryType` is present for references.
