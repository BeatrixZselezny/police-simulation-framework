CREATE OR REPLACE FUNCTION recept_osszetevok_audit_fn()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        INSERT INTO recept_osszetevok_audit (receptid, osszetevo_id, módosítás_típusa, régi_érték, új_érték)
        VALUES (
            OLD.receptid,
            OLD.osszetevo_id,
            'UPDATE',
            to_jsonb(OLD),
            to_jsonb(NEW)
        );
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO recept_osszetevok_audit (receptid, osszetevo_id, módosítás_típusa, új_érték)
        VALUES (
            NEW.receptid,
            NEW.osszetevo_id,
            'INSERT',
            to_jsonb(NEW)
        );
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO recept_osszetevok_audit (receptid, osszetevo_id, módosítás_típusa, régi_érték)
        VALUES (
            OLD.receptid,
            OLD.osszetevo_id,
            'DELETE',
            to_jsonb(OLD)
        );
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_recept_osszetevok_audit ON recept_osszetevok;

CREATE TRIGGER trg_recept_osszetevok_audit
AFTER INSERT OR UPDATE OR DELETE ON recept_osszetevok
FOR EACH ROW EXECUTE FUNCTION recept_osszetevok_audit_fn();


