# `markspec/bom/v1.json`

Architecture/BOM tree payload for component structure and allocation context.

## Agent quick guide

- Traverse from `roots[]` recursively through `children[]`.
- Use `displayId` as node identity inside one BOM payload.
- Combine with link-target references for allocation/verification context.

## Required top-level fields

- `project`
- `version`
- `totalComponents`
- `roots`

## Optional top-level fields

- `generated`

## `bomNode` required fields

- `displayId`
- `title`
- `nodeType`
- `children`

## `bomNode` optional fields

- `deployment`, `deployedOn`
- `allocatedReqs`, `verifiedBy`
- `coverage`
- `url`

## Common pitfall

Do not treat `children` as optional; empty leaf arrays are still required.
