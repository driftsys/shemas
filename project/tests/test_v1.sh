#!/usr/bin/env bash

ROOT="$(git rev-parse --show-toplevel)"

ajv() {
  npx -p ajv-cli -p ajv-formats ajv "$@"
}

setup() {
  cd "$ROOT" || return
}

test_schema_compiles() {
  ajv compile --spec=draft7 -c ajv-formats -s project/v1.json
}

test_valid_minimal() {
  ajv test --spec=draft7 -c ajv-formats -s project/v1.json -d project/tests/minimal.json --valid
}

test_valid_full() {
  ajv test --spec=draft7 -c ajv-formats -s project/v1.json -d project/tests/full.json --valid
}

test_invalid_name() {
  ajv test --spec=draft7 -c ajv-formats -s project/v1.json -d project/tests/invalid-name.json --invalid
}

test_invalid_missing_required() {
  ajv test --spec=draft7 -c ajv-formats -s project/v1.json -d project/tests/missing-required.json --invalid
}
