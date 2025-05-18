DROP TRIGGER IF EXISTS trg_config_audit_insert ON config;

CREATE TRIGGER trg_config_audit_insert
AFTER INSERT ON config
FOR EACH ROW
EXECUTE FUNCTION log_config_inserts_trigger();

