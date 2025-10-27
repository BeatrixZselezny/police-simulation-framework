#!/bin/bash
# bea-java-maven-check.sh
echo "===== Java (Temurin) check ====="
if [ -z "$JAVA_HOME" ]; then
    echo "❌ JAVA_HOME nincs beállítva!"
else
    echo "JAVA_HOME = $JAVA_HOME"
    java -version
fi

echo
echo "===== Maven check ====="
if ! command -v mvn &>/dev/null; then
    echo "❌ Maven nincs telepítve!"
else
    mvn -v
fi

echo
echo "✅ Ha mindkettő verzió rendben van, minden oké!"

