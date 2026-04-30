#!/bin/sh
set -eu

OPEN_REGISTRATION="$(jq -r '.open_registration' /data/options.json)"
DB_URI="$(jq -r '.db_uri' /data/options.json)"
HOST="$(jq -r '.host' /data/options.json)"
PORT="$(jq -r '.port' /data/options.json)"

export ATUIN_HOST="$HOST"
export ATUIN_PORT="$PORT"
export ATUIN_OPEN_REGISTRATION="$OPEN_REGISTRATION"
export ATUIN_DB_URI="$DB_URI"
export RUST_LOG="info,atuin_server=debug"

exec atuin server start
