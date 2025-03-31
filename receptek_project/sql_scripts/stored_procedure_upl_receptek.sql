  CREATE OR REPLACE FUNCTION  Int_stp_upl_receptek(\
      receptid INT,\
      recept_név VARCHAR DEFAULT 'Nincs megadva',\
      elkészítés VARCHAR DEFAULT 'Nincs megadva',\
      jegyzet VARCHAR DEFAULT 'Nincs megadva',\
      recept_osztály_id INT,\
      alaplé VARCHAR DEFAULT 'Nincs megadva',\
      zsíradék VARCHAR DEFAULT 'Nincs megadva',\
      hús VARCHAR DEFAULT 'Nincs megadva',\
      zöldség VARCHAR DEFAULT 'Nincs megadva',\
      tejtermék VARCHAR DEFAULT 'Nincs megadva',\
      gabonaféle VARCHAR DEFAULT 'Nincs megadva',\
      szárazáru VARCHAR DEFAULT 'Nincs megadva',\
      állati_termék VARCHAR DEFAULT 'Nincs megadva',\
      gyümölcs VARCHAR DEFAULT 'Nincs megadva',\
      fűszer VARCHAR DEFAULT 'Nincs megadva',\
      magvak VARCHAR DEFAULT 'Nincs megadva',\
      feldolgozott_élelmiszer VARCHAR DEFAULT 'Nincs megadva',\
      pékáru VARCHAR DEFAULT 'Nincs megadva',\
      ital VARCHAR DEFAULT 'Nincs megadva',\
      konzervtermék VARCHAR DEFAULT 'Nincs megadva',\
      édességek VARCHAR DEFAULT 'Nincs megadva',\
      kész_szósz VARCHAR DEFAULT 'Nincs megadva',\
      fűszernövény VARCHAR DEFAULT 'Nincs megadva',\
      kész_krém VARCHAR DEFAULT 'Nincs megadva'\
) RETURNS VOID AS $$\
 DECLARE
    v.alaplé VARCHAR := CASE WHEN $6 IS NULL OR $6  = '' THEN NULL ELSE $6 END;
    v.zsíradék VARCHAR := CASE WHEN $7 IS NULL OR $7 = '' THEN NULL ELSE $7 END;
    v.hús VARCHAR := CASE WHEN $8 IS NULL OR $8 = '' THEN NULL ELSE $8 END;
    v.zöldség VARCHAR := CASE WHEN $9 IS NULL OR $9 = '' THEN NULL ELSE $9 END;
    v.tejtermét VARCHAR := CASE WHEN $10 IS NULL OR $10 = '' THEN NULL ELSE $10 END;
    v.gabonaféle VARCHAR := CASE WHEN $11 IS NULL OR $11 = '' THEN NULL ELSE $11 END;
    v.szárazáru VARCHAR := CASE WHEN $12 IS NULL OR $12 = '' THEN NULL ELSE $12 END;
    v.állati_termék VARCHAR := CASE WHEN $13 IS NULL OR $13 = '' THEN NULL ELSE $13 END;
    v.gyümölcs VARCHAR := CASE WHEN $14 IS NULL OR $14 = '' THEN NULL ELSE $14 END;
    v.fűszer VARCHAR := CASE WHEN $15 IS NULL OR $15 = '' THEN NULL ELSE $15 END;
    v.magvak VARCHAR := CASE WHEN $16 IS NULL OR $16 = '' THEN NULL ELSE $16 END;
    v.feldolgozott_élelmiszer VARCHAR := CASE WHEN $17 IS NULL OR $17 = '' THEN NULL ELSE $17 END;
    v.pékáru VARCHAR := CASE WHEN $18 IS NULL OR $18 = '' THEN NULL ELSE $18 END;
    v.ital VARCHAR := CASE WHEN $19 IS NULL OR $19 = '' THEN NULL ELSE $19 END;
    v.konzervtermék VARCHAR := CASE WHEN $20 IS NULL OR $20 = '' THEN NULL ELSE $20 END;
    v.édességek VARCHAR := CASE WHEN $21 IS NULL OR $21 = '' THEN NULL ELSE $21 END;
    v.kész_szósz VARCHAR := CASE WHEN $22 IS NULL OR $22 = '' THEN NULL ELSE $22 END;
    v.fűszernövény VARCHAR := CASE WHEN $23 IS NULL OR $23 = '' THEN NULL ELSE $23 END;
    v.kész_krém VARCHAR := CASE WHEN $24 IS NULL OR $24 = '' THEN NULL ELSE $24 END;
 BEGIN\
 -- Ellenőrizzük, hogy már létezik -e a megadott recept_id\
     IF NOT EXISTS (SELECT 1 FROM receptek WHERE receptek.receptid = $1)  THEN\
 -- Hem már létezik, beszúrunk egy új rekordot\
        INSERT INTO receptek (receptid, recept_név, elkészítés, jegyzet, recept_osztály_id, alaplé, zsíradék, hús, zöldség, tejtermék,\
 gabonaféle, szárazáru, állati_termék, gyümölcs, fűszer, magvak, feldolgozott_élelmiszer, pékáru, ital, konzervtermék, édességek,\
 kész_szósz, fűszernövény, kész_krém)\
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24);\
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_név = %', $1, $2;\
            EXCEPTION WHEN others THEN\
              RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
          END;
     ELSE\
 -- Ha már létezik, értesítést küldünk RAISE NOTICE 'A megadott receptid (%) már létezik!', receptid;\
     END IF;\
  END;\
 $$ LANGUAGE plpgsql;
