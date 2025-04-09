CREATE OR REPLACE FUNCTION InteractiveRecipeMultiUploader.sql(
    receptid INT,
    recept_sorszám INT,
    összetevő_id INT,
    mennyiség INT,
    mérték_mennyiség_id INT,
    összetevő_osztály_id INT,
    recept_osztály_id INT
) RETURNS VOID AS $$
BEGIN
  -- Ellenőrizzük, hogy hogy már létezik -e, a megadott recept ID:
    IF EXISTS (SELECT 1 FROM recept_összetevők WHERE recept_összetevők.receptid = $1) THEN
        	RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
	ELSE    
  -- Beszúrunk egy új rekordot:
    WITH data AS (
       SELECT :receptid::int AS rec_id,
        	UNNEST(string_to_array(:'recept_sorszám', ',')::int[]) AS rec_no,
		UNNEST(string_to_array(:'összetevő_id', ',')::int[]) AS össz_id,
		UNNEST(string_to_array(:'mennyiség', ',')::int[]) AS menny,
		UNNEST(string_to_array(:'mérték_mennyiség_id', ',')::int[]) AS mért_menny_id,
                UNNEST(string_to array(:'összetevő_osztály_id', ',')::int[]) AS össz_oszt_id,
		UNNEST(string_to_array(:'recept_osztály_id', ',')::int[]) AS rec_oszt_id
)      INSERT INTO recept_összetevők (rec_id, rec_no, össz_id, menny, mért_menny_id, össz_oszt_id, rec_oszt_id)
       SELECT * FROM data;
                RAISE NOTICE 'A rekordok sikeresen létrejöttek: receptid =%, recept_név =%', $1, $2;
	END IF;
	EXCEPTION
		WHEN OTHER THEN
			-- Hibakezelés:
                        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
			RAISE EXCEPTION 'Nem várt hiba fordult elő!';
		END;
		$$ LANGUAGE plpgsql;
