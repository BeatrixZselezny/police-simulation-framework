BEGIN;
	SAVEPOINT sp_backup;
	-- Táblanév lista
DECLARE table_list TEXT[] := ARRAY['recept_osztályok', 'összetevők_osztály', 'receptek', 'összetevők', 'mértékek', 'recept_összetevők'];

	-- Iterálás minden táblára
	FOR i IN ARRAY_LOWER(table_list,1) .. ARRAY_UPPER(table_list,1) LOOP
		BEGIN
			-- Régi backup törlése
                        EXECUTE format('DROP TABLE IF EXISTS public.%I_backup', table_list[i]);

			-- Új backup létrehozása (SELECT INTO-val)
                        EXECUTE format('SELECT * INTO public.%I_backup FROM public.%I', table_list[i], table_list[i]);

			-- Log mentése a backup_log táblába

                        EXECUTE format('INSERT INTO backup_log (table_name, status) VALUES (%L, %L)', table_list[i], 'Sikeres');


		    RAISE NOTICE 'Backup készült: %', table_list[i];
		      EXCEPTION
		        WHEN OTHERS THEN
			  RAISE NOTICE 'Hiba történt a % tábla mentésénél: %', table_list[i], SQLERRM;
			  EXECUTE format('INSERT INTO backup_log (table_name, status) VALUES (%L, %L)', table_list[i], 'Hiba');
			 
			  ROLLBACK TO SAVEPOINT sp_backup;
		        END;	
		      END LOOP;

	              COMMIT;	
