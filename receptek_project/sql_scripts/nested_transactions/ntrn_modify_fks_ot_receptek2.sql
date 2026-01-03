CREATE OR REPLACE FUNCTION módosít_foreign_key_megszorításokat() RETURNS void AS $$
BEGIN
    -- 1. fk_recept_osztaly_id
    SAVEPOINT fk_recept_osztaly_id;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_recept_osztaly_id';
        EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osztaly_id"';
        EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_recept_osztaly_id"
                    FOREIGN KEY ("recept_osztaly_id") REFERENCES recept_osztalyok("recept_osztaly_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
	ROLLBACK TO SAVEPOINT fk_recept_osztaly_id;
        RAISE NOTICE 'HIBA: fk_recept_osztaly_id';
    END;

    -- 2. fk_receptek_recept_osszetevok
    SAVEPOINT fk_receptek;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_receptek_recept_osszetevok';
        EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_receptek_recept_osszetevok"';
        EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_receptek_recept_osszetevok"
                    FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_receptek; -- Javítva
        RAISE NOTICE 'HIBA: fk_receptek_recept_osszetevok';
    END;

    -- 3. fk_osszetevok_recept_osszetevok
    SAVEPOINT fk_osszetevok_recept;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_osszetevok_recept_osszetevok';
        EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_osszetevok_recept_osszetevok"';
        EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_osszetevok_recept_osszetevok"
                    FOREIGN KEY ("osszetevo_id") REFERENCES osszetevok("osszetevo_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_osszetevok_recept; -- Javítva
        RAISE NOTICE 'HIBA: fk_osszetevok_recept_osszetevok';
    END;

    -- 4. fk_osszetevok_osztaly_id
    SAVEPOINT fk_osszetevok_osztaly;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_osszetevok_osztaly_id';
        EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_osszetevok_osztaly_id"';
        EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_osszetevok_osztaly_id"
                    FOREIGN KEY ("osszetevo_osztaly_id") REFERENCES osszetevok_osztaly("osszetevo_osztaly_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_osszetevok_osztaly; -- Javítva
        RAISE NOTICE 'HIBA: fk_osszetevok_osztaly_id';
    END;

    -- 5. fk_recept_osszetevok_mertekek
    SAVEPOINT fk_recept_mertek;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_recept_osszetevok_mertekek';
        EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osszetevok_mertekek"';
        EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_recept_osszetevok_mertekek"
                    FOREIGN KEY ("mertek_mennyiseg_id") REFERENCES mertekek("mertek_mennyiseg_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_recept_mertek; -- Javítva
        RAISE NOTICE 'HIBA: fk_recept_osszetevok_mertekek';
    END;

    -- 6. mertekekÖsszetevők
    SAVEPOINT fk_mertekek_osszetevok;
    BEGIN
        RAISE NOTICE 'Módosítom: mertekekÖsszetevők';
        EXECUTE 'ALTER TABLE osszetevok DROP CONSTRAINT "mertekekÖsszetevők"';
        EXECUTE 'ALTER TABLE osszetevok ADD CONSTRAINT "mertekekÖsszetevők"
                    FOREIGN KEY ("mertek_mennyiseg_id") REFERENCES mertekek("mertek_mennyiseg_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_mertekek_osszetevok; -- Javítva
        RAISE NOTICE 'HIBA: mertekekÖsszetevők';
    END;

    -- 7. Összetevő_osztályokÖsszetevők
    SAVEPOINT fk_osztaly_osszetevok;
    BEGIN
        RAISE NOTICE 'Módosítom: Összetevő_osztályokÖsszetevők';
        EXECUTE 'ALTER TABLE osszetevok DROP CONSTRAINT "Összetevő_osztályokÖsszetevők"';
        EXECUTE 'ALTER TABLE osszetevok ADD CONSTRAINT "Összetevő_osztályokÖsszetevők"
                    FOREIGN KEY ("osszetevo_osztaly_id") REFERENCES osszetevok_osztaly("osszetevo_osztaly_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_osztaly_osszetevok; -- Javítva
        RAISE NOTICE 'HIBA: Összetevő_osztályokÖsszetevők';
    END;

    -- 8. recept_osztalyokreceptek
    SAVEPOINT fk_recept_osztaly_receptek;
    BEGIN
        RAISE NOTICE 'Módosítom: recept_osztalyokreceptek';
        EXECUTE 'ALTER TABLE receptek DROP CONSTRAINT "recept_osztalyokreceptek"';
        EXECUTE 'ALTER TABLE receptek ADD CONSTRAINT "recept_osztalyokreceptek"
                    FOREIGN KEY ("recept_osztaly_id") REFERENCES recept_osztalyok("recept_osztaly_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_recept_osztaly_receptek; -- Javítva
        RAISE NOTICE 'HIBA: recept_osztalyokreceptek';
    END;

    RAISE NOTICE '🎉 Minden megszorítás sikeresen RESTRICT-re lett módosítva!';
END;
$$ LANGUAGE plpgsql;

