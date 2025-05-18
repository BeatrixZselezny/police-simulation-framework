CREATE OR REPLACE FUNCTION log_config_inserts_trigger()
RETURNS TRIGGER AS $$
BEGIN
    BEGIN
        INSERT INTO configaudit (config_id, param_name, old_value, new_value, modified_by, modified_at)
        VALUES (
            NEW.id,
            NEW.param_name,
            'NULL',               -- Mivel insertnél nincs előző érték
            COALESCE(NEW.param_value, 'NULL'),
            CURRENT_USER,
            NOW()
        );
    EXCEPTION WHEN OTHERS THEN
        INSERT INTO errorlog (error_message, error_time)
        VALUES ('Hiba történt az INSERT triggerben', NOW());
    END;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

