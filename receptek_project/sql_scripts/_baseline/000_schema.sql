--
-- PostgreSQL database dump
--

\restrict RECEPTEKBASELINE

-- Dumped from database version 17.6 (Debian 17.6-0+deb13u1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: interactiverecipeuploader(integer, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.interactiverecipeuploader(receptid integer, "recept_név" character varying, "elkészítés" character varying, jegyzet character varying, "recept_osztály_id" integer, "alaplé" character varying, "zsíradék" character varying, "hús" character varying, "zöldség" character varying, "tejtermék" character varying, "gabonaféle" character varying, "szárazáru" character varying, "állati_termék" character varying, "gyümölcs" character varying, "fűszer" character varying, magvak character varying, "feldolgozott_élelmiszer" character varying, "pékáru" character varying, ital character varying, "konzervtermék" character varying, "édességek" character varying, "kész_szósz" character varying, "fűszernövény" character varying, "kész_krém" character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
      IF EXISTS (SELECT 1 FROM receptek WHERE receptek.receptid = $1)  THEN
         RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
      ELSE
       -- Beszúrunk egy új rekordot
        INSERT INTO receptek (receptid, recept_név, elkészítés, jegyzet, recept_osztály_id, alaplé, zsíradék, hús, zöldség, tejtermék,
 gabonaféle, szárazáru, állati_termék, gyümölcs, fűszer, magvak, feldolgozott_élelmiszer, pékáru, ital, konzervtermék, édességek,
 kész_szósz, fűszernövény, kész_krém)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24);
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_név = %', $1, $2;
     END IF;
        EXCEPTION
     WHEN OTHERS THEN
        -- Hibakezelés
        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
        RAISE EXCEPTION 'Nem várt hiba fordult elő!';
  END;
 $_$;


--
-- Name: massuploadreceptek(); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.massuploadreceptek()
    LANGUAGE plpgsql
    AS $$
DECLARE csv_path TEXT;
BEGIN
    -- Beállítjuk az izolációs szintet
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Fájl elérési útjának lekérése
    SELECT param_value INTO csv_path FROM config WHERE param_name = 'csv_path';

    -- TEMP tábla létrehozása
    DROP TABLE IF EXISTS temp_recept_összetevők;
    CREATE TEMP TABLE temp_recept_összetevők (
       receptid INT,
       recept_sorszám INT,
       összetevő_id INT,
       mennyiség INT,
       mérték_mennyiség_id INT,
       összetevő_osztály_id INT,
       recept_osztály_id INT
    ) ON COMMIT DROP;

    -- COPY utasítás végrehajtása dinamikusan
    EXECUTE format('COPY temp_recept_összetevők FROM %L WITH CSV HEADER', csv_path);

    -- Adatellenőrzés
    IF EXISTS (
       SELECT 1 FROM temp_recept_összetevők
       WHERE receptid IS NULL OR összetevő_id IS NULL OR mennyiség IS NULL OR mennyiség <= 0
    ) THEN
        RAISE EXCEPTION 'Hiba: Az importált adatokban hiányzó vagy érvénytelen értékek találhatók!';
    END IF;

    -- Adatok beszúrása, ha még nem léteznek
    INSERT INTO recept_összetevők (receptid, recept_sorszám, összetevő_id, mennyiség, mérték_mennyiség_id, összetevő_osztály_id, recept_osztály_id)
    SELECT temp.receptid, temp.recept_sorszám, temp.összetevő_id, temp.mennyiség, temp.mérték_mennyiség_id, temp.összetevő_osztály_id, temp.recept_osztály_id
    FROM temp_recept_összetevők temp
    WHERE NOT EXISTS (
       SELECT 1 FROM recept_összetevők r
       WHERE r.receptid = temp.receptid AND r.recept_sorszám = temp.recept_sorszám
    );

    RAISE NOTICE 'Adatok sikeresen importálva!';
END; $$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_ddl_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_ddl_log (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    constraint_nev text NOT NULL,
    muvelet text NOT NULL,
    eredmeny text NOT NULL,
    hibauzenet text,
    user_name text DEFAULT CURRENT_USER NOT NULL
);


--
-- Name: audit_ddl_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audit_ddl_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audit_ddl_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audit_ddl_log_id_seq OWNED BY public.audit_ddl_log.id;


--
-- Name: mértékek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."mértékek" (
    "mérték_mennyiség_id" integer NOT NULL,
    "mérés_leírás" character varying(200) NOT NULL
);


--
-- Name: recept_osztályok; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."recept_osztályok" (
    "recept_osztály_id" integer NOT NULL,
    "recept_osztály_név" character varying(100) NOT NULL
);


--
-- Name: recept_összetevők; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."recept_összetevők" (
    receptid integer NOT NULL,
    "recept_sorszám" integer NOT NULL,
    "összetevő_id" integer,
    "mennyiség" numeric(10,2),
    "mérték_mennyiség_id" integer,
    "összetevő_osztály_id" integer,
    "recept_osztály_id" integer
);


--
-- Name: receptek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.receptek (
    receptid integer NOT NULL,
    "recept_név" character varying(100) NOT NULL,
    "elkészítés" character varying(300) NOT NULL,
    jegyzet character varying(100) NOT NULL,
    "recept_osztály_id" integer,
    "alaplé" character varying(30),
    "zsíradék" character varying(30),
    "hús" character varying(30),
    "zöldség" character varying(30),
    "tejtermék" character varying(30),
    "gabonaféle" character varying(30),
    "szárazáru" character varying(30),
    "állati_termék" character varying(30),
    "gyümölcs" character varying(30),
    "fűszer" character varying(30),
    magvak character varying(30),
    "feldolgozott_élelmiszer" character varying(30),
    "pékáru" character varying(30),
    ital character varying(30),
    "konzervtermék" character varying(30),
    "édességek" character varying(30),
    "kész_szósz" character varying(30),
    "fűszernövény" character varying(30),
    "kész_krém" character varying(30)
);


--
-- Name: összetevők; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."összetevők" (
    "összetevő_id" integer NOT NULL,
    "összetevő_név" character varying(100) NOT NULL,
    "összetevő_osztály_id" integer,
    "mérték_mennyiség_id" integer
);


--
-- Name: összetevők_osztály; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."összetevők_osztály" (
    "összetevő_osztály_id" integer NOT NULL,
    "összetevő_osztály_leírás" character varying(100) NOT NULL
);


--
-- Name: buggy_querry; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.buggy_querry AS
 SELECT r."recept_név",
    r.jegyzet,
    r."elkészítés",
    "ö"."összetevő_név",
    ro."recept_osztály_név",
    "öo"."összetevő_osztály_leírás",
    m."mérés_leírás"
   FROM (((((public.receptek r
     JOIN public."recept_összetevők" "rö" ON (("rö".receptid = r.receptid)))
     JOIN public."összetevők" "ö" ON (("rö"."összetevő_id" = "ö"."összetevő_id")))
     JOIN public."recept_osztályok" ro ON ((r.receptid = ro."recept_osztály_id")))
     JOIN public."összetevők_osztály" "öo" ON ((r.receptid = "ö"."összetevő_osztály_id")))
     JOIN public."mértékek" m ON (("rö"."mérték_mennyiség_id" = m."mérték_mennyiség_id")));


--
-- Name: config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.config (
    param_name text NOT NULL,
    param_value text
);


--
-- Name: mértékek_mérték_mennyiség_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."mértékek_mérték_mennyiség_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mértékek_mérték_mennyiség_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."mértékek_mérték_mennyiség_id_seq" OWNED BY public."mértékek"."mérték_mennyiség_id";


--
-- Name: recept_nézet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."recept_nézet" (
    "recept_név" character varying(100),
    "elkészítés" character varying(300),
    "összetevő_név" character varying(100)
);


--
-- Name: recept_osztályok_recipeclassid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."recept_osztályok_recipeclassid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recept_osztályok_recipeclassid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."recept_osztályok_recipeclassid_seq" OWNED BY public."recept_osztályok"."recept_osztály_id";


--
-- Name: recept_összetevők_receptid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."recept_összetevők_receptid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recept_összetevők_receptid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."recept_összetevők_receptid_seq" OWNED BY public."recept_összetevők".receptid;


--
-- Name: receptek_recipeid_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.receptek_recipeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: receptek_recipeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.receptek_recipeid_seq OWNED BY public.receptek.receptid;


--
-- Name: összetevők_osztály_összetevő_osztály_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."összetevők_osztály_összetevő_osztály_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: összetevők_osztály_összetevő_osztály_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."összetevők_osztály_összetevő_osztály_id_seq" OWNED BY public."összetevők_osztály"."összetevő_osztály_id";


--
-- Name: összetevők_összetevő_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."összetevők_összetevő_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: összetevők_összetevő_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."összetevők_összetevő_id_seq" OWNED BY public."összetevők"."összetevő_id";


--
-- Name: öt_táblás_join_példa; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public."öt_táblás_join_példa" AS
 WITH five_join_exa AS (
         SELECT r."recept_név",
            "ö"."összetevő_név",
            m."mérés_leírás",
            ro."recept_osztály_név",
            "öo"."összetevő_osztály_leírás"
           FROM (((((public.receptek r
             JOIN public."recept_összetevők" "rö" ON ((r.receptid = "rö".receptid)))
             JOIN public."összetevők" "ö" ON (("rö"."összetevő_id" = "ö"."összetevő_id")))
             JOIN public."mértékek" m ON (("rö"."mérték_mennyiség_id" = m."mérték_mennyiség_id")))
             JOIN public."recept_osztályok" ro ON (("rö"."recept_osztály_id" = ro."recept_osztály_id")))
             JOIN public."összetevők_osztály" "öo" ON (("rö"."összetevő_osztály_id" = "öo"."összetevő_osztály_id")))
        )
 SELECT "recept_név",
    "összetevő_név",
    "mérés_leírás",
    "recept_osztály_név",
    "összetevő_osztály_leírás"
   FROM five_join_exa;


--
-- Name: audit_ddl_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_ddl_log ALTER COLUMN id SET DEFAULT nextval('public.audit_ddl_log_id_seq'::regclass);


--
-- Name: mértékek mérték_mennyiség_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."mértékek" ALTER COLUMN "mérték_mennyiség_id" SET DEFAULT nextval('public."mértékek_mérték_mennyiség_id_seq"'::regclass);


--
-- Name: recept_osztályok recept_osztály_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_osztályok" ALTER COLUMN "recept_osztály_id" SET DEFAULT nextval('public."recept_osztályok_recipeclassid_seq"'::regclass);


--
-- Name: recept_összetevők receptid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők" ALTER COLUMN receptid SET DEFAULT nextval('public."recept_összetevők_receptid_seq"'::regclass);


--
-- Name: receptek receptid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receptek ALTER COLUMN receptid SET DEFAULT nextval('public.receptek_recipeid_seq'::regclass);


--
-- Name: összetevők összetevő_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."összetevők" ALTER COLUMN "összetevő_id" SET DEFAULT nextval('public."összetevők_összetevő_id_seq"'::regclass);


--
-- Name: összetevők_osztály összetevő_osztály_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."összetevők_osztály" ALTER COLUMN "összetevő_osztály_id" SET DEFAULT nextval('public."összetevők_osztály_összetevő_osztály_id_seq"'::regclass);


--
-- Name: audit_ddl_log audit_ddl_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_ddl_log
    ADD CONSTRAINT audit_ddl_log_pkey PRIMARY KEY (id);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (param_name);


--
-- Name: mértékek mértékek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."mértékek"
    ADD CONSTRAINT "mértékek_pkey" PRIMARY KEY ("mérték_mennyiség_id");


--
-- Name: recept_osztályok recept_osztályok_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_osztályok"
    ADD CONSTRAINT "recept_osztályok_pkey" PRIMARY KEY ("recept_osztály_id");


--
-- Name: recept_összetevők recept_összetevők_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "recept_összetevők_pkey" PRIMARY KEY (receptid, "recept_sorszám");


--
-- Name: receptek receptek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receptek
    ADD CONSTRAINT receptek_pkey PRIMARY KEY (receptid);


--
-- Name: összetevők_osztály összetevők_osztály_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."összetevők_osztály"
    ADD CONSTRAINT "összetevők_osztály_pkey" PRIMARY KEY ("összetevő_osztály_id");


--
-- Name: összetevők összetevők_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT "összetevők_pkey" PRIMARY KEY ("összetevő_id");


--
-- Name: audit_ddl_log_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX audit_ddl_log_created_at_idx ON public.audit_ddl_log USING btree (created_at);


--
-- Name: összetevők fk_mertekek_osszetevok; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT fk_mertekek_osszetevok FOREIGN KEY ("mérték_mennyiség_id") REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE RESTRICT;


--
-- Name: összetevők fk_osszetevok_osszetevok_osztaly; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT fk_osszetevok_osszetevok_osztaly FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE RESTRICT;


--
-- Name: recept_összetevők fk_osszetevok_recept_osszetevok; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT fk_osszetevok_recept_osszetevok FOREIGN KEY ("összetevő_id") REFERENCES public."összetevők"("összetevő_id") ON DELETE RESTRICT;


--
-- Name: recept_összetevők fk_recept_osszetevok_mertekek; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT fk_recept_osszetevok_mertekek FOREIGN KEY ("mérték_mennyiség_id") REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE RESTRICT;


--
-- Name: recept_összetevők fk_recept_osszetevok_osszetevok_osztaly; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT fk_recept_osszetevok_osszetevok_osztaly FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE RESTRICT;


--
-- Name: recept_összetevők fk_recept_osztaly_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT fk_recept_osztaly_id FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE RESTRICT;


--
-- Name: receptek fk_recept_osztalyok_receptek; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receptek
    ADD CONSTRAINT fk_recept_osztalyok_receptek FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE RESTRICT;


--
-- Name: recept_összetevők fk_receptek_recept_osszetevok; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT fk_receptek_recept_osszetevok FOREIGN KEY (receptid) REFERENCES public.receptek(receptid) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict RECEPTEKBASELINE

