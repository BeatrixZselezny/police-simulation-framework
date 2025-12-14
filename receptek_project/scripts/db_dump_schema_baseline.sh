cat > receptek_project/scripts/db_dump_schema_baseline.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

DB="${1:-receptek_utf8}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/sql_scripts/_baseline/000_schema.sql"

mkdir -p "$(dirname "$OUT")"

tmp="$(mktemp "$(dirname "$OUT")/000_schema.sql.tmp.XXXXXX")"

# postgres futtatja a pg_dump-ot, de a fájlt te írod ki (tee) -> nincs permission cirkusz
sudo -u postgres pg_dump --schema-only --no-owner --no-privileges \
  --restrict-key=RECEPTEKBASELINE \
  -d "$DB" | tee "$tmp" >/dev/null

test -s "$tmp"  # ne legyen 0 byte modern művészet
mv -f "$tmp" "$OUT"
chmod 664 "$OUT"

echo "[OK] Baseline written: $OUT"
ls -lh "$OUT"
EOF

chmod 750 receptek_project/scripts/db_dump_schema_baseline.sh

