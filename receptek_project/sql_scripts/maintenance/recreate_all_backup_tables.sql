DO $$
BEGIN
    -- DROP IF EXISTS minden backup táblára
    DROP TABLE IF EXISTS recept_osszetevok_backup CASCADE;
    DROP TABLE IF EXISTS receptek_backup CASCADE;
    DROP TABLE IF EXISTS recept_osztalyok_backup CASCADE;
    DROP TABLE IF EXISTS osszetevok_backup CASCADE;
    DROP TABLE IF EXISTS osszetevok_osztaly_backup CASCADE;
    DROP TABLE IF EXISTS mertekek_backup CASCADE;

    -- 1. receptek_backup
    CREATE TABLE receptek_backup (
        original_id integer NOT NULL,
        nev text NOT NULL,
        leiras text,
        letrehozas_datum timestamp without time zone,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT receptek_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT receptek_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES receptek(receptid) ON DELETE CASCADE
    );

    -- 2. recept_osszetevok_backup
    CREATE TABLE recept_osszetevok_backup (
        receptid integer NOT NULL,
        osszetevoid integer NOT NULL,
        mennyiseg numeric(10,2) NOT NULL,
        mertekegyseg text,
        recept_osztaly_id integer,
        mertek_mennyiseg_id integer,
        osszetevo_osztaly_id integer,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT recept_osszetevok_backup_pkey PRIMARY KEY (receptid, osszetevoid),
        CONSTRAINT recept_osszetevok_backup_receptid_fkey FOREIGN KEY (receptid)
            REFERENCES receptek(receptid) ON DELETE CASCADE,
        CONSTRAINT recept_osszetevok_backup_osszetevoid_fkey FOREIGN KEY (osszetevoid)
            REFERENCES osszetevok(osszetevoid) ON DELETE CASCADE,
        CONSTRAINT recept_osszetevok_backup_recept_osztaly_id_fkey FOREIGN KEY (recept_osztaly_id)
            REFERENCES recept_osztalyok(recept_osztaly_id) ON DELETE CASCADE,
        CONSTRAINT recept_osszetevok_backup_mertek_mennyiseg_id_fkey FOREIGN KEY (mertek_mennyiseg_id)
            REFERENCES mertekek(mertek_mennyiseg_id) ON DELETE CASCADE,
        CONSTRAINT recept_osszetevok_backup_osszetevo_osztaly_id_fkey FOREIGN KEY (osszetevo_osztaly_id)
            REFERENCES osszetevok_osztaly(osszetevo_osztaly_id) ON DELETE CASCADE
    );

    -- 3. recept_osztalyok_backup
    CREATE TABLE recept_osztalyok_backup (
        original_id integer NOT NULL,
        recept_osztály_név character varying(50) NOT NULL,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT recept_osztalyok_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT recept_osztalyok_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES recept_osztalyok(recept_osztaly_id) ON DELETE CASCADE
    );

    -- 4. osszetevok_backup
    CREATE TABLE osszetevok_backup (
        original_id integer NOT NULL,
        nev text NOT NULL,
        osztaly_id integer,
        osszetevo_osztaly_id integer,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT osszetevok_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT osszetevok_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES osszetevok(osszetevoid) ON DELETE CASCADE,
        CONSTRAINT osszetevok_backup_osszetevo_osztaly_id_fkey FOREIGN KEY (osszetevo_osztaly_id)
            REFERENCES osszetevok_osztaly(osszetevo_osztaly_id) ON DELETE CASCADE
    );

    -- 5. osszetevok_osztaly_backup
    CREATE TABLE osszetevok_osztaly_backup (
        original_id integer NOT NULL,
        összetevő_osztály_leírás character varying(30) NOT NULL,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT osszetevok_osztaly_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT osszetevok_osztaly_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES osszetevok_osztaly(osszetevo_osztaly_id) ON DELETE CASCADE
    );

    -- 6. mertekek_backup
    CREATE TABLE mertekek_backup (
        original_id integer NOT NULL,
        meres_leiras character varying(30) NOT NULL,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT mertekek_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT mertekek_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES mertekek(mertek_mennyiseg_id) ON DELETE CASCADE
    );

    RAISE NOTICE '✅ Backup táblák újra lettek hozva sikeresen.';
END;
$$ LANGUAGE plpgsql;

