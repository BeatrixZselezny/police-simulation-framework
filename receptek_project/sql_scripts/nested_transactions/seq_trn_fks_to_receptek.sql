DO $$
	BEGIN
		RAISE NOTICE '--Elindul a FOREIGN KEY megszorítások módosítása ON DELETE RESTRICT-re--';
		SET TRANSECTION ISOLATION LEVEL READ COMMITTED;



		BEGIN
			SAVEPOINT sp_fk_recept_osztaly_id;
			RAISE NOTICE '"Módosítom a "recept_összetevők" tábla "fk_recept_osztály_id" megszorítását.';

			ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_osztály_id";
			ALTER TABLE recept_összetevők ADD CONSTRAINT fk_recept_osztaly_id FOREIGN KEY (recept_osztály_id) REFERENCES recept_osztályok(recept_osztály_is) ON DELETE RESTRICT;
			RAISE NOTICE 'A "recept_összetevők" tábla "fk_recept_osztály_id" megszorítása módosítva.';
			EXCEPTION
				WHEN OTHERS THEN
					RAISE EXCEPTION 'Hiba történt az "fk_recept_osztály_id" megszorítás módosítása során: %', SQLERRM;
			END;


			BEGIN
				SAVEPOINT sp_fk_recept_osszetevok_mertekek;
				RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_recept_összetevők_mértékek" megszorítását.';

				ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_recept_összetevők_mértékek";
				ALTER TABLE recept_összetevők ADD CONSTRAINT fk_recept_osszetevok_mertekek ROREIGN KEY (mérték_mennyiség_id) REFERENCES mértékek(mérték_mennyiség_id) ON DELETE RESTRICT;
				RAISE NOTICE 'A "fk_összetevők_mértékek" megszorítása módosítva.';
				EXCEPTION
					WHEN OTHERS THEN
						RAISE EXCEPTION 'Hiba történt az "fk_receptek_recept_összetevők" megszorítás módosítása során: %', SQLERRM;
					END;


					BEGIN
						SAVEPOINT sp_fk_receptek_recept_osszetevok;
						RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_receptek_recept_összetevők" megszorítását.';

						ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_receptek_recept_összetevők";
						ALTER TABLE recept_összetevők ADD CONSTRAINT "fk_receptek_recept_osszetevok" FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE CASCADE;
						RAISE NOTICE 'A "fk_receptek_recept_összetevők" megszorítás módosítva.';
						EXCEPTION
							WHEN OTHERS THEN
								RAISE EXCEPTION 'Hiba történt az "fk_receptek_recept_összetevők" megszorítás módosítása során: %', SQLERRM;
							END;


							BEGIN
								SAVEPOINT sp_fk_osszetevok_osztaly_id;
								RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_összetevők_osztály_id" megszorítását.';

								ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_osztály_id";
								ALTER TABLE recept_összetevők ADD CONSTRAINT fk_osszetevok_osztaly_id FOREIGN KEY (összetevők_osztály_id) REFERENCES összetevők_osztály(összetevő_osztály_id) ON DELETE RESTRICT;
								RAISE NOTICE 'A "fk_összetevők_osztály_id" megszorítás módosítva.';
								EXCEPTION
									WHEN OTHERS THEN
										RAISE EXCEPTION 'Hiba történt az "fk_összetevők_osztály_id" megszorítás módosítása során: %', SQLERRM;
							END;


							BEGIN
								SAVEPOINT sp_fk_osszetevok_recept_osszetevok;
								RAISE NOTICE 'Módosítom a "recept_összetevők" tábla "fk_összetevők_recept_összetevők" megszorítását.';

								ALTER TABLE recept_összetevők DROP CONSTRAINT "fk_összetevők_recept_összetevők";
								ALTER TABLE recept_összetevők ADD CONSTRAINT fk_osszetevok_recept_osszetevok FOREIGN KEY (összetevő_id) REFERENCES összetevők (összetevő_id) ON DELETE RESTRICT;
								RAISE NOTICE 'A "fk_összetevők_recept_összetevők" megszorítás módosítva.';
								EXCEPTION
									WHEN OTHERS THEN
										RAISE EXCEPTION 'Hiba történt az "fk_összetevők_recept_összetevők" megszorítás módosítása során: %', SQLERRM;
									END;




									BEGIN
										SAVEPOINT sp_osszetevok_mertekek;
										RAISE NOTICE 'Módosítom az "összetevők" tábla "mértékekÖsszetevők" megszorítását.';
										ALTER TABLE összetevők DROP CONSTRAINT "mértékekÖsszetevők";
										ALTER TABLE összetevők ADD CONSTRAINT fk_osszetevok_mertekek FOREIGN KEY (mérték_mennyiség_id) REFERENCES mértékek (mérték_mennyiség_id) ON DELETE RESTRICT;
										RAISE NOTICE 'A "mértékekÖsszetevők" megszorítás módosítva.';
										EXCEPTION
											WHEN OTHERS THEN
												RAISE EXCEPTION 'Hiba történt a "mértékekÖsszetevők" megszorítás módosítása során: %', SQLERRM;
											END;


											BEGIN
												SAVEPOINT sp_fk_osszetevok_osszetevo_osztalyok;
												RAISE NOTICE 'Módosítom az "összetevő_osztályokÖsszetevők" megszorítását.';

												ALTER TABLE összetevők DROP CONSTRAINT "összetevő_osztályokÖsszetevők";
												ALTER TABLE összetevők ADD CONSTRAINT fk_osszetevok_osszetevo_osztalyok FOREIGN KEY (összetevő_osztály_id) REFERENCES összetevők_osztály (összetevő_osztály_id) ON DELETE RESTRICT;
												RAISE NOTICE 'Az "összetevő_osztályokÖsszetevők" megszorítás módosítva.';
												EXCEPTION
													WHEN OTHERS THEN
														RAISE EXCEPTION 'Hibe történt az "összetevő_osztályokÖsszetevők" megszorítás módosítása során: %', SQLERRM;
													END;



													BEGIN
														SAVEPOINT sp_fk_recept_osztalyok_receptek;
														RAISE NOTICE 'Módosítom a "recept_osztályokreceptek" megszorítást.';
														ALTER TABLE receptek DROP CONSTRAINT "recept_osztályokreceptek";
														ALTER TABLE receptek ADD CONSTRAINT fk_recept_osztalyok_receptek FOREIGN KEY (recept_osztály_id) REFERENCES recept_osztályok (recept_osztály_id) ON DELETE RESTRICT;
														RAISE NOTICE 'A "recept_osztályokreceptek" megszorítás módosítva.';













