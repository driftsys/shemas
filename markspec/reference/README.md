# `markspec/reference/v1.json`

Reference entry payload (standards, norms, external documents).

## Agent quick guide

- Treat references as first-class nodes with distinct ID rules.
- Use `displayId` pattern for matching external standard IDs.
- Check lifecycle fields (`status`, `supersededBy`) before presenting as active.

## Required fields

- `displayId`
- `title`
- `source`
- `location`

## Optional fields

- `id`, `body`, `url`
- document metadata: `document`, `externalUrl`, `status`, `supersededBy`
- provenance: `createdAt`, `createdBy`, `updatedAt`, `updatedBy`
- `links.referencedBy`

## Common pitfall

Do not require `entryType` for references.
