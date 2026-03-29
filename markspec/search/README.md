# `markspec/search/v1.json`

Flat record array used for client-side search indexing.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/search/v1.json`

Flat array optimized for client-side search with MiniSearch. Each element
contains the fields needed for indexing and the stored fields returned in search
results. Produced at `api/search.json` and lazy-loaded on first keystroke in the
site search UI.

## Quick guide

- Treat each item as self-contained search document.
- `body` is required and intended for search, not exact source reconstruction.
- Use `url` as the navigation target.

## Properties

Root type is `array`. Each element:

| Path           | Type     | Required | Description                      |
| -------------- | -------- | -------- | -------------------------------- |
| `[].displayId` | string   | yes      | Human-readable display ID        |
| `[].title`     | string   | yes      | Entry title                      |
| `[].body`      | string   | yes      | Truncated body text for indexing |
| `[].entryType` | string   | yes      | Entry type abbreviation          |
| `[].url`       | string   | yes      | Relative URL to the entry's page |
| `[].labels`    | string[] |          | Labels attached to this entry    |

## Common pitfall

Do not infer full traceability links from search payloads.
