WITH recept_osszetevo_szamok AS (
    SELECT
        receptid,
        COUNT(összetevő_id) AS osszetevok_szama
    FROM
        recept_összetevők
    GROUP BY
        receptid
)
    SELECT
        AVG(osszetevok_szama) AS atlagos_osszetevok
    FROM
        recept_osszetevo_szamok;
