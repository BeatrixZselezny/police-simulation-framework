CREATE OR REPLACE FUNCTION  InteractiveRecipeIngredientsUploader(
      receptid INT,
      recept_sorszam INT,
      osszetevo_id INT,
      mennyiség INT,
      mertek_mennyiseg_id INT,
      osszetevo_osztaly_id INT,
      recept_osztaly_id INT
) RETURNS VOID AS $$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
      IF EXISTS (SELECT 1 FROM recept_osszetevok WHERE recept_osszetevok.receptid = $1)  THEN
         RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
      ELSE
       -- Beszúrunk egy új rekordot
        INSERT INTO recept_osszetevok (receptid, recept_sorszam, osszetevo_id, mennyiség,  mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id)
        VALUES ($1, $2, $3, $4, $5, $6, $7);
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_sorszam = %, osszetevo_id = %, mennyiség = %, mertek_mennyiseg_id = %, osszetevo_osztaly_id = %, recept_osztaly_id = %',  $1, $2, $3, $4, $5, $6, $7;
     END IF;
        EXCEPTION
     WHEN OTHERS THEN
        -- Hibakezelés
        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
        RAISE EXCEPTION 'Nem várt hiba fordult elő!';
  END;
 $$ LANGUAGE plpgsql;
