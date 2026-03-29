# `markspec/index/v1.json`

Listing payload for global/per-type/reference entry indexes.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/index/v1.json`

Index of entries scoped globally, by type, or by reference category. Used for
`api/index.json` (global), `api/entries/index.json` (all entries),
`api/entries/{type}/index.json` (per-type), and `api/entries/refs/index.json`
(references). Contains summary-level metadata for fast listing and navigation.

## Quick guide

- Use for fast listing and navigation, not full traceability graph logic.
- `entries[]` is summary-level metadata only.
- Resolve details by following `entries[].url` or loading entry/reference
  payloads.

## Properties

| Path                  | Type     | Required | Description                                           |
| --------------------- | -------- | -------- | ----------------------------------------------------- |
| `scope`               | string   | yes      | Index scope: `global`, a type abbreviation, or `refs` |
| `count`               | integer  | yes      | Total number of entries in this index                 |
| `entries[]`           | object[] | yes      | Entry summaries                                       |
| `entries[].displayId` | string   | yes      | Human-readable display ID                             |
| `entries[].title`     | string   | yes      | Entry title                                           |
| `entries[].url`       | string   | yes      | Relative URL to the detail page                       |
| `entries[].entryType` | string   |          | Entry type abbreviation                               |
| `entries[].labels`    | string[] |          | Labels attached to this entry                         |

| `project` | object | | Project metadata (global index only) | | `project.name`
| string | yes | Canonical reverse-DNS project ID | | `project.domain` | string
| yes | Domain abbreviation (e.g., BRK) | | `project.version`| string | yes |
Project version string |

## Common pitfall

Do not assume `project` exists in every scoped index file.
