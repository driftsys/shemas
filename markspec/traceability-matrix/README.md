# `markspec/traceability-matrix/v1.json`

Tabular traceability payload with one row per entry.

**Schema URL:**
`https://driftsys.github.io/schemas/markspec/traceability-matrix/v1.json`

Full traceability matrix with one row per entry, showing all link directions
(satisfies, derived-from, allocates, verifies, implements and their inverses).
Produced at `api/traceability/matrix.json`. Used for report and table generation
where resolved link targets eliminate the need for additional ID resolution.

## Quick guide

- Use this schema for report/table generation.
- Rows contain resolved link targets, so no additional ID resolution is
  required.
- `count` should match `rows.length` in valid producer output.

## Properties

| Path                   | Type               | Required | Description                             |
| ---------------------- | ------------------ | -------- | --------------------------------------- |
| `count`                | integer            | yes      | Total number of rows in the matrix      |
| `rows[]`               | object[]           | yes      | One row per entry                       |
| `rows[].displayId`     | string             | yes      | Human-readable display ID               |
| `rows[].title`         | string             | yes      | Entry title                             |
| `rows[].entryType`     | string             | yes      | Entry type abbreviation                 |
| `rows[].satisfies`     | linkTarget[]       |          | Entries this entry satisfies            |
| `rows[].satisfiedBy`   | linkTarget[]       |          | Entries that satisfy this entry         |
| `rows[].derivedFrom`   | linkTarget         |          | Entry this is derived from (singular)   |
| `rows[].derivedTo`     | linkTarget[]       |          | Entries derived from this entry         |
| `rows[].allocates`     | linkTarget[]       |          | Components this entry is allocated to   |
| `rows[].allocatedBy`   | linkTarget[]       |          | Entries allocated to this component     |
| `rows[].verifies`      | linkTarget[]       |          | Entries this entry verifies             |
| `rows[].verifiedBy`    | linkTarget[]       |          | Entries that verify this entry          |
| `rows[].implements`    | linkTarget[]       |          | Entries this entry implements           |
| `rows[].implementedBy` | linkTarget[]       |          | Entries that implement this entry       |
| `rows[].url`           | string             |          | Relative URL to the entry's detail page |
| `generated`            | string (date-time) |          | Timestamp of matrix generation          |

## Common pitfall

`derivedFrom` is singular; most other directional fields are arrays.
