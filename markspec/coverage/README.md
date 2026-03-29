# `markspec/coverage/v1.json`

Coverage summary plus explicit gap list.

## Agent quick guide

- Use top-level `coverage` percentages for dashboards.
- Use `gaps[]` for actionable remediation output.
- Treat percentages as numeric values, not guaranteed integer percentages.

## Required top-level fields

- `total`
- `coverage`
- `gaps`

## Optional top-level fields

- `generated`

## Gap required fields

- `displayId`
- `title`
- `missing`

## Common pitfall

Do not assume `url` exists for every gap row.
