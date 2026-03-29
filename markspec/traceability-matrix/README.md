# `markspec/traceability-matrix/v1.json`

Tabular traceability payload with one row per entry.

## Agent quick guide

- Use this schema for report/table generation.
- Rows contain resolved link targets, so no additional ID resolution is
  required.
- `count` should match `rows.length` in valid producer output.

## Required top-level fields

- `count`
- `rows`

## Optional top-level fields

- `generated`

## Row required fields

- `displayId`
- `title`
- `entryType`

## Row link fields

- `satisfies`, `satisfiedBy`
- `derivedFrom`, `derivedTo`
- `allocates`, `allocatedBy`
- `verifies`, `verifiedBy`
- `implements`, `implementedBy`

## Common pitfall

`derivedFrom` is singular; most other directional fields are arrays.
