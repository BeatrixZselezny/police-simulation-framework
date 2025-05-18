-- 1. Triggerfüggvény létrehozása
CREATE OR REPLACE FUNCTION log_config_changes_trigger()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.param_value IS DISTINCT FROM NEW.param_value THEN
        INSERT INTO configaudit (
            config_id,
            param_name,
            old_value,
            new_value,
            modified_by,
            modified_at
        ) VALUES (
            OLD.id,
            OLD.param_name,
            OLD.param_value,
            NEW.param_value,
            CURRENT_USER,
            NOW()
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Régi trigger törlése ha lenne
DROP TRIGGER IF EXISTS trg_config_audit ON config;

-- 3. Új trigger létrehozása
CREATE TRIGGER trg_config_audit
AFTER UPDATE ON config
FOR EACH ROW
EXECUTE FUNCTION log_config_changes_trigger();

