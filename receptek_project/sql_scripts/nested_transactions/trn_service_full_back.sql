BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- VACUUM - Táblák optimalizálása
SAVEPOINT vacuum_step;
VACUUM ANALYZE;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('VACUUM ANALYZE', 'FAIL', 'AutoVacuum hiba!');
    ROLLBACK TO SAVEPOINT vacuum_step;
    RAISE EXCEPTION 'AutoVacuum hiba!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('VACUUM ANALYZE', 'SUCCESS');
END IF;

-- REINDEX - Gyorsítja a lekérdezéseket
SAVEPOINT reindex_step;
REINDEX DATABASE receptek_utf8;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('REINDEX DATABASE', 'FAIL', 'Index frissítése sikertelen!');
    ROLLBACK TO SAVEPOINT reindex_step;
    RAISE EXCEPTION 'Index frissítése sikertelen!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('REINDEX DATABASE', 'SUCCESS');
END IF;

-- Táblák mentése a backup táblákba
SAVEPOINT backup_config;
INSERT INTO config_backup (original_id, param_name, param_value, version_number, last_updated, category, description, backup_version, backup_timestamp)
SELECT id, param_name, param_value, version_number, last_updated, category, description, 1, CURRENT_TIMESTAMP FROM config;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('Backup Config', 'FAIL', 'Config mentése sikertelen!');
    ROLLBACK TO SAVEPOINT backup_config;
    RAISE EXCEPTION 'Config mentése sikertelen!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('Backup Config', 'SUCCESS');
END IF;

SAVEPOINT backup_configaudit;
INSERT INTO configaudit_backup (original_id, config_id, param_name, old_value, new_value, modified_at, modified_by, backup_version, backup_timestamp)
SELECT id, config_id, param_name, old_value, new_value, modified_at, modified_by, 1, CURRENT_TIMESTAMP FROM configaudit;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('Backup ConfigAudit', 'FAIL', 'ConfigAudit mentése sikertelen!');
    ROLLBACK TO SAVEPOINT backup_configaudit;
    RAISE EXCEPTION 'ConfigAudit mentése sikertelen!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('Backup ConfigAudit', 'SUCCESS');
END IF;

SAVEPOINT backup_mértékek;
INSERT INTO mértékek_backup (original_id, mérés_leírás, version, backup_timestamp)
SELECT mérték_mennyiség_id, mérés_leírás, 1, CURRENT_TIMESTAMP FROM mértékek;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('Backup Mértékek', 'FAIL', 'Mértékek mentése sikertelen!');
    ROLLBACK TO SAVEPOINT backup_mértékek;
    RAISE EXCEPTION 'Mértékek mentése sikertelen!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('Backup Mértékek', 'SUCCESS');
END IF;

SAVEPOINT backup_receptek;
INSERT INTO receptek_backup (original_id, recept_név, elkészítés, jegyzet, recept_osztály_id, version, backup_timestamp)
SELECT receptid, recept_név, elkészítés, jegyzet, recept_osztály_id, 1, CURRENT_TIMESTAMP FROM receptek;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('Backup Receptek', 'FAIL', 'Receptek mentése sikertelen!');
    ROLLBACK TO SAVEPOINT backup_receptek;
    RAISE EXCEPTION 'Receptek mentése sikertelen!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('Backup Receptek', 'SUCCESS');
END IF;

SAVEPOINT backup_összetevők;
INSERT INTO összetevők_backup (original_id, összetevő_név, összetevő_osztály_id, mérték_mennyiség_id, version, backup_timestamp)
SELECT összetevő_id, összetevő_név, összetevő_osztály_id, mérték_mennyiség_id, 1, CURRENT_TIMESTAMP FROM összetevők;
IF NOT FOUND THEN
    INSERT INTO backup_log (operation, status, error_message) VALUES ('Backup Összetevők', 'FAIL', 'Összetevők mentése sikertelen!');
    ROLLBACK TO SAVEPOINT backup_összetevők;
    RAISE EXCEPTION 'Összetevők mentése sikertelen!';
ELSE
    INSERT INTO backup_log (operation, status) VALUES ('Backup Összetevők', 'SUCCESS');
END IF;

COMMIT;
INSERT INTO backup_log (operation, status) VALUES ('Full Backup Process', 'SUCCESS');
RAISE NOTICE 'Karbantartás sikeresen befejezve!';

