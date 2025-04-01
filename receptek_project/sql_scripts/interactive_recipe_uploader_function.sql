CREATE OR REPLACE FUNCTION  InteractiveRecipeUploader(
      receptid INT,
      recept_név VARCHAR DEFAULT 'Nincs megadva',
      elkészítés VARCHAR DEFAULT 'Nincs megadva',
      jegyzet VARCHAR DEFAULT 'Nincs megadva',
      recept_osztály_id INT,
      alaplé VARCHAR DEFAULT 'Nincs megadva',
      zsíradék VARCHAR DEFAULT 'Nincs megadva',
      hús VARCHAR DEFAULT 'Nincs megadva',
      zöldség VARCHAR DEFAULT 'Nincs megadva',
      tejtermék VARCHAR DEFAULT 'Nincs megadva',
      gabonaféle VARCHAR DEFAULT 'Nincs megadva',
      szárazáru VARCHAR DEFAULT 'Nincs megadva',
      állati_termék VARCHAR DEFAULT 'Nincs megadva',
      gyümölcs VARCHAR DEFAULT 'Nincs megadva',
      fűszer VARCHAR DEFAULT 'Nincs megadva',
      magvak VARCHAR DEFAULT 'Nincs megadva',
      feldolgozott_élelmiszer VARCHAR DEFAULT 'Nincs megadva',
      pékáru VARCHAR DEFAULT 'Nincs megadva',
      ital VARCHAR DEFAULT 'Nincs megadva',
      konzervtermék VARCHAR DEFAULT 'Nincs megadva',
      édességek VARCHAR DEFAULT 'Nincs megadva',
      kész_szósz VARCHAR DEFAULT 'Nincs megadva',
      fűszernövény VARCHAR DEFAULT 'Nincs megadva',
      kész_krém VARCHAR DEFAULT 'Nincs megadva'
) RETURNS VOID AS $$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
    IF NOT EXISTS (SELECT 1 FROM receptek WHERE receptek.receptid = $1)  THEN
       -- Hem már létezik, beszúrunk egy új rekordot
        INSERT INTO receptek (receptid, recept_név, elkészítés, jegyzet, recept_osztály_id, alaplé, zsíradék, hús, zöldség, tejtermék,
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
