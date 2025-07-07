BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

DO $$
DECLARE
        err_msg text;
BEGIN

        -- 1. fk_recept_osztály_id
        BEGIN
                EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_osztály_id"';
                EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT fk_recept_osztaly_id FOREIGN KEY (recept_osztály_id) REFERENCES recept_osztályok(recept_osztály_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_recept_osztály_id', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE ' [1] fk_recept_osztály_id sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_recept_osztály_id', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [1] Hiba a fk_recept_osztály_id feldolgozásakor: %', err_msg;
                END;


        -- Start the refactoring in the junction.
        -- 2. fk_recept_összetevők_mértékek
        BEGIN
                EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_összetevők_mértékek"';
                EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_recept_osszetevok_mertekek" FOREIGN KEY (mérték_mennyiség_id) REFERENCES mértékek(mérték_mennyiség_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_receptek_recept_összetevők', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[2] fk_receptek_recept_összetevők sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_receptek_recept_összetevők', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [2] Hiba a fk_receptek_recept_összetevők feldolgozásakor: %', err_msg;
                END;


        -- 3. fk_receptek_recept_összetevők
        BEGIN
                EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_receptek_recept_összetevők"';
                EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT fk_receptek_recept_osszetevok FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_összetevő_osztály_id', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[3] fk_összetevő_osztály_id sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_összetevő_osztály_id', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [3] Hiba a fk_összetevő_osztály_id feldolgozásakor: %', err_msg;
                END;


        -- 4. fk_összetevők_osztály_id
        BEGIN
                EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_osztály_id"';
                EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT fk_recept_osszetevok_osszetevok_osztaly FOREIGN KEY (összetevő_osztály_id) REFERENCES összetevők_osztály(összetevő_osztály_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_összetevők_recept_összetevők', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[4] fk_összetevők_recept_összetevők sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_összetevők_recept_összetevők', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [4] Hiba a fk_összetevők_recept_összetevők feldolgozásakor: %', err_msg;
                END;


        -- 5. fk_összetevők_recept_összetevők
        BEGIN
                EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_recept_összetevők"';
                EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT fk_osszetevok_recept_osszetevok FOREIGN KEY (összetevő_id) REFERENCES összetevők(összetevő_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_mérték_mennyiség_id', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[5] fk_mérték_mennyiség_id sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_mérték_mennyiség_id', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [5] Hiba a fk_mérték_mennyiség_id feldolgozásakor: %', err_msg;
                END;

        -- End the refactoring in the Junction.


        -- Starting refactoring: összetevők, receptek.
        -- 6. mértékekÖsszetevők

        BEGIN
                EXECUTE 'ALTER TABLE összetevők DROP CONSTRAINT "mértékekÖsszetevők"';
                EXECUTE 'ALTER TABLE összetevők ADD CONSTRAINT fk_mertekek_osszetevok FOREIGN KEY (mérték_mennyiség_id) REFERENCES mértékek(mérték_mennyiség_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('mértékekÖsszetevők', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE ' [6] mértékekÖsszetevők sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('mértékekÖsszetevők', 'DROP+ADD', 'hiba', err_msg, current_user);
                RAISE NOTICE ' [6] Hiba a mértékekÖsszetevők feldolgozásakor: %', err_msg;
                END;


        -- 7. Refactoring the connections with the Class Parent table: Összetevő_osztályokÖsszetevők.
        BEGIN
                EXECUTE 'ALTER TABLE összetevők DROP CONSTRAINT "Összetevő_osztályokÖsszetevők"';
                EXECUTE 'ALTER TABLE összetevők ADD CONSTRAINT fk_osszetevok_osszetevok_osztaly FOREIGN KEY (összetevő_osztály_id) REFERENCES összetevők_osztály(összetevő_osztály_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_osszetevok_osszetevok_osztaly', 'DROP+ADD', 'hiba', err_msg, current_user);

                RAISE NOTICE '✔️[7] fk_osszetevok_osszetevok_osztaly sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('Összetevő_osztályokÖsszetevők', 'DROP+ADD', 'hiba', err_msg, current_user);
                RAISE NOTICE ' [7] Hiba az Összetevő_osztályokÖsszetevők feldolgozása során: %', err_msg;
                END;


        -- 8. Refactoring the connections with the Class Parent table:  recept_osztályokreceptek
        BEGIN
                EXECUTE 'ALTER TABLE receptek DROP CONSTRAINT "recept_osztályokreceptek"';
                EXECUTE 'ALTER TABLE receptek ADD CONSTRAINT fk_recept_osztalyok_receptek FOREIGN KEY (recept_osztály_id) REFERENCES recept_osztályok(recept_osztály_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_recept_osztalyok_receptek', 'DROP+ADD', 'hiba', err_msg, current_user);

                RAISE NOTICE '✔️[8] fk_recept_osztalyok_receptek sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('recept_osztályokreceptek', 'DROP+ADD', 'hiba', err_msg, current_user); 
		RAISE NOTICE ' [8] Hiba az recept_osztályokreceptek feldolgozása során: %', err_msg;
                END;
        END;
$$;
COMMIT;


