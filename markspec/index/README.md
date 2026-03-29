# `markspec/index/v1.json`

Listing payload for global/per-type/reference entry indexes.

## Agent quick guide

- Use for fast listing and navigation, not full traceability graph logic.
- `entries[]` is summary-level metadata only.
- Resolve details by following `entries[].url` or loading entry/reference
  payloads.

## Required fields

- `scope`
- `count`
- `entries`

## Optional fields

- `generated`
- `project` (`name`, `domain`, `version` when present)

## `entries[]` required fields

- `displayId`
- `title`
- `url`

## Common pitfall

Do not assume `project` exists in every scoped index file.
