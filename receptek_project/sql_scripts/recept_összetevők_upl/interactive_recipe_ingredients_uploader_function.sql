CREATE OR REPLACE FUNCTION  InteractiveRecipeIngredientsUploader(
      receptid INT,
      recept_sorszám INT,
      összetevő_id INT,
      mennyiség INT,
      mérték_mennyiség_id INT,
      összetevő_osztály_id INT,
      recept_osztály_id INT
) RETURNS VOID AS $$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
      IF EXISTS (SELECT 1 FROM recept_összetevők WHERE recept_összetevők.receptid = $1)  THEN
         RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
      ELSE
       -- Beszúrunk egy új rekordot
        INSERT INTO recept_összetevők (receptid, recept_sorszám, összetevő_id, mennyiség,  mérték_mennyiség_id, összetevő_osztály_id, recept_osztály_id)
        VALUES ($1, $2, $3, $4, $5, $6, $7);
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_sorszám = %, összetevő_id = %, mennyiség = %, mérték_mennyiség_id = %, összetevő_osztály_id = %, recept_osztály_id = %',  $1, $2, $3, $4, $5, $6, $7;
     END IF;
        EXCEPTION
     WHEN OTHERS THEN
        -- Hibakezelés
        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
        RAISE EXCEPTION 'Nem várt hiba fordult elő!';
  END;
 $$ LANGUAGE plpgsql;
