# Contributing

## Adding a Schema

1. Create a directory named after the schema.
2. Add a `v1.json` file containing the JSON Schema (draft-07).
3. Add a `README.md` documenting every field, examples, and design decisions.

## Modifying a Schema

- **Non-breaking changes** (new optional fields): edit the existing `v<N>.json`
  in place.
- **Breaking changes** (new required fields, removed fields, changed
  constraints): create a new `v<N+1>.json` file.
- Always update the corresponding `README.md` to match.

## Conventions

- `$id` must match the GitHub Pages URL:
  `https://driftsys.github.io/schemas/<name>/v<N>.json`
- Field names follow Cargo.toml / package.json conventions.
- Use `additionalProperties: false` on root objects.
