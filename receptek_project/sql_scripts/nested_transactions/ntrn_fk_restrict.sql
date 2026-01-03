BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

DO $$
DECLARE
        err_msg text;
BEGIN

        -- 1. fk_recept_osztaly_id
        BEGIN
                EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osztaly_id"';
                EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_recept_osztaly_id FOREIGN KEY (recept_osztaly_id) REFERENCES recept_osztalyok(recept_osztaly_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_recept_osztaly_id', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE ' [1] fk_recept_osztaly_id sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_recept_osztaly_id', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [1] Hiba a fk_recept_osztaly_id feldolgozásakor: %', err_msg;
                END;


        -- Start the refactoring in the junction.
        -- 2. fk_recept_osszetevok_mertekek
        BEGIN
                EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osszetevok_mertekek"';
                EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_recept_osszetevok_mertekek" FOREIGN KEY (mertek_mennyiseg_id) REFERENCES mertekek(mertek_mennyiseg_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_receptek_recept_osszetevok', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[2] fk_receptek_recept_osszetevok sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_receptek_recept_osszetevok', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [2] Hiba a fk_receptek_recept_osszetevok feldolgozásakor: %', err_msg;
                END;


        -- 3. fk_receptek_recept_osszetevok
        BEGIN
                EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_receptek_recept_osszetevok"';
                EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_receptek_recept_osszetevok FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_osszetevo_osztaly_id', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[3] fk_osszetevo_osztaly_id sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_osszetevo_osztaly_id', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [3] Hiba a fk_osszetevo_osztaly_id feldolgozásakor: %', err_msg;
                END;


        -- 4. fk_osszetevok_osztaly_id
        BEGIN
                EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_osszetevok_osztaly_id"';
                EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_recept_osszetevok_osszetevok_osztaly FOREIGN KEY (osszetevo_osztaly_id) REFERENCES osszetevok_osztaly(osszetevo_osztaly_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_osszetevok_recept_osszetevok', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[4] fk_osszetevok_recept_osszetevok sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_osszetevok_recept_osszetevok', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [4] Hiba a fk_osszetevok_recept_osszetevok feldolgozásakor: %', err_msg;
                END;


        -- 5. fk_osszetevok_recept_osszetevok
        BEGIN
                EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_osszetevok_recept_osszetevok"';
                EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_osszetevok_recept_osszetevok FOREIGN KEY (osszetevo_id) REFERENCES osszetevok(osszetevo_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('fk_mertek_mennyiseg_id', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE '✔️[5] fk_mertek_mennyiseg_id sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_mertek_mennyiseg_id', 'DROP+ADD', 'Hiba', err_msg, current_user);
                RAISE NOTICE ' [5] Hiba a fk_mertek_mennyiseg_id feldolgozásakor: %', err_msg;
                END;

        -- End the refactoring in the Junction.


        -- Starting refactoring: osszetevok, receptek.
        -- 6. mertekekÖsszetevők

        BEGIN
                EXECUTE 'ALTER TABLE osszetevok DROP CONSTRAINT "mertekekÖsszetevők"';
                EXECUTE 'ALTER TABLE osszetevok ADD CONSTRAINT fk_mertekek_osszetevok FOREIGN KEY (mertek_mennyiseg_id) REFERENCES mertekek(mertek_mennyiseg_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, user_name)
                VALUES ('mertekekÖsszetevők', 'DROP+ADD', 'Sikeres', current_user);

                RAISE NOTICE ' [6] mertekekÖsszetevők sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('mertekekÖsszetevők', 'DROP+ADD', 'hiba', err_msg, current_user);
                RAISE NOTICE ' [6] Hiba a mertekekÖsszetevők feldolgozásakor: %', err_msg;
                END;


        -- 7. Refactoring the connections with the Class Parent table: Összetevő_osztályokÖsszetevők.
        BEGIN
                EXECUTE 'ALTER TABLE osszetevok DROP CONSTRAINT "Összetevő_osztályokÖsszetevők"';
                EXECUTE 'ALTER TABLE osszetevok ADD CONSTRAINT fk_osszetevok_osszetevok_osztaly FOREIGN KEY (osszetevo_osztaly_id) REFERENCES osszetevok_osztaly(osszetevo_osztaly_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_osszetevok_osszetevok_osztaly', 'DROP+ADD', 'hiba', err_msg, current_user);

                RAISE NOTICE '✔️[7] fk_osszetevok_osszetevok_osztaly sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('Összetevő_osztályokÖsszetevők', 'DROP+ADD', 'hiba', err_msg, current_user);
                RAISE NOTICE ' [7] Hiba az Összetevő_osztályokÖsszetevők feldolgozása során: %', err_msg;
                END;


        -- 8. Refactoring the connections with the Class Parent table:  recept_osztalyokreceptek
        BEGIN
                EXECUTE 'ALTER TABLE receptek DROP CONSTRAINT "recept_osztalyokreceptek"';
                EXECUTE 'ALTER TABLE receptek ADD CONSTRAINT fk_recept_osztalyok_receptek FOREIGN KEY (recept_osztaly_id) REFERENCES recept_osztalyok(recept_osztaly_id) ON DELETE RESTRICT';

                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('fk_recept_osztalyok_receptek', 'DROP+ADD', 'hiba', err_msg, current_user);

                RAISE NOTICE '✔️[8] fk_recept_osztalyok_receptek sikeresen lefutott.';
                        EXCEPTION WHEN OTHERS THEN
                                GET STACKED DIAGNOSTICS err_msg = MESSAGE_TEXT;
                INSERT INTO audit_ddl_log (constraint_nev, muvelet, eredmeny, hibauzenet, user_name)
                VALUES ('recept_osztalyokreceptek', 'DROP+ADD', 'hiba', err_msg, current_user); 
		RAISE NOTICE ' [8] Hiba az recept_osztalyokreceptek feldolgozása során: %', err_msg;
                END;
        END;
$$;
COMMIT;


