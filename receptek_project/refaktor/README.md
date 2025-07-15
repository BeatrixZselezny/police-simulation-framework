# Refaktorálási dokumentáció 🐘

Ez a könyvtár tartalmazza azokat a SQL fájlokat és auditokat, amelyek Ele projektjének adatbázisát refaktorálják, tisztítják és strukturálják.

## 🎯 Célok

- Az adatmodell normalizálása NF3 szabályai szerint
- Azonosítókezelés korszerűsítése (`SERIAL` → `IDENTITY`)
- Kapcsolatok viselkedésének újragondolása (`CASCADE` → `RESTRICT`)
- Árva rekordok kiszűrése, séma-térkép generálása
- Auditálható és verziókövethető SQL műveletek rögzítése

## 📂 Fájltípusok

- `01_map_model_structure.sql` – Táblák, oszlopok és kapcsolatok lekérdezése
- `02_constraints_audit.sql` – Idegen kulcsok és ON DELETE szabályok vizsgálata
- `03_sequences_audit.sql` – Sequence-ek állapotának felmérése
- `04_recipeid_migration.sql` – SERIAL → IDENTITY migráció a `recipeid` mezőre
- `05_cleanup_orphans.sql` – Árva sorok tisztítása, relációkon kívüli rekordok törlése

## 🐘 Ele hangulatjegyzete

> „A refaktor nem pusztán újraírás. Ez a gondolatok tisztítása, a kapcsolatok újraszövése, és az adat méltó helyre emelése.”

---
