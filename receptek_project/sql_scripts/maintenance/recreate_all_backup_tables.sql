DO $$
BEGIN
    -- DROP IF EXISTS minden backup táblára
    DROP TABLE IF EXISTS recept_összetevők_backup CASCADE;
    DROP TABLE IF EXISTS receptek_backup CASCADE;
    DROP TABLE IF EXISTS recept_osztályok_backup CASCADE;
    DROP TABLE IF EXISTS összetevők_backup CASCADE;
    DROP TABLE IF EXISTS összetevők_osztály_backup CASCADE;
    DROP TABLE IF EXISTS mértékek_backup CASCADE;

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

    -- 2. recept_összetevők_backup
    CREATE TABLE recept_összetevők_backup (
        receptid integer NOT NULL,
        osszetevoid integer NOT NULL,
        mennyiseg numeric(10,2) NOT NULL,
        mertekegyseg text,
        recept_osztály_id integer,
        mérték_mennyiség_id integer,
        összetevő_osztály_id integer,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT recept_összetevők_backup_pkey PRIMARY KEY (receptid, osszetevoid),
        CONSTRAINT recept_összetevők_backup_receptid_fkey FOREIGN KEY (receptid)
            REFERENCES receptek(receptid) ON DELETE CASCADE,
        CONSTRAINT recept_összetevők_backup_osszetevoid_fkey FOREIGN KEY (osszetevoid)
            REFERENCES összetevők(osszetevoid) ON DELETE CASCADE,
        CONSTRAINT recept_összetevők_backup_recept_osztály_id_fkey FOREIGN KEY (recept_osztály_id)
            REFERENCES recept_osztályok(recept_osztály_id) ON DELETE CASCADE,
        CONSTRAINT recept_összetevők_backup_mérték_mennyiség_id_fkey FOREIGN KEY (mérték_mennyiség_id)
            REFERENCES mértékek(mérték_mennyiség_id) ON DELETE CASCADE,
        CONSTRAINT recept_összetevők_backup_összetevő_osztály_id_fkey FOREIGN KEY (összetevő_osztály_id)
            REFERENCES összetevők_osztály(összetevő_osztály_id) ON DELETE CASCADE
    );

    -- 3. recept_osztályok_backup
    CREATE TABLE recept_osztályok_backup (
        original_id integer NOT NULL,
        recept_osztály_név character varying(50) NOT NULL,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT recept_osztályok_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT recept_osztályok_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES recept_osztályok(recept_osztály_id) ON DELETE CASCADE
    );

    -- 4. összetevők_backup
    CREATE TABLE összetevők_backup (
        original_id integer NOT NULL,
        nev text NOT NULL,
        osztaly_id integer,
        összetevő_osztály_id integer,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT összetevők_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT összetevők_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES összetevők(osszetevoid) ON DELETE CASCADE,
        CONSTRAINT összetevők_backup_összetevő_osztály_id_fkey FOREIGN KEY (összetevő_osztály_id)
            REFERENCES összetevők_osztály(összetevő_osztály_id) ON DELETE CASCADE
    );

    -- 5. összetevők_osztály_backup
    CREATE TABLE összetevők_osztály_backup (
        original_id integer NOT NULL,
        összetevő_osztály_leírás character varying(30) NOT NULL,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT összetevők_osztály_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT összetevők_osztály_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES összetevők_osztály(összetevő_osztály_id) ON DELETE CASCADE
    );

    -- 6. mértékek_backup
    CREATE TABLE mértékek_backup (
        original_id integer NOT NULL,
        mérés_leírás character varying(30) NOT NULL,
        backup_datum timestamp without time zone NOT NULL DEFAULT now(),
        CONSTRAINT mértékek_backup_pkey PRIMARY KEY (original_id),
        CONSTRAINT mértékek_backup_original_id_fkey FOREIGN KEY (original_id)
            REFERENCES mértékek(mérték_mennyiség_id) ON DELETE CASCADE
    );

    RAISE NOTICE '✅ Backup táblák újra lettek hozva sikeresen.';
END;
$$ LANGUAGE plpgsql;

