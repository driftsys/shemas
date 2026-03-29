# `markspec/coverage/v1.json`

Coverage summary plus explicit gap list.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/coverage/v1.json`

Coverage statistics and gap analysis for the project. Produced at
`api/coverage/index.json`. Includes aggregate counters (satisfied, verified,
unsatisfied, unverified) and explicit gap lists (orphans, unsatisfied parents,
unverified entries) for dashboards and actionable remediation output.

## Quick guide

- Use top-level `coverage` percentages for dashboards.
- Use `gaps[]` for actionable remediation output.
- Treat percentages as numeric values, not guaranteed integer percentages.

## Properties

| Path                    | Type     | Required | Description                             |
| ----------------------- | -------- | -------- | --------------------------------------- |
| `total`                 | integer  | yes      | Total number of entries analyzed        |
| `coverage`              | object   | yes      | Aggregate coverage counters             |
| `coverage.requirements` | number   |          | Requirements coverage ratio             |
| `coverage.tests`        | number   |          | Tests coverage ratio                    |
| `coverage.traceability` | number   |          | Traceability coverage ratio             |
| `gaps[]`                | object[] | yes      | Entries with traceability gaps          |
| `gaps[].displayId`      | string   | yes      | Human-readable display ID               |
| `gaps[].title`          | string   | yes      | Entry title                             |
| `gaps[].missing`        | string[] | yes      | Missing link kinds                      |
| `gaps[].url`            | string   |          | Relative URL to the entry's detail page |

## Common pitfall

Do not assume `url` exists for every gap row.
