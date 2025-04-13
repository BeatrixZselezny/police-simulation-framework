CREATE OR REPLACE FUNCTION InteractiveRecipeMultiUploader(
    receptid TEXT,
    recept_sorszám TEXT,
    összetevő_id TEXT,
    mennyiség TEXT,
    mérték_mennyiség_id TEXT,
    összetevő_osztály_id TEXT,
    recept_osztály_id TEXT
) RETURNS VOID AS $$
BEGIN
    -- Ellenőrizzük a tömbhosszokat
    IF array_length(string_to_array(replace(receptid, ' ', ''), ','), 1) IS DISTINCT FROM array_length(string_to_array(replace(recept_sorszám, ' ', ''), ','), 1) THEN
        RAISE EXCEPTION 'Hiba: Az oszlopok tömbjeinek hosszúsága nem egyezik!';
    END IF;

    -- Konvertálás és beszúrás
    WITH data AS (
        SELECT
            UNNEST(string_to_array(replace(receptid, ' ', ''), ',')::int[]) AS rec_id,
            UNNEST(string_to_array(replace(recept_sorszám, ' ', ''), ',')::int[]) AS rec_no,
            UNNEST(string_to_array(replace(összetevő_id, ' ', ''), ',')::int[]) AS össz_id,
            UNNEST(string_to_array(replace(mennyiség, ' ', ''), ',')::int[]) AS menny,
            UNNEST(string_to_array(replace(mérték_mennyiség_id, ' ', ''), ',')::int[]) AS mért_menny_id,
            UNNEST(string_to_array(replace(összetevő_osztály_id, ' ', ''), ',')::int[]) AS össz_oszt_id,
            UNNEST(string_to_array(replace(recept_osztály_id, ' ', ''), ',')::int[]) AS rec_oszt_id
    )
    INSERT INTO recept_összetevők (receptid, recept_sorszám, összetevő_id, mennyiség, mérték_mennyiség_id, összetevő_osztály_id, recept_osztály_id)
    SELECT rec_id, rec_no, össz_id, menny, mért_menny_id, össz_oszt_id, rec_oszt_id
    FROM data;

    RAISE NOTICE 'A rekordok sikeresen beszúrásra kerültek!';
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Hiba történt! Ellenőrizd az adatokat.';
        RAISE EXCEPTION 'Nem várt hiba történt a rekordok beszúrása során.';
END;
$$ LANGUAGE plpgsql;

