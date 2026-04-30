#!/bin/sh
set -eu

# parser berreta pero suficiente
get_option() {
  grep "\"$1\"" /data/options.json | sed -E 's/.*: *"?([^",}]*)"?.*/\1/'
}

OPEN_REGISTRATION="$(get_option open_registration)"
DB_URI="$(get_option db_uri)"
HOST="$(get_option host)"
PORT="$(get_option port)"

export ATUIN_HOST="${HOST:-0.0.0.0}"
export ATUIN_PORT="${PORT:-8888}"
export ATUIN_OPEN_REGISTRATION="${OPEN_REGISTRATION:-false}"
export ATUIN_DB_URI="$DB_URI"
export RUST_LOG="info,atuin_server=debug"

exec atuin server start