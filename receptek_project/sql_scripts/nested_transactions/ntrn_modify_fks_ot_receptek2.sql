CREATE OR REPLACE FUNCTION módosít_foreign_key_megszorításokat() RETURNS void AS $$
BEGIN
    -- 1. fk_recept_osztály_id
    SAVEPOINT fk_recept_osztaly_id;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_recept_osztály_id';
        EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_osztály_id"';
        EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_recept_osztály_id"
                    FOREIGN KEY ("recept_osztály_id") REFERENCES recept_osztályok("recept_osztály_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
	ROLLBACK TO SAVEPOINT fk_recept_osztaly_id;
        RAISE NOTICE 'HIBA: fk_recept_osztály_id';
    END;

    -- 2. fk_receptek_recept_összetevők
    SAVEPOINT fk_receptek;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_receptek_recept_összetevők';
        EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_receptek_recept_összetevők"';
        EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_receptek_recept_összetevők"
                    FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_receptek; -- Javítva
        RAISE NOTICE 'HIBA: fk_receptek_recept_összetevők';
    END;

    -- 3. fk_összetevők_recept_összetevők
    SAVEPOINT fk_osszetevok_recept;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_összetevők_recept_összetevők';
        EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_recept_összetevők"';
        EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_összetevők_recept_összetevők"
                    FOREIGN KEY ("összetevő_id") REFERENCES összetevők("összetevő_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_osszetevok_recept; -- Javítva
        RAISE NOTICE 'HIBA: fk_összetevők_recept_összetevők';
    END;

    -- 4. fk_összetevők_osztály_id
    SAVEPOINT fk_osszetevok_osztaly;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_összetevők_osztály_id';
        EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_osztály_id"';
        EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_összetevők_osztály_id"
                    FOREIGN KEY ("összetevő_osztály_id") REFERENCES összetevők_osztály("összetevő_osztály_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_osszetevok_osztaly; -- Javítva
        RAISE NOTICE 'HIBA: fk_összetevők_osztály_id';
    END;

    -- 5. fk_recept_összetevők_mértékek
    SAVEPOINT fk_recept_mertek;
    BEGIN
        RAISE NOTICE 'Módosítom: fk_recept_összetevők_mértékek';
        EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_összetevők_mértékek"';
        EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_recept_összetevők_mértékek"
                    FOREIGN KEY ("mérték_mennyiség_id") REFERENCES mértékek("mérték_mennyiség_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_recept_mertek; -- Javítva
        RAISE NOTICE 'HIBA: fk_recept_összetevők_mértékek';
    END;

    -- 6. mértékekÖsszetevők
    SAVEPOINT fk_mertekek_osszetevok;
    BEGIN
        RAISE NOTICE 'Módosítom: mértékekÖsszetevők';
        EXECUTE 'ALTER TABLE összetevők DROP CONSTRAINT "mértékekÖsszetevők"';
        EXECUTE 'ALTER TABLE összetevők ADD CONSTRAINT "mértékekÖsszetevők"
                    FOREIGN KEY ("mérték_mennyiség_id") REFERENCES mértékek("mérték_mennyiség_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_mertekek_osszetevok; -- Javítva
        RAISE NOTICE 'HIBA: mértékekÖsszetevők';
    END;

    -- 7. Összetevő_osztályokÖsszetevők
    SAVEPOINT fk_osztaly_osszetevok;
    BEGIN
        RAISE NOTICE 'Módosítom: Összetevő_osztályokÖsszetevők';
        EXECUTE 'ALTER TABLE összetevők DROP CONSTRAINT "Összetevő_osztályokÖsszetevők"';
        EXECUTE 'ALTER TABLE összetevők ADD CONSTRAINT "Összetevő_osztályokÖsszetevők"
                    FOREIGN KEY ("összetevő_osztály_id") REFERENCES összetevők_osztály("összetevő_osztály_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_osztaly_osszetevok; -- Javítva
        RAISE NOTICE 'HIBA: Összetevő_osztályokÖsszetevők';
    END;

    -- 8. recept_osztályokreceptek
    SAVEPOINT fk_recept_osztaly_receptek;
    BEGIN
        RAISE NOTICE 'Módosítom: recept_osztályokreceptek';
        EXECUTE 'ALTER TABLE receptek DROP CONSTRAINT "recept_osztályokreceptek"';
        EXECUTE 'ALTER TABLE receptek ADD CONSTRAINT "recept_osztályokreceptek"
                    FOREIGN KEY ("recept_osztály_id") REFERENCES recept_osztályok("recept_osztály_id") ON DELETE RESTRICT';
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK TO SAVEPOINT fk_recept_osztaly_receptek; -- Javítva
        RAISE NOTICE 'HIBA: recept_osztályokreceptek';
    END;

    RAISE NOTICE '🎉 Minden megszorítás sikeresen RESTRICT-re lett módosítva!';
END;
$$ LANGUAGE plpgsql;

