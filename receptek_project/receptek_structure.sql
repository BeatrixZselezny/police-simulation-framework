--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Debian 15.12-0+deb12u2)
-- Dumped by pg_dump version 15.12 (Debian 15.12-0+deb12u2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mértékek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."mértékek" (
    "mérték_mennyiség_id" integer NOT NULL,
    "mérés_leírás" character varying(200) NOT NULL
);


ALTER TABLE public."mértékek" OWNER TO postgres;

--
-- Name: recept_osztályok; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."recept_osztályok" (
    "recept_osztály_id" integer NOT NULL,
    "recept_osztály_név" character varying(100) NOT NULL
);


ALTER TABLE public."recept_osztályok" OWNER TO postgres;

--
-- Name: recept_összetevők; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public."recept_összetevők" OWNER TO postgres;

--
-- Name: receptek; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.receptek OWNER TO postgres;

--
-- Name: összetevők; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."összetevők" (
    "összetevő_id" integer NOT NULL,
    "összetevő_név" character varying(100) NOT NULL,
    "összetevő_osztály_id" integer,
    "mérték_mennyiség_id" integer
);


ALTER TABLE public."összetevők" OWNER TO postgres;

--
-- Name: összetevők_osztály; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."összetevők_osztály" (
    "összetevő_osztály_id" integer NOT NULL,
    "összetevő_osztály_leírás" character varying(100) NOT NULL
);


ALTER TABLE public."összetevők_osztály" OWNER TO postgres;

--
-- Name: buggy_querry; Type: VIEW; Schema: public; Owner: postgres
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


ALTER TABLE public.buggy_querry OWNER TO postgres;

--
-- Name: mértékek_mérték_mennyiség_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."mértékek_mérték_mennyiség_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."mértékek_mérték_mennyiség_id_seq" OWNER TO postgres;

--
-- Name: mértékek_mérték_mennyiség_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."mértékek_mérték_mennyiség_id_seq" OWNED BY public."mértékek"."mérték_mennyiség_id";


--
-- Name: recept_nézet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."recept_nézet" (
    "recept_név" character varying(100),
    "elkészítés" character varying(300),
    "összetevő_név" character varying(100)
);


ALTER TABLE public."recept_nézet" OWNER TO postgres;

--
-- Name: recept_osztályok_recipeclassid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."recept_osztályok_recipeclassid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recept_osztályok_recipeclassid_seq" OWNER TO postgres;

--
-- Name: recept_osztályok_recipeclassid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."recept_osztályok_recipeclassid_seq" OWNED BY public."recept_osztályok"."recept_osztály_id";


--
-- Name: recept_összetevők_receptid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."recept_összetevők_receptid_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recept_összetevők_receptid_seq" OWNER TO postgres;

--
-- Name: recept_összetevők_receptid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."recept_összetevők_receptid_seq" OWNED BY public."recept_összetevők".receptid;


--
-- Name: receptek_recipeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receptek_recipeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receptek_recipeid_seq OWNER TO postgres;

--
-- Name: receptek_recipeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receptek_recipeid_seq OWNED BY public.receptek.receptid;


--
-- Name: összetevők_osztály_összetevő_osztály_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."összetevők_osztály_összetevő_osztály_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."összetevők_osztály_összetevő_osztály_id_seq" OWNER TO postgres;

--
-- Name: összetevők_osztály_összetevő_osztály_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."összetevők_osztály_összetevő_osztály_id_seq" OWNED BY public."összetevők_osztály"."összetevő_osztály_id";


--
-- Name: összetevők_összetevő_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."összetevők_összetevő_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."összetevők_összetevő_id_seq" OWNER TO postgres;

--
-- Name: összetevők_összetevő_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."összetevők_összetevő_id_seq" OWNED BY public."összetevők"."összetevő_id";


--
-- Name: öt_táblás_join_példa; Type: VIEW; Schema: public; Owner: postgres
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
 SELECT five_join_exa."recept_név",
    five_join_exa."összetevő_név",
    five_join_exa."mérés_leírás",
    five_join_exa."recept_osztály_név",
    five_join_exa."összetevő_osztály_leírás"
   FROM five_join_exa;


ALTER TABLE public."öt_táblás_join_példa" OWNER TO postgres;

--
-- Name: mértékek mérték_mennyiség_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek" ALTER COLUMN "mérték_mennyiség_id" SET DEFAULT nextval('public."mértékek_mérték_mennyiség_id_seq"'::regclass);


--
-- Name: recept_osztályok recept_osztály_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok" ALTER COLUMN "recept_osztály_id" SET DEFAULT nextval('public."recept_osztályok_recipeclassid_seq"'::regclass);


--
-- Name: recept_összetevők receptid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők" ALTER COLUMN receptid SET DEFAULT nextval('public."recept_összetevők_receptid_seq"'::regclass);


--
-- Name: receptek receptid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek ALTER COLUMN receptid SET DEFAULT nextval('public.receptek_recipeid_seq'::regclass);


--
-- Name: összetevők összetevő_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők" ALTER COLUMN "összetevő_id" SET DEFAULT nextval('public."összetevők_összetevő_id_seq"'::regclass);


--
-- Name: összetevők_osztály összetevő_osztály_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_osztály" ALTER COLUMN "összetevő_osztály_id" SET DEFAULT nextval('public."összetevők_osztály_összetevő_osztály_id_seq"'::regclass);


--
-- Name: mértékek mértékek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek"
    ADD CONSTRAINT "mértékek_pkey" PRIMARY KEY ("mérték_mennyiség_id");


--
-- Name: recept_osztályok recept_osztályok_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok"
    ADD CONSTRAINT "recept_osztályok_pkey" PRIMARY KEY ("recept_osztály_id");


--
-- Name: recept_összetevők recept_összetevők_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "recept_összetevők_pkey" PRIMARY KEY (receptid, "recept_sorszám");


--
-- Name: receptek receptek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek
    ADD CONSTRAINT receptek_pkey PRIMARY KEY (receptid);


--
-- Name: összetevők_osztály összetevők_osztály_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_osztály"
    ADD CONSTRAINT "összetevők_osztály_pkey" PRIMARY KEY ("összetevő_osztály_id");


--
-- Name: összetevők összetevők_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT "összetevők_pkey" PRIMARY KEY ("összetevő_id");


--
-- Name: recept_összetevők fk_recept_osztály_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_recept_osztály_id" FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_recept_összetevők_mértékek; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_recept_összetevők_mértékek" FOREIGN KEY ("mérték_mennyiség_id") REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_receptek_recept_összetevők; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_receptek_recept_összetevők" FOREIGN KEY (receptid) REFERENCES public.receptek(receptid) ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_összetevők_osztály_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_összetevők_osztály_id" FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_összetevők_recept_összetevők; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_összetevők_recept_összetevők" FOREIGN KEY ("összetevő_id") REFERENCES public."összetevők"("összetevő_id") ON DELETE CASCADE;


--
-- Name: összetevők mértékekÖsszetevők; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT "mértékekÖsszetevők" FOREIGN KEY ("mérték_mennyiség_id") REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE CASCADE;


--
-- Name: receptek recept_osztályokreceptek; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek
    ADD CONSTRAINT "recept_osztályokreceptek" FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE CASCADE;


--
-- Name: összetevők Összetevő_osztályokÖsszetevők; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT "Összetevő_osztályokÖsszetevők" FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

