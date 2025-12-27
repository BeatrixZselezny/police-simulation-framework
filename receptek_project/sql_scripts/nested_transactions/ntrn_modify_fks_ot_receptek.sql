BEGIN;
-- Kezdeti mentési pont
SAVEPOINT full_rollback_point;
\echo '-- Elindul a FOREIGN KEY megszorítások módosítása ON DELETE RESTRICT-re --';

-----------------------------------------------------------------------
-- 1. recept_osszetevok tábla megszorításainak módosítása
-- Ez a kapcsoló tábla a ami hivatkozik a legtöbb szülő táblákra.
-----------------------------------------------------------------------

-- fk_recept_osztaly_id
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_recept_osztaly_id" megszorítását.';
		SAVEPOINT modify_recept_osszetevok_fk_recept_osztaly_id;

		EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osztaly_id"';
		EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_recept_osztaly_id" FOREIGN KEY
		("recept_osztaly_id") REFERENCES recept_osztalyok("recept_osztaly_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "fk_recept_osztaly_id" megszorítás módosítva';
		RELEASE SAVEPOINT modify_recept_osszetevok_fk_recept_osztaly_id;
	      EXCEPTION
		WHEN OTHERS THEN
		  RAISE NOTICE 'HIBA történt a "fk_recept_osztaly_id" megszorítás módosítása során. Visszaállítás mentési pontra';
		ROLLBACK TO modify_recept_osszetevok_fk_recept_osztaly_id;
		RAISE; -- Az eredeti hibát tovább dobja, hogy lássuk a részleteket
	END;
$$ LANGUAGE plpgsql;


-- fk_recept_osszetevok_mertekek
DO $$
	BEGIN
			RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_recept_osszetevok_mertekek" megszorítást.';
			SAVEPOINT modify_recept_osszetevok_fk_mertekek;

			EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT fk_recept_osszetevok_mertekek';
			EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_recept_osszetevok_mertekek FOREIGN KEY
			("mertek_mennyiseg_id") REFERENCES mertekek("mertek_mennyiseg_id") ON DELETE RESTRICT';

			RAISE NOTICE 'A "fk_recept_osszetevok_mertekek" megszorítás módosítva.';
			RELEASE SAVEPOINT modify_recept_osszetevok_fk_mertekek;
		      EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_recept_osszetevok_mertekek" megszorítás módosítása során.
				Visszaállítás a mentési pontra.';
			ROLLBACK TO modify_recept_osszetevok_fk_mertekek;
			RAISE;
	END;
$$ LANGUAGE plpgsql;


-- fk_receptek_recept_osszetevok
DO $$
	BEGIN
			RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_receptek_recept_osszetevok" megszorítást.'
			SAVEPOINT modify_recept_osszetevpk_fk_receptek;

			EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT fk_receptek_recept_osszetevok';
			EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_receptek_recept_osszetevok FOREIGN KEY
			(receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT';

			RAISE NOTICE 'A "fk_receptek_recept_osszetevok" megszorítás módosítva';
			RELEASE SAVEPOINT modify_recept_osszetevok_fk_receptek;
		      EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_receptek_recept_osszetevok" megszorítás módosítása során.
				Visszaállítás a mentési pontra.';
			ROLLBACK TO modify_recept_osszetevok_fk_receptek;
			RAISE;
        END;
$$ LANGUAGE plpgsql;


-- fk_osszetevok_osztaly_id
DO $$
	BEGIN
			RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_osszetevok_osztaly_id" megszorítását.';
			SAVEPOINT modify_recept_osszetevok_fk_osszetevok_osztaly;

			EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT fk_osszetevok_osztaly_id';
			EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_osszetevok_osztaly_id FOREIGN KEY
			("osszetevo_osztaly_id") REFERENCES osszetevok_osztaly("osszetevo_osztaly_id") ON DELETE RESTRICT';

			RAISE NOTICE 'A "fk_osszetevok_osztaly_id" megszorítás módosítva.';
			RELEASE SAVEPOINT modify_recept_osszetevok_fk_osszetevok_osztaly;
		      EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE 'HIBA történt a "fk_osszetevok_osztaly_id" megszorítás módosítása során.
				Visszaállítás a mentési pontra';
				ROLLBACK TO  modify_recept_osszetevok_fk_osszetevok_osztaly;
				RAISE;
        END;
$$ LANGUAGE plpgsql;


-- fk_osszetevok_recept_osszetevok
DO $$
       BEGIN
		RAISE NOTICE 'módosítom a "recept_osszetevok" tábla "fk_osszetevok_recept_osszetevok" megszorítását."';
		SAVEPOINT modify_recept_osszetevok_fk_osszetevok;

		EXECUTE 'ALTER TABLE recept_osszetevok DROP CONSTRAINT fk_osszetevok_recept_osszetevok';
		EXECUTE 'ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_osszetevok_recept_osszetevok';
		FOREIGN KEY ("osszetevo_id") REFERENCES osszetevok("osszetevo_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "fk_osszetevok_recept_osszetevok" megszoríítás módosítva.';
		RELEASE SAVEPOINT modify_recept_osszetevok_fk_osszetevok;
	      EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'HIBA történt a "fk_osszetevok_recept_osszetevok" megszoríítás módosítása során.
			Visszaállítás a mentési pontra.';
			ROLLBACK TO modify_recept_osszetevok_fk_osszetevok;
			RAISE;
        END;
$$ LANGUAGE plpgsql;



-----------------------------------------------------------------------------------------------------
-- 2. osszetevok tábla megszorításának módosítása
-- Az osszetevok a következő szint, miután a recept_osszetevokön belüli rámutató FK-kat módosítottuk.
-----------------------------------------------------------------------------------------------------


-- mertekekÖsszetevők
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom az "osszetevok" tábla "mertekekÖsszetevők" megszorítását.';
		SAVEPOINT modify_osszetevok_fk_mertekek;

		EXECUTE 'ALTER TABLE osszetevok DROP CONSTRAINT "mertekekÖsszetevők"';
		EXECUTE 'ALTER TABLE osszetevok ADD CONSTRAINT "mertekekÖsszetevők" FOREIGN KEY
		("mertek_mennyiseg_id") REFERENCES mertekek("mertek_mennyiseg_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "mertekekÖsszetevők" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_osszetevok_fk_mertekek;
	      EXCEPTION
		WHEN OTHERS THEN
			RAISE NOTICE 'HIBA történt a "mertekekÖsszetevők" megszorítás módosítása során.
			Visszaállítás a mentési pontra.';
			ROLLBACK TO modify_osszetevok_fk_mertekek;
			RAISE;
	END;
$$ LANGUAGE plpgsql;

-- Összetevő_osztályokÖsszetevők
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom az "osszetevok" tábla "Összetevő_osztályokÖsszetevők" megszorítását';
		SAVEPOINT modify_osszetevok_fk_osszetevok_osztaly;

		EXECUTE 'ALTER TABLE osszetevok DROP CONSTRAINT "Összetevő_osztályokÖsszetevők"';
		EXECUTE 'ALTER TABLE osszetevok ADD CONSTRAINT "Összetevő_osztályokÖsszetevők" FOREIGN KEY
		 ("osszetevo_osztaly_id") REFERENCES osszetevok_osztaly("osszetevo_osztaly_id") ON DELETE RESTRICT';

		RAISE NOTICE 'Az "Összetevő_osztályokÖsszetevők" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_osszetevok_fk_osszetevok_osztaly;
	      EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE 'HIBA történt az "Összetevő_osztályokÖsszetevők" megszorítás módosítása során.
		Visszaállítás a mentési pontra.';
		ROLLBACK TO modify_osszetevok_fk_osszetevok_osztaly;
		RAISE;
	END;
$$ LANGUAGE plpgsql;


--------------------------------------------------------------
-- 3. receptek tábla megszorításának módosítása
-- A receptek a legmagasabb szintű tábla a függőségi láncban.
--------------------------------------------------------------

-- recept_osztalyokreceptek
DO $$
	BEGIN
		RAISE NOTICE 'Módosítom a "receptek" tábla "recept_osztalyokreceptek" megszorítását.';
		SAVEPOINT modify_receptek_fk_recept_osztalyok;

		EXECUTE 'ALTER TABLE receptek DROP CONSTRAINT recept_osztalyokreceptek';
		EXECUTE 'ALTER TABLE receptek ADD CONSTRAINT recept_osztalyokreceptek FOREIGN KEY
		("recept_osztaly_id") REFERENCES recept_osztalyok("recept_osztaly_id") ON DELETE RESTRICT';

		RAISE NOTICE 'A "recept_osztalyokreceptek" megszorítás módosítva.';
		RELEASE SAVEPOINT modify_receptek_fk_recept_osztalyok;
	      EXCEPTION
		WHEN OTHERS THEN
		RAISE NOTICE 'HIBA történt a "recept_osztalyokreceptek" megszorítás módosítása során.
		Visszaállítás a mentési pontra.';
		ROLLBACK TO modify_receptek_fk_recept_osztalyok;
		RAISE;
	END;
$$ LANGUAGE plpgsql;

-- Végleges üzenet a tranzakció végén
\echo '--Minden FOREIGN KEY megszorítás módosítása sikeresen befejeződött ON DELETE RESTRICT-re! --';

-- Ez a rész NEM része a DO blokknak, a külső tranzakció kezeli.
-- Ha minden DO blokk hiba nélkül lefutott:
COMMIT;
-- Ha valami kritikus hiba történt az egész folyamat során:
ROLLBACK TO full_rollback_point;
ROLLBACK;


