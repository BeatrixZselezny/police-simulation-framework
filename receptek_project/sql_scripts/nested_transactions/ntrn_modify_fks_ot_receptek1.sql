BEGIN;

	-- Kezdeti mentési pont
SAVEPOINT full_rollback;
\echo '-- Elindul a FOREIGN KEY megszorítások módosítása ON DELETE RESTRICT-re --';

--------------------------------------------------------------
-- 1. recept_összetevők tábla megszorításainak módosítása
-- Ez a kapcsoló tábla ami hivatkozik a legtöbb szülőtáblákra.
--------------------------------------------------------------

-- fk_recept_osztály_id
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_recept_osztály_id" megszorítását.';
		SAVEPOINT recept_osztaly_id;

		EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_osztály_id"';
		EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_recept_osztály_id" FOREIGN KEY ("recept_osztály_id") REFERENCES recept_osztályok("recept_osztály_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A fk_recept_osztály_id megszorítás módosítva';
		RELEASE SAVEPOINT recept_osztaly_id;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_recept_osztály_id" megszorítás módosítása során. Visszaállítás mentési pontra';
				ROLLBACK recept_osztaly_id;
			END;
			$$ LANGUAGE plpgsql;


-- fk_recept_összetevők_mértékek
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_recept_összetevők_mértékek" megszorítását.';
		SAVEPOINT modify_recept_osszetevok_fk_mertekek;

		EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_összetevők_mértékek"';
		EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_recept_összetevők_mértékek" FOREIGN KEY ("mérték_mennyiség_id") REFERENCES "mértékek"("mérték_mennyiség_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "fk_recept_összetevők_mértékek" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_recept_osszetevok_fk_mertekek;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_recept_összetevők_mértékek" megszorítás módosítása során. Visszaállítás mentési pontra.';
				ROLLBACK TO modify_recept_osszetevok_fk_mertekek;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;



-- kf_receptek_recept_összetevők
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_receptek_recept_összetevők" megszorítását.';
		SAVEPOINT modify_recept_osszetevok_fk_receptek;

		EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_receptek_recept_összetevők"';
		EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_receptek_recept_összetevők" FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT';

		RAISE NOTICE 'A "fk_receptek_recept_összetevők" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_recept_osszetevok_fk_receptek;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_receptek_recept_összetevők" megszorítás módosítása során. Visszaállítás a mentési pontra.';
				ROLLBACK TO modify_recept_osszetevok_fk_receptek;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;


-- fk_összetevők_osztály_id
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_összetevők_osztály_id" megszorítását.';
		SAVEPOINT modify_recept_osszetevok_fk_osszetevok_osztaly;

		EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_osztály_id"';
		EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_összetevők_osztály_id" FOREIGN KEY ("összetevő_osztály_id") REFERENCES "összetevők_osztály"("összetevő_osztály_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "fk_összetevők_osztály_id" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_recept_osszetevok_fk_osszetevok_osztaly;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_összetevők_osztály_id" módosítása során. Visszaállítás a mentési pontra.';
				ROLLBACK TO modify_recept_osszetevok_fk_osszetevok_osztaly;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;


-- fk_összetevők_recept_összetevők
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_összetevők_recept_összetevők" megszorítását.';
		SAVEPOINT modify_recept_osszetevok_fk_osszetevok;

		EXECUTE 'ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_recept_összetevők"';
		EXECUTE 'ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_összetevők_recept_összetevők" FOREIGN KEY ("összetevő_id") REFERENCES összetevők("összetevő_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "fk_összetevők_recept_összetevők" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_recept_osszetevok_fk_osszetevok;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_összetevők_recept_összetevők" megszorítás módosítása során. Visszaállítás a mentési pontra';
				ROLLBACK TO modify_recept_osszetevok_fk_osszetevok;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;



-----------------------------------------------------------------------------------------------------
-- 2. összetevők tábla megszorításának módosítása
-- Az összetevők a következő szint, miután a recept_összetevőkön belüli rámutató FK-kat módosítottuk.
-----------------------------------------------------------------------------------------------------




-- mértékekÖsszetevők
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom az "összetevők" tébla "mértékekÖsszetevők" megszorítását';
		SAVEPOINT modify_osszetevok_fk_mertekek;

		EXECUTE 'ALTER TABEL összetevők DROP CONSTRAINT "mértékekÖsszetevők"';
		EXECUTE 'ALTER TABLE összetevők ADD CONSTRAINT "mértékekÖsszetevők" FOREIGN KEY ("mérték_mennyiség_id") REFERENCES("mérték_mennyiség_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "mértékekÖsszetevők" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_osszetevok_fk_mertekek;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "mértékekÖsszetevők" megszorítás módosítása során. Visszaállítás a mentési pontra.';
				ROLLBACK TO modify_osszetevok_fk_mertekek;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;


			
-- Összetevő_osztályokÖsszetevők
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom az "összetevők" tábla "Összetevő_osztályokÖsszetevők" megszorítását.';
		SAVEPOINT modify_osszetevok_fk_osszetevok_osztaly;

		EXECUTE 'ALTER TABLE összetevők DROP CONSTRAINT "Összetevő_osztályokÖsszetevők"';
		EXECUTE 'ALTER TABLE összetevők ADD CONSTRAINT "Összetevő_osztályokÖsszetevők" FOREIGN KEY ("összetevő_osztály_id") REFERENCES "összetevők_osztály"("összetevő_osztály_id") ON DELETE RESTRICT';

		RAISE NOTICE 'Az "Összetevő_osztályokÖsszetevők" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_osszetevok_fk_osszetevok_osztaly;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt az "Összetevő_osztályokÖsszetevők" megszorítás módosítása során. Visszaállítás mentési pontra.';
				ROLLBACK TO modify_osszetevok_fk_osszetevok_osztaly;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;
			


--------------------------------------------------------------------
-- 3. receptek tábla megszorításának módosítása
-- A receptek tábla a legmagasabb szintű tábla a függőségi láncban.
--------------------------------------------------------------------
			


-- recept_osztályokreceptek
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "receptek" tábla "recept_osztályokreceptek" megszorítását.';
		SAVEPOINT modify_receptek_fk_recept_osztalyok;

		EXECUTE 'ALTER TABLE receptek DROP CONSTRAINT "recept_osztályokreceptek"';
		EXECUTE 'ALTER TABLE receptek ADD CONSTRAINT "recept_osztályokreceptek" FOREIGN KEY ("recept_osztály_id") REFERENCES recept_osztályok("recept_osztály_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "recept_osztályokreceptek" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_receptek_fk_recept_osztalyok;
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "recept_osztályokreceptek" megszorítás módosítása során. Visszaállítás a mentési pontra.';
				ROLLBACK TO modify_receptek_fk_recept_osztalyok;
				RAISE;
			END;
			$$ LANGUAGE plpgsql;


-- Végleges üzenet a tranzakció végén
\echo '-- Minden FOREIGN KEY megszorítás módosítása sikeresen befejeződött ON DELETE RESTRICT-re! --';

-- Ez a rész NEM része a DO blokknak, a külső tranzakció kezeli.
-- Ha minden DO blokk hiba nélkül lefutott:
COMMIT;
-- Ha valami kritikus hiba történt az egész folyamat során:
ROLLBACK TO full_rollback;
-- Egyébként:
ROLLBACK;















 






