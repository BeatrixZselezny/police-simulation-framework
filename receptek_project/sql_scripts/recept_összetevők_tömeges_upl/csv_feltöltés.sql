CREATE OR REPLACE FUNCTION csv_feltöltés(filepath VARCHAR)
RETURNS VOID AS $$
BEGIN
	BEGIN
		EXECUTE format(
		'COPY recept_osszetevok(receptid, recept_sorszam, osszetevo_id, mennyiség, mertek_mennyiseg_id, osszetevo_osztaly_id)
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

