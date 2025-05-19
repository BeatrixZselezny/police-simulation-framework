-- recept_osszetevok_napi_valtozas_view.sql

CREATE OR REPLACE VIEW recept_összetevők_napi_valtozas AS
SELECT
    r.*
FROM
    recept_összetevők r
JOIN
    recept_összetevők_audit a ON r.id = a.mod_id
WHERE
    a.mod_datum::date = CURRENT_DATE;

