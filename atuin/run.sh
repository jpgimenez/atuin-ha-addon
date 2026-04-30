#!/bin/sh
set -eu

OPTIONS=/data/options.json

export ATUIN_DB_URI="$(jq -r '.db_uri' "$OPTIONS")"
export ATUIN_OPEN_REGISTRATION="$(jq -r '.open_registration' "$OPTIONS")"
export ATUIN_HOST="$(jq -r '.host' "$OPTIONS")"
export ATUIN_PORT="$(jq -r '.port' "$OPTIONS")"
export RUST_LOG="$(jq -r '.rust_log' "$OPTIONS")"

if [ -z "$ATUIN_DB_URI" ] || [ "$ATUIN_DB_URI" = "null" ]; then
  echo "ERROR: db_uri is required"
  exit 1
fi

if echo "$ATUIN_DB_URI" | grep -q 'CHANGE_ME'; then
  echo "ERROR: replace CHANGE_ME in db_uri before starting the add-on"
  exit 1
fi

echo "Starting Atuin server on ${ATUIN_HOST}:${ATUIN_PORT}"
echo "Open registration: ${ATUIN_OPEN_REGISTRATION}"

exec atuin server start
