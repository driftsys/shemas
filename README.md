# driftsys/schemas

JSON Schemas for Driftsys projects. Each schema is published to GitHub Pages and
can be referenced directly from project files for editor autocompletion and
validation.

## Schemas

| Schema              | URL                                                  | Describes                                                         |
| ------------------- | ---------------------------------------------------- | ----------------------------------------------------------------- |
| [project](project/) | `https://driftsys.github.io/schemas/project/v1.json` | Project manifest (`project.yaml`, `project.toml`, `project.json`) |

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

## Versioning

Schemas are versioned as `v1`, `v2`, etc. A new major version is published when
breaking changes are introduced (required fields added, fields removed, value
constraints changed). Non-breaking additions (new optional fields) are added in
place.

## Adding a Schema

Each schema lives in its own directory with a `README.md` explaining the fields
and a `v<N>.json` file containing the JSON Schema.

```
<schema-name>/
├── README.md       ← field documentation, examples, design decisions
└── v1.json         ← JSON Schema
```
