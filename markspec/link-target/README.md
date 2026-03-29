# `markspec/link-target/v1.json`

Shared object for resolved link endpoints.

## Agent quick guide

- Use this schema as a nested type inside entry/matrix/BOM/deps payloads.
- Always read `displayId`, `title`, `url` first (all required).
- If `project` exists, the link may cross project boundaries.

## Required fields

- `displayId`
- `title`
- `url`

## Optional fields

- `entryType`
- `project` (`name` required when present, plus optional `purl`, `url`)

## Common pitfall

Do not assume `entryType` is present for references.
