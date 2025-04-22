CREATE OR REPLACE FUNCTION csv_feltöltés(filepath VARCHAR)
RETURNS VOID AS $$
BEGIN
	BEGIN
		EXECUTE format(
		'COPY recept_összetevők(receptid, recept_sorszám, összetevő_id, mennyiség, mérték_mennyiség_id, összetevő_osztály_id)
	         FROM %L
	         WITH (FORMAT csv, DELIMITER ",");',
	         filepath
	        );
		COMMIT
	       EXCEPTION
	         WHEN OTHERS THEN
		ROLLBACK;
	        RAISE EXCEPTION 'Hiba történt az adatbetöltés során: %', SQLERRM;
   END;
END;
$$ LANGUAGE plpgsql;

