# Police Simulation Game Project

## 🎯 Támogatott verziók

Ez a szakasz jelzi, hogy mely verziókhoz biztosítok jelenleg biztonsági frissítést.

| Verzió  | Támogatott?        |
| ------- | ------------------ |
| 5.1.x   | ✅                 |
| 5.0.x   | ❌                 |
| 4.0.x   | ✅                 |
| < 4.0   | ❌                 |

## 💾 Adatbázis mentés

A `sql_scripts/db_backup/receptek_utf8_dump.sql` fájl tartalmazza a teljes PostgreSQL dumpot.
Ez a fájl felhasználható az adatbázis helyreállítására például így:

```bash
psql -U postgres -d receptek_utf8 -f sql_scripts/db_backup/receptek_utf8_dump.sql

## 📦 Adatbázis mentés

A `sql_scripts/db_backup/receptek_utf8_dump.sql` fájl tartalmazza a teljes PostgreSQL dump-ot.
Használható helyreállításhoz:

```bash
psql -U postgres -d receptek_utf8 -f sql_scripts/db_backup/receptek_utf8_dump.sql


## Sebezhetőség jelentése

Ha úgy gondolod, hogy ez a Repositoty bármiért sebezhető, kérlekm értesíts engem erről a: cattybaby75 (at) gmail dot com címen. Köszönöm szépen!! 


## 🛡️ PostgreSQL Backup & Restore automatizálás

Ez a projekt automatikus PostgreSQL backup-restore rendszert használ GitHub Actions segítségével. Az éjféli mentések és a hibaértesítések célja a maximális üzembiztonság.

### 💡 Funkciók

- Éjféli automatikus backup (`pg_dump`) a GitHub Actions időzített (`schedule`) futtatásával
- Azonnali értesítés hibás restore (`pg_restore`) esetén a GitHub saját értesítési rendszerén keresztül
- Naplózás `pgbackup.log` fájlba
- Tesztelt és biztonságos: minden workflow zöld! ✅

### 🛠️ Workflow fájlok

- `.github/workflows/pgbackup.yaml` – A mentési és visszaállítási logika automatizálva

### 🚀 Használat

1. Beállított `pg_dump` és `pg_restore` parancsok a `scripts` könyvtárban
2. A workflow minden éjfél után automatikusan fut
3. Hibák esetén a GitHub natív értesítési rendszere jelez (pl. mobilon, emailen)
4. Nincs szükség manuális logfigyelésre – teljesen automatizált!

---

✍️ Az egész rendszert egyetlen fejlesztő, [BeatrixZs](https://github.com/BeatrixZs) építette saját tanulásához, de annyira jól sikerült, hogy már túlnőtt a “kis tanuló projekten”.

