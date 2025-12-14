cat > receptek_project/scripts/db_restore_custom.sh <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

DB="${1:?Usage: db_restore_custom.sh <db> <dumpfile> [--clean]}"
DUMP="${2:?Usage: db_restore_custom.sh <db> <dumpfile> [--clean]}"
MODE="${3:-}"

if [ ! -r "$DUMP" ]; then
  echo "[ERROR] Dump not readable: $DUMP" >&2
  exit 1
fi

if [ "$MODE" = "--clean" ]; then
  echo "[WARN] CLEAN restore into $DB (destructive)"
  sudo -u postgres pg_restore --clean --if-exists --dbname="$DB" < "$DUMP"
else
  echo "[INFO] Restore into $DB (non-clean)"
  sudo -u postgres pg_restore --dbname="$DB" < "$DUMP"
fi

echo "[OK] Restore completed: DB=$DB"
EOF

chmod 750 receptek_project/scripts/db_restore_custom.sh

