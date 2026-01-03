CREATE OR REPLACE PROCEDURE MassFillReceptOsszetevokWithLogAndSorszam()
LANGUAGE plpgsql
AS $$
DECLARE
    osszetevo_columns TEXT[] := ARRAY[
        'alaplé', 'zsíradék', 'hús', 'zöldség', 'tejtermék', 'gabonaféle', 'szárazáru', 'állati_termék',
        'gyümölcs', 'fűszer', 'magvak', 'feldolgozott_élelmiszer', 'pékáru', 'ital', 'konzervtermék',
        'édességek', 'kész_szósz', 'fűszernövény', 'kész_krém'
    ];
    sorszam_columns TEXT[] := ARRAY[
        'alaplé_sorszám', 'zsíradék_sorszám', 'hús_sorszám', 'zöldség_sorszám', 'tejtermék_sorszám', 'gabonaféle_sorszám', 'szárazáru_sorszám', 'állati_termék_sorszám',
        'gyümölcs_sorszám', 'fűszer_sorszám', 'magvak_sorszám', 'feldolgozott_élelmiszer_sorszám', 'pékáru_sorszám', 'ital_sorszám', 'konzervtermék_sorszám',
        'édességek_sorszám', 'kész_szósz_sorszám', 'fűszernövény_sorszám', 'kész_krém_sorszám'
    ];
    idx INT;
    col TEXT;
    sorsz_col TEXT;
    rec RECORD;
    p_osszetevo_id INT;
    p_sorszam INT;
BEGIN
    FOR idx IN 1 .. array_length(osszetevo_columns,1) LOOP
        col := osszetevo_columns[idx];
        sorsz_col := sorszam_columns[idx];

        FOR rec IN EXECUTE format(
            'SELECT receptid, %1$I AS ertek, %2$I AS sorszam FROM receptek WHERE %1$I IS NOT NULL', col, sorsz_col
        ) LOOP

            SELECT osszetevo_id
              INTO p_osszetevo_id
              FROM osszetevok
             WHERE lower(trim(osszetevo_nev)) = lower(trim(rec.ertek));

            p_sorszam := rec.sorszam;

            IF p_osszetevo_id IS NOT NULL AND p_sorszam IS NOT NULL THEN
                BEGIN
                    INSERT INTO recept_osszetevok (receptid, osszetevo_id, recept_sorszam)
                    SELECT rec.receptid, p_osszetevo_id, p_sorszam
                    WHERE NOT EXISTS (
                        SELECT 1 FROM recept_osszetevok
                        WHERE receptid = rec.receptid AND osszetevo_id = p_osszetevo_id AND recept_sorszam = p_sorszam
                    );
                    RAISE NOTICE 'Sikeres beszúrás: receptid=%, oszlop=%, érték=%, sorszám=%', rec.receptid, col, rec.ertek, p_sorszam;
                EXCEPTION WHEN others THEN
                    INSERT INTO recept_osszetevo_log (receptid, oszlop, ertek, hiba_szoveg)
                    VALUES (rec.receptid, col, rec.ertek, 'INSERT_ERROR: ' || SQLERRM);
                    RAISE NOTICE 'INSERT_ERROR: %', SQLERRM;
                END;
            ELSE
                INSERT INTO recept_osszetevo_log (receptid, oszlop, ertek, hiba_szoveg)
                VALUES (rec.receptid, col, rec.ertek, 'Nincs ilyen összetevő vagy sorszám az osszetevok táblában');
                RAISE NOTICE 'Nem talált összetevő vagy sorszám: receptid=%, oszlop=%, érték=%, sorszám=%', rec.receptid, col, rec.ertek, p_sorszam;
            END IF;

        END LOOP;
    END LOOP;

    RAISE NOTICE 'Feltöltés vége!';
END;
$$;
