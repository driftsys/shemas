# DriftSys Schema Contracts

[![CI](https://github.com/driftsys/schemas/actions/workflows/ci.yaml/badge.svg)](https://github.com/driftsys/schemas/actions/workflows/ci.yaml)
[![Pages](https://img.shields.io/badge/Pages-driftsys.github.io%2Fschemas-0072b2)](https://driftsys.github.io/schemas/)

Validation schemas and agent contracts for DriftSys projects. Each schema is
published to GitHub Pages and available as HTML for humans and raw markdown for
agents.

## Discovery Protocol

1. Identify the schema domain (project or markspec).
2. Navigate to the domain contract page.
3. Use the schema index to find the matching `v1.json`.
4. Validate payload against the schema before processing.
5. Parse required fields first, optional fields second.

## Contracts

| Contract               | Description                              |
| ---------------------- | ---------------------------------------- |
| [project/](project/)   | Minimal flat project manifest            |
| [markspec/](markspec/) | MarkSpec site API artifacts (12 schemas) |

## Schema Index

| Contract                                                               | JSON Schema                                | Description                                |
| ---------------------------------------------------------------------- | ------------------------------------------ | ------------------------------------------ |
| [project](project/README.md)                                           | [v1](project/v1.json)                      | Project manifest                           |
| [markspec/lock](markspec/lock/README.md)                               | [v1](markspec/lock/v1.json)                | Frozen sidecar metadata (`.markspec.lock`) |
| [markspec/link-target](markspec/link-target/README.md)                 | [v1](markspec/link-target/v1.json)         | Shared resolved-link target object         |
| [markspec/entry](markspec/entry/README.md)                             | [v1](markspec/entry/v1.json)               | Typed entry detail payload                 |
| [markspec/component](markspec/component/README.md)                     | [v1](markspec/component/v1.json)           | BOM component detail payload               |
| [markspec/reference](markspec/reference/README.md)                     | [v1](markspec/reference/v1.json)           | Reference entry payload                    |
| [markspec/index](markspec/index/README.md)                             | [v1](markspec/index/v1.json)               | Entry listing payload                      |
| [markspec/bom](markspec/bom/README.md)                                 | [v1](markspec/bom/v1.json)                 | BOM index (component summaries)            |
| [markspec/search](markspec/search/README.md)                           | [v1](markspec/search/v1.json)              | Search records for client indexing         |
| [markspec/traceability-matrix](markspec/traceability-matrix/README.md) | [v1](markspec/traceability-matrix/v1.json) | Full traceability matrix rows              |
| [markspec/traceability-graph](markspec/traceability-graph/README.md)   | [v1](markspec/traceability-graph/v1.json)  | Graph nodes and edges                      |
| [markspec/coverage](markspec/coverage/README.md)                       | [v1](markspec/coverage/v1.json)            | Coverage summary and gaps                  |
| [markspec/diagnostics](markspec/diagnostics/README.md)                 | [v1](markspec/diagnostics/v1.json)         | Validation and build diagnostics           |

## Usage

Reference a schema from your project file to get autocompletion and validation
in your editor.

### YAML

Uses the `$schema` key — supported by the Red Hat YAML extension (VS Code) and
IntelliJ.

```yaml
# project.yaml
$schema: https://driftsys.github.io/schemas/project/v1.json

name: com.company.dash
description: Cross-platform SDK for the Dash service
category: library
version: 1.4.2
```

### TOML

Uses the `#:schema` comment directive — supported by taplo and the Even Better
TOML extension (VS Code).

<!-- dprint-ignore -->

```toml
# project.toml
#:schema https://driftsys.github.io/schemas/project/v1.json

name = "com.company.dash"
description = "Cross-platform SDK for the Dash service"
category = "library"
version = "1.4.2"
```

### JSON

Uses the `$schema` property — supported natively by VS Code and IntelliJ.

```json
{
  "$schema": "https://driftsys.github.io/schemas/project/v1.json",
  "name": "com.company.dash",
  "description": "Cross-platform SDK for the Dash service",
  "category": "library",
  "version": "1.4.2"
}
```

## Failure Modes

- **unsupported-version** — schema version is not recognized. Stop processing.
- **schema-unavailable** — schema URL cannot be fetched. Return error.
- **validation-failed** — payload does not match schema. Reject payload.
- **unknown-payload-kind** — payload kind cannot be determined. Return error.

## Version Policy

- Breaking changes create a new major version path (`v2.json`).
- Non-breaking additions stay in the current major version.
- Consumers should pin to a major version.

<!-- git-std:bootstrap -->

## Post-clone setup

Run `./bootstrap` after `git clone` or `git worktree add`.
