CREATE OR REPLACE FUNCTION log_config_changes()
RETURNS TRIGGER AS $$
BEGIN
    -- Csak akkor mentjük az adatokat, ha tényleges változás történt
    IF OLD.param_value <> NEW.param_value THEN
        BEGIN
            INSERT INTO ConfigAudit (config_id, param_name, old_value, new_value, modified_by, modified_at)
            VALUES (
                OLD.id, 
                OLD.param_name, 
                COALESCE(OLD.param_value, 'NULL'), 
                COALESCE(NEW.param_value, 'NULL'), 
                CURRENT_USER, 
                NOW()
            );
        EXCEPTION WHEN OTHERS THEN
            INSERT INTO ErrorLog (error_message, error_time)
            VALUES ('Hiba történt a log_config_changes triggerben', NOW());
        END;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

