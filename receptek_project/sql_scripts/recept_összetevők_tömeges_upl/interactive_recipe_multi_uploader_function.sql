CREATE OR REPLACE FUNCTION InteractiveRecipeMultiUploader(
    receptid TEXT,
    recept_sorszam TEXT,
    osszetevo_id TEXT,
    mennyiség TEXT,
    mertek_mennyiseg_id TEXT,
    osszetevo_osztaly_id TEXT,
    recept_osztaly_id TEXT
) RETURNS VOID AS $$
BEGIN
    -- Ellenőrizzük a tömbhosszokat
    IF array_length(string_to_array(replace(receptid, ' ', ''), ','), 1) IS DISTINCT FROM array_length(string_to_array(replace(recept_sorszam, ' ', ''), ','), 1) THEN
        RAISE EXCEPTION 'Hiba: Az oszlopok tömbjeinek hosszúsága nem egyezik!';
    END IF;

    -- Konvertálás és beszúrás
    WITH data AS (
        SELECT
            UNNEST(string_to_array(replace(receptid, ' ', ''), ',')::int[]) AS rec_id,
            UNNEST(string_to_array(replace(recept_sorszam, ' ', ''), ',')::int[]) AS rec_no,
            UNNEST(string_to_array(replace(osszetevo_id, ' ', ''), ',')::int[]) AS össz_id,
            UNNEST(string_to_array(replace(mennyiség, ' ', ''), ',')::int[]) AS menny,
            UNNEST(string_to_array(replace(mertek_mennyiseg_id, ' ', ''), ',')::int[]) AS mért_menny_id,
            UNNEST(string_to_array(replace(osszetevo_osztaly_id, ' ', ''), ',')::int[]) AS össz_oszt_id,
            UNNEST(string_to_array(replace(recept_osztaly_id, ' ', ''), ',')::int[]) AS rec_oszt_id
    )
    INSERT INTO recept_osszetevok (receptid, recept_sorszam, osszetevo_id, mennyiség, mertek_mennyiseg_id, osszetevo_osztaly_id, recept_osztaly_id)
    SELECT rec_id, rec_no, össz_id, menny, mért_menny_id, össz_oszt_id, rec_oszt_id
    FROM data;

    RAISE NOTICE 'A rekordok sikeresen beszúrásra kerültek!';
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Hiba történt! Ellenőrizd az adatokat.';
        RAISE EXCEPTION 'Nem várt hiba történt a rekordok beszúrása során.';
END;
$$ LANGUAGE plpgsql;

