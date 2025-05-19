CREATE OR REPLACE VIEW recept_osszetevok_napi_valtozas_view AS
SELECT *
FROM recept_osszetevok_audit
WHERE módosítás_ideje::date = CURRENT_DATE;

