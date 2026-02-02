CREATE OR REPLACE PROCEDURE trn_police_importer()
LANGUAGE plpgsql
AS $$
DECLARE csv_path TEXT;
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Az útvonalat a config táblából vesszük, ahogy te tervezted
    SELECT param_value INTO csv_path FROM config WHERE param_name = 'police_csv_path';

    CREATE TEMP TABLE temp_police (
        name VARCHAR(100),
        age INT,
        rank VARCHAR(50),
        department VARCHAR(50)
    ) ON COMMIT DROP;

    EXECUTE format('COPY temp_police FROM %L WITH CSV HEADER', csv_path);

    -- Csak azokat szúrjuk be, akik még nincsenek benne név alapján
    INSERT INTO policeofficers (name, age, rank, department)
    SELECT t.name, t.age, t.rank, t.department
    FROM temp_police t
    WHERE NOT EXISTS (
        SELECT 1 FROM policeofficers p WHERE p.name = t.name
    );

    RAISE NOTICE 'Rendőrségi állomány sikeresen importálva!';
END; $$;
