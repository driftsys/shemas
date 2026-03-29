# `markspec/deps/v1.json`

Cross-project dependency payload with optional reverse dependency data.

**Schema URL:** `https://driftsys.github.io/schemas/markspec/deps/v1.json`

Cross-project dependency and dependant information with entry-level detail.
Produced at `api/entries/deps/index.json`. Lists projects this project depends
on (declared in `project.yaml`) and projects that depend on this project, with
concrete entry-level references showing which entries are linked across project
boundaries.

## Quick guide

- Always parse `dependencies` first; `dependants` may be absent.
- Use `refs[]` to explain concrete entry-level relationships.
- Project-level links (`name`, `purl`, `url`) are summary metadata.

## Properties

| Path                         | Type               | Required | Description                             |
| ---------------------------- | ------------------ | -------- | --------------------------------------- |
| `project`                    | string             | yes      | Canonical reverse-DNS project ID        |
| `dependencies[]`             | object[]           | yes      | Projects this project depends on        |
| `dependencies[].name`        | string             | yes      | Canonical project ID of the dependency  |
| `dependencies[].purl`        | string             |          | Package URL (PURL)                      |
| `dependencies[].url`         | string             |          | URL to the dependency's site root       |
| `dependencies[].refs[]`      | object[]           | yes      | Entry-level cross-project references    |
| `dependencies[].refs[].from` | string             | yes      | Local entry display ID                  |
| `dependencies[].refs[].to`   | string             | yes      | Dependency entry display ID             |
| `dependencies[].refs[].kind` | string             |          | Link kind                               |
| `dependants[]`               | object[]           |          | Projects that depend on this project    |
| `dependants[].name`          | string             | yes      | Canonical project ID of the dependant   |
| `dependants[].purl`          | string             |          | Package URL (PURL)                      |
| `dependants[].url`           | string             |          | URL to the dependant's site root        |
| `dependants[].refs[]`        | object[]           | yes      | Entry-level references                  |
| `dependants[].refs[].from`   | string             | yes      | Dependant entry display ID              |
| `dependants[].refs[].to`     | string             | yes      | Local entry display ID                  |
| `dependants[].refs[].kind`   | string             |          | Link kind                               |
| `generated`                  | string (date-time) |          | Timestamp of dependency data generation |

## Common pitfall

Do not assume reverse dependency data (`dependants`) is always present.
