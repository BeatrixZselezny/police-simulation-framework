CREATE OR REPLACE PROCEDURE MassUploadReceptek()
LANGUAGE plpgsql
AS $$ 
DECLARE csv_path TEXT; 
BEGIN
    -- Beállítjuk az izolációs szintet
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Fájl elérési útjának lekérése
    SELECT param_value INTO csv_path FROM config WHERE param_name = 'csv_path';

    -- TEMP tábla létrehozása
    DROP TABLE IF EXISTS temp_recept_osszetevok;
    CREATE TEMP TABLE temp_recept_osszetevok (
       receptid INT,
       recept_sorszam INT,
       osszetevo_id INT,
       mennyiség INT,
       mertek_mennyiseg_id INT,
       osszetevo_osztaly_id INT,
       recept_osztaly_id INT
    ) ON COMMIT DROP;

    -- COPY utasítás végrehajtása dinamikusan
    EXECUTE format('COPY temp_recept_osszetevok FROM %L WITH CSV HEADER', csv_path);

    -- Adatellenőrzés
    IF EXISTS (
       SELECT 1 FROM temp_recept_osszetevok
       WHERE receptid IS NULL OR osszetevo_id IS NULL OR mennyiség IS NULL OR mennyiség <= 0
    ) THEN
        RAISE EXCEPTION 'Hiba: Az importált adatokban hiányzó vagy érvénytelen értékek találhatók!';
    END IF;

    -- Adatok beszúrása, ha még nem léteznek
    INSERT INTO recept_osszetevok (receptid, recept_sorszam, osszetevo_id, mennyiség, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id)
    SELECT temp.receptid, temp.recept_sorszam, temp.osszetevo_id, temp.mennyiség, temp.mertek_mennyiseg_id, temp.osszetevo_osztaly_id, temp.recept_osztaly_id
    FROM temp_recept_osszetevok temp
    WHERE NOT EXISTS (
       SELECT 1 FROM recept_osszetevok r
       WHERE r.receptid = temp.receptid AND r.recept_sorszam = temp.recept_sorszam
    );

    RAISE NOTICE 'Adatok sikeresen importálva!';
END; $$;
