#!/bin/sh
set -eu

OPEN_REGISTRATION=$(jq -r '.open_registration' /data/options.json)
DB_URI=$(jq -r '.db_uri' /data/options.json)
HOST=$(jq -r '.host' /data/options.json)
PORT=$(jq -r '.port' /data/options.json)

export ATUIN_HOST="${HOST:-0.0.0.0}"
export ATUIN_PORT="${PORT:-8888}"
export ATUIN_OPEN_REGISTRATION="${OPEN_REGISTRATION:-false}"
export ATUIN_DB_URI="$DB_URI"
export RUST_LOG="info,atuin_server=debug"

echo "Using DB: $DB_URI"

exec atuin-server start