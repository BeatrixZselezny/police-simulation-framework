#!/bin/bash
local_pom="./src/main/java/pom.xml"
remote_pom="./pom.xml"

# Verziók összehasonlítása
diff $local_pom $remote_pom

# Ha vannak eltérések, szinkronizálás (például a lokális fájl alapján)
if [ $? -ne 0 ]; then
  cp $local_pom $remote_pom
  echo "Verziók szinkronizálva."
else
  echo "A verziók megegyeznek."
fi

