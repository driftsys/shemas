# Project Schema Contract

A minimal, flat project manifest. Describes what the project is and where it
lives — nothing more. Validate payloads against this schema before processing.

**Schema URL:** `https://driftsys.github.io/schemas/project/v1.json`

Every project carries a `project.yaml` (or `.toml` / `.json`) that declares its
canonical name, version, domain, and optional metadata like category and
license. Tools read this manifest to identify the project, resolve dependencies,
and configure build pipelines. The schema is intentionally small and flat — no
nesting, no tool-specific fields.

## Discovery Protocol

1. Detect a `project.yaml`, `project.toml`, or `project.json` file.
2. Resolution order: YAML → TOML → JSON (first found wins).
3. Validate against `project/v1.json` before reading fields.
4. Parse required fields (`name`, `version`) first.
5. Parse optional fields second.
6. Treat the schema as closed (`additionalProperties: false`).

## Schema Index

| Schema path        | What it describes | Stable key |
| ------------------ | ----------------- | ---------- |
| [v1.json](v1.json) | Project manifest  | `name`     |

## Validation Contract

Validate early so downstream logic stays predictable.

1. Validation must happen before any business logic.
2. Missing required fields (`name`, `version`) means hard failure.
3. Unknown properties must be rejected (schema is closed).
4. If schema fetch fails, return a schema-unavailable error.

## Properties

| Path          | Type               | Required | Description                                              |
| ------------- | ------------------ | -------- | -------------------------------------------------------- |
| `name`        | string             | yes      | Reverse-domain project identifier (`^[a-z][a-z0-9.-]*$`) |
| `version`     | string             | yes      | Canonical version — single source of truth               |
| `category`    | string \| string[] |          | Project classification (see values below)                |
| `description` | string             |          | One-line summary                                         |
| `license`     | string             |          | SPDX license expression                                  |
| `keywords`    | string[]           |          | Discovery tags                                           |
| `authors`     | string[]           |          | Authors in `Name <email>` format                         |
| `homepage`    | string (uri)       |          | Project website or documentation portal URL              |
| `bugs`        | string (uri)       |          | Issue tracker URL                                        |
| `repository`  | string (uri)       |          | Source repository URL                                    |
| `upstream`    | string             |          | Upstream repo URL for forks (`#branch` suffix)           |
| `metadata`    | object             |          | Freeform key-value block for org-specific info           |
| `config`      | object             |          | Freeform key-value block for tooling config              |

### Category values

| Value           | Description                                                |
| --------------- | ---------------------------------------------------------- |
| `manifest`      | Integration root — assembles components, ships to customer |
| `specification` | Requirements, features, safety concepts                    |
| `application`   | Deployable end-user product                                |
| `service`       | Backend service or API                                     |
| `library`       | Reusable dependency                                        |
| `tool`          | Developer tool, CLI, build plugin (source code)            |
| `binary`        | Precompiled executables, firmware, vendor tools            |
| `distribution`  | Release artifacts, install packs                           |
| `configuration` | Graphic assets, system config, calibration data            |

## Failure Modes

- **unsupported-version** — schema version is not recognized. Stop processing.
- **schema-unavailable** — schema URL cannot be fetched. Return error.
- **validation-failed** — payload does not match schema. Reject payload.

## Version Policy

- Breaking changes create a new major version path (`v2.json`).
- Non-breaking additions stay in the current major version.
- Consumers should pin to a major version.

## Quick Example

Input: `project.yaml`\
Schema: `project/v1.json`

1. Validate payload against schema.
2. Parse `name` and `version` (required).
3. Parse optional fields (`category`, `description`, `license`, etc.).
4. Reject if unknown properties are present.
