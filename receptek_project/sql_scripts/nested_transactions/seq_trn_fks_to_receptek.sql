-- fk_recept_osztály_id
BEGIN;
	\echo '-- Elindul a FOREIGN KEY megszorítások módosítása ON DELETE RESTRICT-re --';
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

	SAVEPOINT fk_recept_osztály_id;
	BEGIN
		RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_recept_osztály_id" megszorítását';
		ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_osztály_id";
		ALTER TABLE recept_összetevők ADD CONSTRAINT fk_recept_osztaly_id FOREIGN KEY (recept_osztály_id) REFERENCES recept_osztályok(recept_osztály_id) ON DELETE RESTRICT;
		RAISE NOTICE 'A "recept_összetevők" tábla "fk_recept_osztály_id" megszorítása módosítva.';
		EXCEPTION
			WHEN OTHERS THEN
				RAISE NOTICE '"fk_recept_osztály_id" constraint hiba, visszagörgetés.';
				ROLLBACK TO SAVEPOINT fk_recept_osztaly_id;
			END;



-- fk_recept_összetevők_mértékek

			SAVEPOINT fk_recept_osszetevok_mertekek;
			RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_recept_összetevők_mértékek" megszorítását.';
			ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_összetevők_mértékek";
			ALTER TABLE recept_összetevők ADD CONSTRAINT fk_recept_osszetevok_mertekek FOREIGN KEY (mérték_mennyiség_id) REFERENCES mértékek(mérték_mennyiség_id) ON DELETE RESTRICT;
			RAISE NOTICE 'A "fk_recept_összetevők_mértékek" megszorítása módosítva.';
			EXCEPTION
				WHEN OTHERS THEN
					RAISE NOTICE '"fk_recept_osztály_id" constraint hiba, visszagörgetés.';
					ROLLBACK TO SAVEPOINT fk_recept_osszetevok_mertekek;
				END;



-- fk_receptek_recept_összetevők

				SAVEPOINT fk_receptek_recept_osszetevok;
				RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_receptek_recept_összetevők" megszorítását.';
				ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_receptek_recept_összetevők";
				ALTER TABLE recept_összetevők ADD CONSTRAINT fk_receptek_recept_osszetevok FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE RESTRICT;
				RAISE NOTICE 'A "fk_receptek_recept_összetevők" megszorítása módosítva.';
				EXCEPTION
					WHEN OTHERS THEN
						RAISE NOTICE '"fk_receptek_recept_összetevők" constraint hiba, visszagörgetés.';
						ROLLBACK TO SAVEPOINT fk_receptek_recept_osszetevok;
					END;


					
-- fk_összetevők_osztály_id
					

					SAVEPOINT fk_osszetevok_osztaly_id;
					RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_összetevők_osztály_id" megszorítását.';
					ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_osztály_id";
					ALTER TABLE recept_összetevők ADD CONSTRAINT fk_osszetevok_osztaly_id FOREIGN KEY (összetevő_osztály_id) REFERENCES összetevők_osztály (összetevő_osztály_id) ON DELETE RESTRICT;
					RAISE NOTICE 'A "fk_összetevők_osztály_id" megszorítása módosítva.';
					EXCEPTION
						WHEN OTHERS THEN
							RAISE NOTICE '"fk_összetevők_osztály_id" constraint hiba, visszagörgetés.';
							ROLLBACK TO SAVEPOINT fk_osszetevok_osztaly_id;
						END;



-- fk_összetevők_recept_összetevők						

						SAVEPOINT fk_osszetevok_recept_osszetevok;
						RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_összetevők_recept_összetevők" megszorítását.';
						ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_recept_összetevők";
						ALTER TABLE recept_összetevők ADD CONSTRAINT fk_osszetevok_recept_osszetevok FOREIGN KEY (összetevő_id) REFERENCES összetevők (összetevő_id) ON DELETE RESTRICT;
						RAISE NOTICE 'A "fk_összetevők_recept_összetevők" megszorítása módosítva.';
						EXCEPTION
							WHEN OTHERS THEN
								RAISE NOTICE '"fk_összetevők_recept_összetevők" constraint hiba, visszagörgetés.';
								ROLLBACK TO SAVEPOINT fk_osszetevok_recept_osszetevok;
							END;



----------------------------------------------------------------------------------------------------
-- 2. összetevők tábla megszorításának módosítása
-- Az összetevők a következő szint, miután a recept_összetevőkön belüli rámutató FK-kat módosítottuk.
-----------------------------------------------------------------------------------------------------							
-- mértékekÖsszetevők



							SAVEPOINT fk_osszetevok_mertekek;
							RAISE NOTICE 'Módosítom az "összetevők" tábla "mértékekÖsszetevők" megszorítását';

							ALTER TABLE összetevők DROP CONSTRAINT "mértékekÖsszetevők";
							ALTER TABLE összetevők ADD CONSTRAINT fk_osszetevok_mertekek FOREIGN KEY (mérték_mennyiség_id) REFERENCES mértékek (mérték_mennyiség_id) ON DELETE RESTRICT;
							RAISE NOTICE 'A "mértékekÖsszetevők" megszorítása módosítva.';
							EXCEPTION
								WHEN OTHERS THEN
									RAISE NOTICE '"mértékekÖsszetevők" constraint hiba, visszagörgetés.';
									ROLLBACK TO SAVEPOINT fk_osszetevok_mertekek;
								END;


-- Összetevő_osztályokÖsszetevők								



								SAVEPOINT fk_osszetevok_osszetevo_osztalyok;
								RAISE NOTICE 'Módosítom az "összetevő_osztályokÖsszetevők" megszorítását.';

								ALTER TABLE összetevők DROP CONSTRAINT "összetevő_osztályokÖsszetevők" FOREIGN KEY (összetevő_osztály_id) REFERENCES összetevők_osztály (összetevő_osztály_id) ON DELETE RESTRICT;
								RAISE NOTICE 'Az "összetevő_osztályokÖsszetevők" megszorítása módosítva.';
								EXCEPTION
									WHEN OTHERS THEN
										RAISE NOTICE '"összetevő_osztályokÖsszetevők" constraint hiba, visszagörgetés.';
										ROLLBACK TO SAVEPOINT fk_osszetevok_osszetevo_osztályok;
									END;



									










