#!/usr/bin/with-contenv bashio
# shellcheck shell=bash

set -e

DB_URI="$(bashio::config 'db_uri')"
OPEN_REGISTRATION="$(bashio::config 'open_registration')"
HOST="$(bashio::config 'host')"
PORT="$(bashio::config 'port')"

case "$DB_URI" in
  postgres://*|sqlite://*) ;;
  *)
    bashio::log.fatal "db_uri must start with postgres:// or sqlite://. Received: ${DB_URI}"
    exit 1
    ;;
esac

export ATUIN_HOST="$HOST"
export ATUIN_PORT="$PORT"
export ATUIN_OPEN_REGISTRATION="$OPEN_REGISTRATION"
export ATUIN_DB_URI="$DB_URI"
export RUST_LOG="info,atuin_server=debug"

bashio::log.info "Starting Atuin server on ${HOST}:${PORT}"
bashio::log.info "Using DB URI scheme: ${DB_URI%%://*}"

exec /usr/local/bin/atuin-server start