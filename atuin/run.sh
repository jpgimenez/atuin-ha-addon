#!/bin/sh
set -eu

eval $(python3 - <<'EOF'
import json

with open("/data/options.json") as f:
    data = json.load(f)

print(f'OPEN_REGISTRATION="{data.get("open_registration", False)}"')
print(f'DB_URI="{data.get("db_uri", "")}"')
print(f'HOST="{data.get("host", "0.0.0.0")}"')
print(f'PORT="{data.get("port", 8888)}"')
EOF
)

export ATUIN_HOST="$HOST"
export ATUIN_PORT="$PORT"
export ATUIN_OPEN_REGISTRATION="$OPEN_REGISTRATION"
export ATUIN_DB_URI="$DB_URI"
export RUST_LOG="info,atuin_server=debug"

echo "Starting Atuin with DB: $DB_URI"

exec atuin-server start