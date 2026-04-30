# Home Assistant Add-on: Atuin Server

Self-hosted Atuin sync server pinned to `ghcr.io/atuinsh/atuin:18.16.0` and configured to use an external PostgreSQL database.

## Install

Copy the `atuin/` directory into your Home Assistant add-ons directory, usually:

```bash
/addons/atuin
```

Then in Home Assistant:

1. Settings → Add-ons → Add-on Store
2. Three-dot menu → Repositories / Reload local add-ons
3. Install **Atuin Server**
4. Configure `db_uri`
5. Start the add-on

## Options

```yaml
db_uri: postgres://atuin:password@host:5432/atuin
open_registration: false
host: 0.0.0.0
port: 8888
rust_log: info,atuin_server=info
```

## PostgreSQL

You need a PostgreSQL database and user created beforehand, for example:

```sql
CREATE USER atuin WITH PASSWORD 'change-me';
CREATE DATABASE atuin OWNER atuin;
GRANT ALL PRIVILEGES ON DATABASE atuin TO atuin;
```

## Client example

On a client machine:

```bash
atuin register -u juan -e juan@example.com
atuin login -u juan
atuin sync
```

Set your client config:

```toml
sync_address = "https://your-domain.example.com"
auto_sync = true
```

If you expose it through Nginx Proxy Manager, Cloudflare Tunnel, or HA reverse proxy, keep TLS in front of it. Command history is encrypted client-side, but sending auth over plain HTTP is still clown engineering.
