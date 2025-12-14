-- recept_osszetevok_napi_valtozas_view.sql

CREATE OR REPLACE VIEW recept_osszetevok_napi_valtozas AS
SELECT
    r.*
FROM
    recept_osszetevok r
JOIN
    recept_osszetevok_audit a ON r.id = a.mod_id
WHERE
    a.mod_datum::date = CURRENT_DATE;

