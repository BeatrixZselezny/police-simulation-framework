CREATE OR REPLACE PROCEDURE MassUploadReceptek()
LANGUAGE plpgsql
AS $$
DECLARE
   csv_path TEXT;
BEGIN
	SELECT param_value INTO csv_path FROM config WHERE param_name = 'csv_path';



	CREATE TEMP TABLE temp_recept_összetevők (
	   receptid INT,
	   recept_sorszám INT,
	   összetevő_id INT,
	   mennyiség INT,
	   mérték_mennyiség_id INT,
	   összetevő_osztály_id INT,
	   recept_osztály_id INT
	) /* ON COMMIT DROP */;

	EXECUTE format(
	   'COPY temp_recept_összetevők FROM %L WITH CSV HEADER',
	    csv_path
	);

	PERFORM 1
	FROM temp_recept_összetevők
	WHERE receptid IS NULL
       	OR összetevő_id IS NULL
	OR mennyiség IS NULL
       	OR mennyiség <= 0;

	IF FOUND THEN
		ROLLBACK;
		RAISE EXCEPTION 'Hiba: Az importált adatokban hiányzó vagy érvénytelen értékek találhatók!';
	END IF;


        INSERT INTO recept_összetevők (receptid, recept_sorszám, összetevő_id, mennyiség, mérték_mennyiség_id, összetevő_osztály_id, recept_osztály_id)
	SELECT temp.receptid, temp.recept_sorszám, temp.összetevő_id, temp.mennyiség, temp.mérték_mennyiség_id, temp.összetevő_osztály_id, temp.recept_osztály_id
	FROM temp_recept_összetevők temp
	WHERE NOT EXISTS (
	   SELECT 1 FROM recept_összetevők r
	   WHERE r.receptid = temp.receptid AND r.recept_sorszám = temp.recept_sorszám
	);

	COMMIT;

	RAISE NOTICE 'Adatok sikeresen importálva!';
       END;
      $$;


