CREATE TRIGGER trg_recept_osszetevok_audit
AFTER INSERT OR UPDATE ON recept_összetevők
FOR EACH ROW
EXECUTE FUNCTION trg_audit_recept_osszetevok();

