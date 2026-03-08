# AGENTS.md

This file provides guidance to AI coding agents when working with code in this
repository.

## What This Repo Is

A collection of JSON Schemas for the Driftsys project. Schemas are published to
GitHub Pages at `https://driftsys.github.io/schemas/` and referenced from
project files for editor autocompletion and validation.

There is no build system, no test suite, and no dependencies. The repo contains
only JSON Schema files and documentation.

## Repository Layout

Each schema lives in its own directory:

```text
<schema-name>/
├── README.md       ← field documentation, examples, design decisions
└── v<N>.json       ← JSON Schema (draft-07)
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
- `just check` — check formatting without writing
- `just lint` — run markdownlint and dprint check
- `just test` — validate schemas against their meta-schema (ajv-cli)
- `just publish` — copy all schema files (and only schema files) to `public/`

Always run `just test` and `just check` before pushing.

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

## Editing Schemas

When modifying a schema, keep the corresponding `README.md` in sync — it
documents every field, the ecosystem mapping table, and design decisions.
