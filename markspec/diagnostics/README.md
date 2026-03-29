# `markspec/diagnostics/v1.json`

Validation and compilation diagnostics payload.

**Schema URL:**
`https://driftsys.github.io/schemas/markspec/diagnostics/v1.json`

Build diagnostics (errors, warnings, informational messages) from the
compilation pipeline. Produced at `api/diagnostics/index.json`. Makes the site a
complete build report for CI and auditor consumption without needing the CLI.
Each diagnostic carries a code, severity, message, and optional source location.

## Quick guide

- Use `bySeverity` for quick status summaries.
- Iterate `diagnostics[]` for actionable details.
- Route to source using `location.file` and `location.line`.

## Properties

| Path                            | Type               | Required | Description                         |
| ------------------------------- | ------------------ | -------- | ----------------------------------- |
| `count`                         | integer            | yes      | Total number of diagnostics         |
| `bySeverity`                    | object             | yes      | Counts per severity level           |
| `bySeverity.error`              | integer            | yes      | Number of error-level diagnostics   |
| `bySeverity.warning`            | integer            | yes      | Number of warning-level diagnostics |
| `bySeverity.info`               | integer            | yes      | Number of informational diagnostics |
| `diagnostics[]`                 | object[]           | yes      | Individual diagnostic records       |
| `diagnostics[].severity`        | string             | yes      | `error`, `warning`, or `info`       |
| `diagnostics[].code`            | string             | yes      | Diagnostic code (e.g., `MSL-R003`)  |
| `diagnostics[].message`         | string             | yes      | Human-readable message              |
| `diagnostics[].location`        | object             | yes      | Source location                     |
| `diagnostics[].location.file`   | string             | yes      | Relative file path                  |
| `diagnostics[].location.line`   | integer            | yes      | Line number (1-based)               |
| `diagnostics[].location.column` | integer            |          | Column number (1-based)             |
| `diagnostics[].entry`           | string             |          | Related entry display ID            |
| `generated`                     | string (date-time) |          | Timestamp of diagnostics collection |

## Common pitfall

Do not assume `entry` is present for every diagnostic.
