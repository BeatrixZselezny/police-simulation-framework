
CREATE OR REPLACE FUNCTION trg_audit_recept_osszetevok()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO recept_összetevők_audit (muvelet_tipus, mod_id, modositott_adat)
    VALUES (
        TG_OP,                        -- 'INSERT' vagy 'UPDATE'
        NEW.id,
        to_jsonb(NEW)
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

