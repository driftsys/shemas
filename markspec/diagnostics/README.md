# `markspec/diagnostics/v1.json`

Validation and compilation diagnostics payload.

## Agent quick guide

- Use `bySeverity` for quick status summaries.
- Iterate `diagnostics[]` for actionable details.
- Route to source using `location.file` and `location.line`.

## Required top-level fields

- `count`
- `bySeverity`
- `diagnostics`

## Optional top-level fields

- `generated`

## `bySeverity` required fields

- `error`
- `warning`
- `info`

## `diagnostics[]` required fields

- `severity`
- `code`
- `message`
- `location`

## `diagnostics[]` optional fields

- `entry`

## Common pitfall

Do not assume `entry` is present for every diagnostic.
