-- Weekly backup SQL script (RAW SQL, NO PL/pgSQL)

-- TRANZAKCIÓ INDÍTÁSA
BEGIN;

-- Napló: Backup indítása
INSERT INTO backup_log (operation, status, initiated_by)
VALUES ('Weekly Backup', 'Started', 'System');

-- MENTÉS: ÖSSZETEVŐK
SAVEPOINT sp_osszetevok;
INSERT INTO osszetevok_backup SELECT * FROM osszetevok;

-- MENTÉS: RECEPTEK
SAVEPOINT sp_receptek;
INSERT INTO receptek_backup SELECT * FROM receptek;

-- MENTÉS: ÖSSZETEVŐK_OSZTÁLY
SAVEPOINT sp_osztaly;
INSERT INTO osszetevok_osztaly_backup SELECT * FROM osszetevok_osztaly;

-- MENTÉS: RECEPT_ÖSSZETEVŐK
SAVEPOINT sp_ro;
INSERT INTO recept_osszetevok_backup SELECT * FROM recept_osszetevok;

-- NAPLÓ: Sikeres backup bejegyzése
INSERT INTO backup_log (operation, status, initiated_by)
VALUES ('Weekly Backup', 'Completed', 'System');

-- TRANZAKCIÓ VÉGE
COMMIT;

