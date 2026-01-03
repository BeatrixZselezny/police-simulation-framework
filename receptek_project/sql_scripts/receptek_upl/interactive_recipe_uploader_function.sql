CREATE OR REPLACE FUNCTION  InteractiveRecipeUploader(
      receptid INT,
      recept_név VARCHAR,
      elkészítés VARCHAR,
      jegyzet VARCHAR,
      recept_osztaly_id INT,
      alaplé VARCHAR,
      zsíradék VARCHAR,
      hús VARCHAR,
      zöldség VARCHAR,
      tejtermék VARCHAR,
      gabonaféle VARCHAR,
      szárazáru VARCHAR,
      állati_termék VARCHAR,
      gyümölcs VARCHAR,
      fűszer VARCHAR,
      magvak VARCHAR,
      feldolgozott_élelmiszer VARCHAR,
      pékáru VARCHAR,
      ital VARCHAR,
      konzervtermék VARCHAR,
      édességek VARCHAR,
      kész_szósz VARCHAR,
      fűszernövény VARCHAR,
      kész_krém VARCHAR
) RETURNS VOID AS $$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
      IF EXISTS (SELECT 1 FROM receptek WHERE receptek.receptid = $1)  THEN
         RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
      ELSE
       -- Beszúrunk egy új rekordot
        INSERT INTO receptek (receptid, recept_név, elkészítés, jegyzet, recept_osztaly_id, alaplé, zsíradék, hús, zöldség, tejtermék,
 gabonaféle, szárazáru, állati_termék, gyümölcs, fűszer, magvak, feldolgozott_élelmiszer, pékáru, ital, konzervtermék, édességek,
 kész_szósz, fűszernövény, kész_krém)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24);
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_név = %', $1, $2;
     END IF;
        EXCEPTION
     WHEN OTHERS THEN
        -- Hibakezelés
        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
        RAISE EXCEPTION 'Nem várt hiba fordult elő!';
  END;
 $$ LANGUAGE plpgsql;
