# `markspec/bom/v1.json`

BOM index listing component summaries for tree assembly.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/bom/v1.json`

Lists all BOM components with enough metadata to assemble the product
architecture tree client-side. Produced at `api/entries/component/index.json`.
Components use the `CMP` namespace; `partOf` encodes the `Part-of` tree
structure. For full component detail, fetch the individual component JSON using
`markspec/component/v1.json`.

## Quick guide

- Build the tree client-side from `partOf` references.
- Root components have `partOf: null`.
- Use `url` to link to component detail pages.
- Fetch `api/entries/component/{display-id}.json` for full component data.

## Properties

| Path                     | Type           | Required | Description                                           |
| ------------------------ | -------------- | -------- | ----------------------------------------------------- |
| `project`                | string         | yes      | Canonical reverse-DNS project ID                      |
| `version`                | string         | yes      | Project version string                                |
| `totalComponents`        | integer        | yes      | Total number of CMP entries                           |
| `components[]`           | object[]       | yes      | Flat list of component summaries                      |
| `components[].displayId` | string         | yes      | Human-readable display ID                             |
| `components[].title`     | string         | yes      | Component title                                       |
| `components[].nodeType`  | string         | yes      | `component`, `part`, `module`, `service`, or `device` |
| `components[].partOf`    | string \| null |          | Parent component display ID. Null for roots           |
| `components[].url`       | string         | yes      | Relative URL to this component's page                 |

## Common pitfall

This is a summary index — allocation, deployment, and coverage data live in the
individual component detail files (`markspec/component/v1.json`).
