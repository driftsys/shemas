# Project Manifest Schema

A minimal, flat project manifest. Describes what the project is and where it
lives — nothing more. Build tools, CI stages, linting rules, and formatting
preferences belong in their own config files.

Field names align with Cargo.toml and package.json conventions. Available as
`project.yaml`, `project.toml`, or `project.json` — when multiple are present,
resolution order is YAML → TOML → JSON (first found wins).

**Schema URL:** `https://driftsys.github.io/schemas/project/v1.json`

---

## Example

```yaml
$schema: https://driftsys.github.io/schemas/project/v1.json

name: com.company.dash
description: Cross-platform SDK for the Dash service
category: library
version: 1.4.2
license: Apache-2.0
keywords:
  - sdk
  - cross-platform
  - dash
authors:
  - Core Platform Team <core-platform@company.com>
homepage: https://company.gitlab.io/dash
bugs: https://jira.company.com/browse/DASH
repository: https://gitlab.company.com/platform/dash-source
upstream: https://github.com/nicegui/nicegui

metadata:
  department: platform-engineering
  cost-center: CC-4200

config:
  sonar:
    project-key: dash-platform
```

---

## Fields

### `name` (required)

Reverse-domain project identifier. Globally unique, used as the canonical name
across all ecosystems.

```yaml
name: com.company.dash
```

Must match `^[a-z][a-z0-9.-]*$`. Tooling derives ecosystem-specific names from
this value — for example, `@company/dash` for npm or `company-dash` for Cargo.

### `version` (required)

Canonical version. Single source of truth — all ecosystem version files
(`Cargo.toml`, `package.json`, `build.gradle.kts`, UPM `package.json`) are
derived from this value.

```yaml
version: 1.4.2
```

### `category` (required)

Project classification. Accepts a single value or a list.

```yaml
# single category
category: library

# multiple categories
category:
  - library
  - binary
```

Values:

| Category        | Description                                                |
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

### `description`

One-line summary of the project.

```yaml
description: Cross-platform SDK for the Dash service
```

Maps to `description` in Cargo.toml and package.json.

### `license`

SPDX license expression. Supports dual licensing via SPDX syntax.

```yaml
license: Apache-2.0
license: MIT OR Apache-2.0
```

Maps to `license` in Cargo.toml and package.json.

### `keywords`

Discovery tags.

```yaml
keywords:
  - sdk
  - cross-platform
  - dash
```

Maps to `keywords` in Cargo.toml and package.json.

### `authors`

Project authors in `Name <email>` format.

```yaml
authors:
  - Core Platform Team <core-platform@company.com>
  - Alice <alice@company.com>
```

Maps to `authors` in Cargo.toml and `author`/`contributors` in package.json.

### `homepage`

Project website or documentation portal URL.

```yaml
homepage: https://company.gitlab.io/dash
```

Maps to `homepage` in Cargo.toml and package.json.

### `bugs`

Issue tracker URL.

```yaml
bugs: https://jira.company.com/browse/DASH
```

Maps to `bugs` in package.json.

### `repository`

Source repository URL.

```yaml
repository: https://gitlab.company.com/platform/dash-source
```

Maps to `repository` in Cargo.toml and package.json.

### `upstream`

Upstream repository for forks. Default tracked branch is `main`. Append
`#branch` to track a different branch.

```yaml
# tracks main (default)
upstream: https://github.com/nicegui/nicegui

# tracks a specific branch
upstream: https://github.com/nicegui/nicegui#develop
```

### `metadata`

Freeform key-value block for org-specific information. The standard never reads
or validates contents. Convention matches Cargo.toml `[package.metadata]`.

```yaml
metadata:
  department: platform-engineering
  cost-center: CC-4200
```

Orgs can namespace their domain under a key:

```yaml
metadata:
  ftpm:
    kind: component
    safety-level: QM
    parent: com.company.dash-product
```

### `config`

Freeform key-value block for tooling configuration. Tools namespace themselves
as keys to avoid collisions. Convention matches npm `config`.

```yaml
config:
  sonar:
    project-key: dash-platform
  renovate:
    schedule: weekly
```

---

## Ecosystem Mapping

Tooling can derive ecosystem-specific fields from the manifest.

| project.yaml  | Cargo.toml           | package.json                    |
| ------------- | -------------------- | ------------------------------- |
| `name`        | `name` (derived)     | `name` (derived: `@scope/name`) |
| `description` | `description`        | `description`                   |
| `version`     | `version`            | `version`                       |
| `license`     | `license`            | `license`                       |
| `keywords`    | `keywords`           | `keywords`                      |
| `authors`     | `authors`            | `author` + `contributors`       |
| `homepage`    | `homepage`           | `homepage`                      |
| `bugs`        | —                    | `bugs`                          |
| `repository`  | `repository`         | `repository`                    |
| `metadata`    | `[package.metadata]` | (custom top-level keys)         |
| `config`      | —                    | `config`                        |

---

## Design Decisions

| Decision                      | Rationale                                                                                                                                                         |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Flat structure                | Every field visible in one glance. No nesting for a 12-field file.                                                                                                |
| Ecosystem-aligned names       | `name`, `version`, `description`, `license`, `keywords`, `authors`, `homepage`, `bugs`, `repository` all match Cargo.toml and/or package.json. No new vocabulary. |
| No quality/CI/tools sections  | Formatting, linting, CI stages, and tool versions have dedicated config files in every ecosystem. Duplicating them creates drift.                                 |
| No lifecycle field            | Semver communicates lifecycle: `0.x` is incubation, `1.0+` is stable, deprecation is a final release plus notice.                                                 |
| Reverse-domain `name`         | Follows UPM, Android `applicationId`, and Java/Gradle group conventions. Globally unique without a central registry.                                              |
| `metadata` matches Cargo      | `[package.metadata]` is the established pattern for freeform, standard-invisible extension data.                                                                  |
| `config` matches npm          | `config` in package.json is the established pattern for tooling configuration.                                                                                    |
| `upstream` with `#branch`     | Follows the `url#ref` pattern from npm and git. Default is `main` when omitted.                                                                                   |
| Three formats                 | YAML for readability (default), TOML for Rust familiarity, JSON for Node/TS familiarity. Same schema, developer's choice.                                         |
| Schema URL outside the schema | `$schema` (YAML/JSON) and `#:schema` (TOML) are editor hints, not project data. Never required.                                                                   |
