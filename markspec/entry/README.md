# `markspec/entry/v1.json`

Typed entry payload used by MarkSpec site APIs.

## Agent quick guide

- Validate strict shape before extracting links.
- Use `id` (ULID) as stable identity when present.
- Use `displayId` for human-facing keys and rendering.
- Parse `links` as resolved targets, not raw source text.

## Required fields

- `displayId`
- `title`
- `entryType`
- `source`
- `location`

## Optional fields

- `id`, `body`, `attributes`, `labels`, `url`
- provenance: `createdAt`, `createdBy`, `updatedAt`, `updatedBy`
- `links` object and its directional link arrays/objects

## Parse order (recommended)

1. Identity: `id`, `displayId`, `entryType`
2. Content: `title`, `body`, `labels`
3. Provenance: created/updated fields
4. Trace links: `links.*`

## Common pitfall

`derivedFrom` is singular in this schema, while most other link fields are
arrays.
