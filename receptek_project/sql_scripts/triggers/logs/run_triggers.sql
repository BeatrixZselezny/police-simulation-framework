DO $$ 
BEGIN
    PERFORM log_config_changes(); 
    PERFORM cleanup_old_records(); 
    PERFORM check_config_values();
END $$;

