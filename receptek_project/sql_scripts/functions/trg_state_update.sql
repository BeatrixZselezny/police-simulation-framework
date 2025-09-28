CREATE OR REPLACE FUNCTION trg_state_update()
RETURNS TRIGGER AS $$
BEGIN
    NEW.state_update = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER triggerstate_update
BEFORE UPDATE ON receptek
FOR EACH ROW
    EXECUTE FUNCTION trg_state_update();
