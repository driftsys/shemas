# `markspec/deps/v1.json`

Cross-project dependency payload with optional reverse dependency data.

## Agent quick guide

- Always parse `dependencies` first; `dependants` may be absent.
- Use `refs[]` to explain concrete entry-level relationships.
- Project-level links (`name`, `purl`, `url`) are summary metadata.

## Required top-level fields

- `project`
- `dependencies`

## Optional top-level fields

- `generated`
- `dependants`

## `dependencies[]` / `dependants[]` required fields

- `name`
- `refs`

## `refs[]` required fields

- `from`
- `to`

## `refs[]` optional fields

- `kind`

## Common pitfall

Do not assume reverse dependency data (`dependants`) is always present.
