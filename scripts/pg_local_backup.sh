#!/bin/bash

# Script célja: PostgreSQL adatbázis mentése .dump formátumban
# Használat előtt: .env fájl legyen elérhető a projekt rootban

# A projekt gyökérkönyvtára
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# .env betöltése
if [ -f "$PROJECT_ROOT/.env" ]; then
  export $(grep -v '^#' "$PROJECT_ROOT/.env" | xargs)
else
  echo "❌ Hiba: Nem található .env fájl a projekt rootban: $PROJECT_ROOT"
  exit 1
fi

# Backup könyvtár létrehozása, ha nem létezik
mkdir -p "$PROJECT_ROOT/backup"

# Dátum hozzáfűzése a fájlnévhez
BACKUP_FILE="$PROJECT_ROOT/backup/receptek_utf8_$(date +%Y-%m-%d).dump"

# pg_dump futtatása
pg_dump -U "$PGUSER" -h "$PGHOST" -p "$PGPORT" -d "$PGDATABASE" -Fc -f "$BACKUP_FILE"

# Mentés végeredmény
if [ $? -eq 0 ]; then
  echo "✅ Sikeres mentés: $BACKUP_FILE"
else
  echo "❌ Mentés sikertelen."
  exit 2
fi

