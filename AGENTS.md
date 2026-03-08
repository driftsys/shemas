# AGENTS.md

This file provides guidance to AI coding agents when working with code in this
repository.

## What This Repo Is

A collection of JSON Schemas for the Driftsys project. Schemas are published to
GitHub Pages at `https://driftsys.github.io/schemas/` and referenced from
project files for editor autocompletion and validation.

There is no build system and no runtime dependencies. Schemas are validated with
bash_unit tests that use ajv-cli.

## Repository Layout

Each schema lives in its own directory:

```text
<schema-name>/
├── README.md       ← field documentation, examples, design decisions
├── v<N>.json       ← JSON Schema (draft-07)
└── tests/
    ├── test_v<N>.sh    ← bash_unit tests
    ├── minimal.json    ← valid/invalid JSON fixtures
    └── ...
```

Currently the only schema is `project/v1.json` — a minimal, flat project
manifest.

## Schema Conventions

- Schemas use **JSON Schema draft-07**
  (`http://json-schema.org/draft-07/schema#`).
- `$id` must match the GitHub Pages URL:
  `https://driftsys.github.io/schemas/<name>/v<N>.json`.
- Versioning is `v1`, `v2`, etc. Breaking changes (new required fields, removed
  fields, changed constraints) require a new major version. Non-breaking
  additions (new optional fields) are added in place.
- Field names align with Cargo.toml and package.json conventions — no new
  vocabulary.
- `additionalProperties: false` is used on the root object to keep manifests
  strict.
- `$schema` / `#:schema` are editor hints, not project data.

## Commands

All commands use [just](https://github.com/casey/just):

- `just fmt` — format all files with dprint
- `just check` — run all checks (test + lint)
- `just test` — run bash_unit tests (schema compilation + valid/invalid fixtures
  via ajv-cli)
- `just lint` — run markdownlint and dprint check
- `just build` — copy all schema files (and only schema files) to `public/`

Always run `just check` before pushing.

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/) format:
`feat:`, `fix:`, `docs:`, `chore:`, etc.

## Formatting

- Formatted with **dprint** (`dprint fmt`). Config in `dprint.json`.
- Markdown: wrap prose at 80 columns, use `-` for unordered lists (not `*`).
- Indent with 2 spaces everywhere.

## Publishing

`scripts/publish` copies all `v*.json` schema files to `public/`, preserving
directory structure. Only schema files end up in `public/` — no docs, config, or
tooling files. The `public/` directory is gitignored. CI runs this script before
deploying to GitHub Pages.

## Testing

Each schema directory has a `tests/` folder with:

- JSON fixtures (`*.json`) — valid and invalid examples
- A bash_unit test file (`test_v<N>.sh`) that runs ajv-cli against those
  fixtures

When adding or modifying a schema, add or update the corresponding test fixtures
and bash_unit tests.

## Editing Schemas

When modifying a schema, keep the corresponding `README.md` in sync — it
documents every field, the ecosystem mapping table, and design decisions.
