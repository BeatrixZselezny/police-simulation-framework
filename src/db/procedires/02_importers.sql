CREATE OR REPLACE PROCEDURE import_crime_history()
LANGUAGE plpgsql
AS $$
DECLARE csv_path TEXT;
BEGIN
    -- Izoláció és biztonság
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Elérési út lekérése (vagy fixen megadva)
    SELECT param_value INTO csv_path FROM config WHERE param_name = 'crime_import_path';

    -- TEMP tábla a bűnügyi adatoknak
    CREATE TEMP TABLE temp_crime_data (
        criminal_id INT,
        crime_id INT,
        crime_status VARCHAR(50),
        event_time TIMESTAMP
    ) ON COMMIT DROP;

    -- Dinamikus betöltés
    EXECUTE format('COPY temp_crime_data FROM %L WITH CSV HEADER', csv_path);

    -- Validáció: Ne legyen árva rekord (minden ID-nak léteznie kell)
    IF EXISTS (
        SELECT 1 FROM temp_crime_data t
        LEFT JOIN criminals c ON t.criminal_id = c.id
        LEFT JOIN crimes cr ON t.crime_id = cr.id
        WHERE c.id IS NULL OR cr.id IS NULL
    ) THEN
        RAISE EXCEPTION 'Hiba: Érvénytelen Criminal vagy Crime ID az import fájlban!';
    END IF;

    -- Beszúrás a criminal_records-ba (a mi új junction táblánk)
    INSERT INTO criminal_records (criminal_id, crime_id, status, event_time)
    SELECT t.criminal_id, t.crime_id, t.crime_status, t.event_time
    FROM temp_crime_data t
    ON CONFLICT DO NOTHING; -- Vizsga-tipp: redundancia elleni védelem

    RAISE NOTICE 'Bűnügyi nyilvántartás frissítve!';
END; $$;
