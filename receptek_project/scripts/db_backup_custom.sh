cat > receptek_project/scripts/db_backup_custom.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

DB="${1:-receptek_utf8}"
DIR="${2:-/home/debiana/db_backups}"

mkdir -p "$DIR"

out="$DIR/${DB}_$(date +%F).dump"
tmp="$(mktemp "$DIR/${DB}_$(date +%F).dump.tmp.XXXXXX")"

sudo -u postgres pg_dump -Fc -d "$DB" | tee "$tmp" >/dev/null
test -s "$tmp"
mv -f "$tmp" "$out"
chmod 600 "$out"

echo "[OK] Backup written: $out"
ls -lh "$out"
EOF

chmod 750 receptek_project/scripts/db_backup_custom.sh

