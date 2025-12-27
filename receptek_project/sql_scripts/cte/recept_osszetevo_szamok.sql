WITH recept_osszetevo_szamok AS (
    SELECT
        receptid,
        COUNT(osszetevo_id) AS osszetevok_szama
    FROM
        recept_osszetevok
    GROUP BY
        receptid
)
SELECT
    r.recept_név,
    c.osszetevok_szama
FROM
    receptek AS r
JOIN
    recept_osszetevo_szamok AS c ON r.receptid = c.receptid
ORDER BY
    c.osszetevok_szama DESC
LIMIT 5;
