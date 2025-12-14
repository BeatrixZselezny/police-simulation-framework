#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CSV_FILE="${CSV_FILE:-$SCRIPT_DIR/data.csv}"

DB_NAME="${DB_NAME:-receptek_utf8_restore_test}"
LOG_FILE="${LOG_FILE:-$SCRIPT_DIR/skipped_ids.log}"
: > "$LOG_FILE"

if [[ "$(id -un)" == "postgres" ]]; then
  PSQL=(psql -X -q -v ON_ERROR_STOP=1 -d "$DB_NAME")
else
  PSQL=(sudo -u postgres psql -X -q -v ON_ERROR_STOP=1 -d "$DB_NAME")
fi

clean_field() {
  local s="$1"
  s="${s//$'\r'/}"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf '%s' "$s"
}

is_int() { [[ "$1" =~ ^[0-9]+$ ]]; }
is_num() { [[ "$1" =~ ^[0-9]+([.][0-9]+)?$ ]]; }

# CSV: receptid,recept_sorszam,osszetevo_id,mennyiseg,mertek_mennyiseg_id,osszetevo_osztaly_id,recept_osztaly_id
while IFS=, read -r receptid recept_sorszam osszetevo_id mennyiseg mertek_mennyiseg_id osszetevo_osztaly_id recept_osztaly_id; do
  receptid="$(clean_field "${receptid:-}")"
  recept_sorszam="$(clean_field "${recept_sorszam:-}")"
  osszetevo_id="$(clean_field "${osszetevo_id:-}")"
  mennyiseg="$(clean_field "${mennyiseg:-}")"
  mertek_mennyiseg_id="$(clean_field "${mertek_mennyiseg_id:-}")"
  osszetevo_osztaly_id="$(clean_field "${osszetevo_osztaly_id:-}")"
  recept_osztaly_id="$(clean_field "${recept_osztaly_id:-}")"

  [[ -z "${receptid// }" ]] && continue
  [[ "${receptid,,}" == "receptid" ]] && continue

  if ! is_int "$receptid" || ! is_int "$recept_sorszam"; then
    echo "SKIP rossz PK: $receptid/$recept_sorszam" | tee -a "$LOG_FILE"
    continue
  fi

  mennyiseg="${mennyiseg/,/.}"

  SQL="
    INSERT INTO recept_osszetevok
      (receptid, recept_sorszam, osszetevo_id, mennyiseg,
       mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id)
    VALUES
      ($receptid,
       $recept_sorszam,
       ${osszetevo_id:-NULL},
       ${mennyiseg:-NULL},
       ${mertek_mennyiseg_id:-NULL},
       ${osszetevo_osztaly_id:-NULL},
       ${recept_osztaly_id:-NULL})
    ON CONFLICT (receptid, recept_sorszam) DO NOTHING
    RETURNING 1;
  "

  if ! inserted="$("${PSQL[@]}" -At -c "$SQL" 2>/dev/null)"; then
    echo "SKIP (FK hiba vagy adat hiba): $receptid/$recept_sorszam" | tee -a "$LOG_FILE"
    continue
  fi

  if [[ -z "$inserted" ]]; then
    echo "SKIP (PK ütközés): $receptid/$recept_sorszam" | tee -a "$LOG_FILE"
  else
    echo "OK: receptid=$receptid sorszám=$recept_sorszam"
  fi
done < "$CSV_FILE"

echo "Kész. Kimaradások: $LOG_FILE"
