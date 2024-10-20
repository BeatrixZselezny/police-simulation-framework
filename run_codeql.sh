#!/bin/bash
REPO_DIR=/home/debiana/w3school/objexamples/police
CODEQL_BIN=/home/debiana/w3school/objexamples/police/codeql/codeql

cd $REPO_DIR
git pull

# Fordítsuk le a Java fájlokat
find src_codeql -name "*.java" -type f -print | xargs javac -d out

# Hozzuk létre a CodeQL adatbázist a már lefordított fájlokkal
$CODEQL_BIN database create codeql-db --language=java --source-root=out --overwrite

# Véglegesítsük az adatbázist
$CODEQL_BIN database finalize codeql-db

# Futtassuk az elemzést, és generáljuk az output fájlt
$CODEQL_BIN database analyze codeql-db --format=sarif-latest --output=codeql-results.sarif

echo "Cron job futott: $(date)" >> /home/debiana/w3school/objexamples/police/cronjob.log

