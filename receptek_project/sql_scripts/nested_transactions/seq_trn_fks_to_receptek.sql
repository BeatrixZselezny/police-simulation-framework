DO $$
	BEGIN
		RAISE NOTICE '--Elindul a FOREIGN KEY megszorítások módosítása ON DELETE RESTRICT-re--';
		SET TRANSECTION ISOLATION LEVEL READ COMMITTED;



		BEGIN
			SAVEPOINT sp_fk_recept_osztaly_id;
			RAISE NOTICE '"Módosítom a "recept_osszetevok" tábla "fk_recept_osztaly_id" megszorítását.';

			ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osztaly_id";
			ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_recept_osztaly_id FOREIGN KEY (recept_osztaly_id) REFERENCES recept_osztalyok(recept_osztály_is) ON DELETE RESTRICT;
			RAISE NOTICE 'A "recept_osszetevok" tábla "fk_recept_osztaly_id" megszorítása módosítva.';
			EXCEPTION
				WHEN OTHERS THEN
					RAISE EXCEPTION 'Hiba történt az "fk_recept_osztaly_id" megszorítás módosítása során: %', SQLERRM;
			END;


			BEGIN
				SAVEPOINT sp_fk_recept_osszetevok_mertekek;
				RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_recept_osszetevok_mertekek" megszorítását.';

				ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_recept_osszetevok_mertekek";
				ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_recept_osszetevok_mertekek ROREIGN KEY (mertek_mennyiseg_id) REFERENCES mertekek(mertek_mennyiseg_id) ON DELETE RESTRICT;
				RAISE NOTICE 'A "fk_osszetevok_mertekek" megszorítása módosítva.';
				EXCEPTION
					WHEN OTHERS THEN
						RAISE EXCEPTION 'Hiba történt az "fk_receptek_recept_osszetevok" megszorítás módosítása során: %', SQLERRM;
					END;


					BEGIN
						SAVEPOINT sp_fk_receptek_recept_osszetevok;
						RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_receptek_recept_osszetevok" megszorítását.';

						ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_receptek_recept_osszetevok";
						ALTER TABLE recept_osszetevok ADD CONSTRAINT "fk_receptek_recept_osszetevok" FOREIGN KEY (receptid) REFERENCES receptek(receptid) ON DELETE CASCADE;
						RAISE NOTICE 'A "fk_receptek_recept_osszetevok" megszorítás módosítva.';
						EXCEPTION
							WHEN OTHERS THEN
								RAISE EXCEPTION 'Hiba történt az "fk_receptek_recept_osszetevok" megszorítás módosítása során: %', SQLERRM;
							END;


							BEGIN
								SAVEPOINT sp_fk_osszetevok_osztaly_id;
								RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_osszetevok_osztaly_id" megszorítását.';

								ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_osszetevok_osztaly_id";
								ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_osszetevok_osztaly_id FOREIGN KEY (osszetevok_osztaly_id) REFERENCES osszetevok_osztaly(osszetevo_osztaly_id) ON DELETE RESTRICT;
								RAISE NOTICE 'A "fk_osszetevok_osztaly_id" megszorítás módosítva.';
								EXCEPTION
									WHEN OTHERS THEN
										RAISE EXCEPTION 'Hiba történt az "fk_osszetevok_osztaly_id" megszorítás módosítása során: %', SQLERRM;
							END;


							BEGIN
								SAVEPOINT sp_fk_osszetevok_recept_osszetevok;
								RAISE NOTICE 'Módosítom a "recept_osszetevok" tábla "fk_osszetevok_recept_osszetevok" megszorítását.';

								ALTER TABLE recept_osszetevok DROP CONSTRAINT "fk_osszetevok_recept_osszetevok";
								ALTER TABLE recept_osszetevok ADD CONSTRAINT fk_osszetevok_recept_osszetevok FOREIGN KEY (osszetevo_id) REFERENCES osszetevok (osszetevo_id) ON DELETE RESTRICT;
								RAISE NOTICE 'A "fk_osszetevok_recept_osszetevok" megszorítás módosítva.';
								EXCEPTION
									WHEN OTHERS THEN
										RAISE EXCEPTION 'Hiba történt az "fk_osszetevok_recept_osszetevok" megszorítás módosítása során: %', SQLERRM;
									END;




									BEGIN
										SAVEPOINT sp_osszetevok_mertekek;
										RAISE NOTICE 'Módosítom az "osszetevok" tábla "mertekekÖsszetevők" megszorítását.';
										ALTER TABLE osszetevok DROP CONSTRAINT "mertekekÖsszetevők";
										ALTER TABLE osszetevok ADD CONSTRAINT fk_osszetevok_mertekek FOREIGN KEY (mertek_mennyiseg_id) REFERENCES mertekek (mertek_mennyiseg_id) ON DELETE RESTRICT;
										RAISE NOTICE 'A "mertekekÖsszetevők" megszorítás módosítva.';
										EXCEPTION
											WHEN OTHERS THEN
												RAISE EXCEPTION 'Hiba történt a "mertekekÖsszetevők" megszorítás módosítása során: %', SQLERRM;
											END;


											BEGIN
												SAVEPOINT sp_fk_osszetevok_osszetevo_osztalyok;
												RAISE NOTICE 'Módosítom az "összetevő_osztályokÖsszetevők" megszorítását.';

												ALTER TABLE osszetevok DROP CONSTRAINT "összetevő_osztályokÖsszetevők";
												ALTER TABLE osszetevok ADD CONSTRAINT fk_osszetevok_osszetevo_osztalyok FOREIGN KEY (osszetevo_osztaly_id) REFERENCES osszetevok_osztaly (osszetevo_osztaly_id) ON DELETE RESTRICT;
												RAISE NOTICE 'Az "összetevő_osztályokÖsszetevők" megszorítás módosítva.';
												EXCEPTION
													WHEN OTHERS THEN
														RAISE EXCEPTION 'Hibe történt az "összetevő_osztályokÖsszetevők" megszorítás módosítása során: %', SQLERRM;
													END;



													BEGIN
														SAVEPOINT sp_fk_recept_osztalyok_receptek;
														RAISE NOTICE 'Módosítom a "recept_osztalyokreceptek" megszorítást.';
														ALTER TABLE receptek DROP CONSTRAINT "recept_osztalyokreceptek";
														ALTER TABLE receptek ADD CONSTRAINT fk_recept_osztalyok_receptek FOREIGN KEY (recept_osztaly_id) REFERENCES recept_osztalyok (recept_osztaly_id) ON DELETE RESTRICT;
														RAISE NOTICE 'A "recept_osztalyokreceptek" megszorítás módosítva.';













