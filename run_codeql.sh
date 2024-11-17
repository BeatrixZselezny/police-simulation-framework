#!/bin/bash
REPO_DIR=/home/debiana/w3school/objexamples/police
CODEQL_BIN=/home/debiana/w3school/objexamples/police/codeql/codeql/codeql

cd $REPO_DIR
git pull

# Ellenőrizzük a forrásfájlok létezését
echo "Ellenőrizzük a forrásfájlokat..."
find . -name "*.java" -type f -print

# Fordítsuk le a Java fájlokat (ha szükséges)
echo "Fordítás megkezdése..."
find . -name "*.java" -type f -print | xargs javac -d out

# Ellenőrizzük a fordítás eredményét
if [ "$(ls -A out)" ]; then
  echo "Fordítás sikeres, létrejön a CodeQL adatbázis."
  $CODEQL_BIN database create codeql-db --language=java --source-root=. --overwrite --logdir=codeql-logs

  # Véglegesítsük az adatbázist
  echo "Adatbázis véglegesítése..."
  $CODEQL_BIN database finalize codeql-db --logdir=codeql-logs

  # Futtassuk az elemzést, és generáljuk az output fájlt
  echo "Elemzés futtatása..."
  $CODEQL_BIN database analyze codeql-db --format=sarif-latest --output=codeql-results.sarif --logdir=codeql-logs

  echo "CodeQL elemzés sikeres."
else
  echo "Hiba: Nincsenek forrásfájlok az 'out' könyvtárban. Ellenőrizd a forrásfájlok fordítását."
fi

echo "Cron job futott: $(date)" >> /home/debiana/w3school/objexamples/police/cronjob.log

