# `markspec/search/v1.json`

Flat record array used for client-side search indexing.

## Agent quick guide

- Treat each item as self-contained search document.
- `body` is required and intended for search, not exact source reconstruction.
- Use `url` as the navigation target.

## Record required fields

- `displayId`
- `title`
- `body`
- `entryType`
- `url`

## Optional fields

- `labels`

## Common pitfall

Do not infer full traceability links from search payloads.
