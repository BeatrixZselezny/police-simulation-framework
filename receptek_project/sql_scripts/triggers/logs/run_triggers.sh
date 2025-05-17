#!/bin/bash

TRIGGER_FILE="$HOME/w3school/objexamples/police/receptek_project/sql_scripts/triggers/logs/run_triggers.sql"
LOG_FILE="$HOME/w3school/objexamples/police/receptek_project/sql_scripts/triggers/logs/trigger_errors.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Ellenőrzés: létezik-e a fájl?
if [ -f "$TRIGGER_FILE" ]; then
    echo "[$TIMESTAMP] 🚀 Triggers fájl létezik, futtatom..." | tee -a "$LOG_FILE"
    psql -U postgres -d receptek_utf8 -f "$TRIGGER_FILE"
    echo "[$TIMESTAMP] ✅ Triggerek sikeresen lefutottak!" | tee -a "$LOG_FILE"
else
    echo "[$TIMESTAMP] ❌ HIBA: A trigger fájl nem található!" | tee -a "$LOG_FILE"
fi

