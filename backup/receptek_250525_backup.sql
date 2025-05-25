--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-0+deb12u1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-0+deb12u1)

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

--
-- Name: interactiverecipeuploader(integer, character varying, character varying, character varying, integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
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


ALTER FUNCTION public.interactiverecipeuploader(receptid integer, "recept_név" character varying, "elkészítés" character varying, jegyzet character varying, "recept_osztály_id" integer, "alaplé" character varying, "zsíradék" character varying, "hús" character varying, "zöldség" character varying, "tejtermék" character varying, "gabonaféle" character varying, "szárazáru" character varying, "állati_termék" character varying, "gyümölcs" character varying, "fűszer" character varying, magvak character varying, "feldolgozott_élelmiszer" character varying, "pékáru" character varying, ital character varying, "konzervtermék" character varying, "édességek" character varying, "kész_szósz" character varying, "fűszernövény" character varying, "kész_krém" character varying) OWNER TO postgres;

--
-- Name: massuploadreceptek(); Type: PROCEDURE; Schema: public; Owner: postgres
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


ALTER PROCEDURE public.massuploadreceptek() OWNER TO postgres;

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
-- Name: config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config (
    param_name text NOT NULL,
    param_value text
);


ALTER TABLE public.config OWNER TO postgres;

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
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config (param_name, param_value) FROM stdin;
csv_path	/home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/recept_összetevők_tömeges_upl/data_utf8.csv
\.


--
-- Data for Name: mértékek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."mértékek" ("mérték_mennyiség_id", "mérés_leírás") FROM stdin;
1	csipet
2	teáskanál
3	evőkanál
4	mililiter
5	deciliter
6	liter
7	miligramm
8	dekagramm
10	kilógramm
9	gramm
\.


--
-- Data for Name: recept_nézet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."recept_nézet" ("recept_név", "elkészítés", "összetevő_név") FROM stdin;
\.


--
-- Data for Name: recept_osztályok; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."recept_osztályok" ("recept_osztály_id", "recept_osztály_név") FROM stdin;
1	köret
2	desszert
3	leves
4	főzelék
5	frissensült
6	egytálétel
7	savanyúság
8	húsétel
9	vegetáriánus
10	előétel
11	feltét
\.


--
-- Data for Name: recept_összetevők; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."recept_összetevők" (receptid, "recept_sorszám", "összetevő_id", "mennyiség", "mérték_mennyiség_id", "összetevő_osztály_id", "recept_osztály_id") FROM stdin;
13	13	95	30.00	8	16	2
14	14	101	40.00	8	16	2
15	15	46	50.00	8	5	2
16	16	95	80.00	8	8	2
17	17	99	40.00	8	16	2
18	18	95	50.00	8	8	2
19	19	34	10.00	6	5	2
20	20	122	50.00	8	8	6
21	21	47	1.00	10	4	6
22	22	57	50.00	8	4	6
23	23	58	50.00	8	4	6
24	24	52	60.00	8	4	6
8	8	8	\N	8	3	2
10	10	10	\N	10	2	3
4	4	4	\N	4	8	4
3	3	3	\N	3	7	5
6	6	6	\N	6	6	6
7	7	7	\N	7	4	7
5	5	5	\N	5	5	8
25	25	54	1.00	10	4	6
26	26	61	1.00	10	4	6
27	27	52	1.00	10	4	6
28	28	53	1.00	10	4	6
29	29	23	1.00	10	3	3
30	30	23	1.00	10	3	3
31	31	22	1.00	10	3	3
32	32	50	1.00	10	3	4
33	33	123	50.00	8	8	3
34	34	52	50.00	8	4	3
35	35	174	1.00	10	4	3
36	36	175	1.00	10	4	3
37	37	64	60.00	8	4	3
38	38	48	50.00	8	4	3
39	39	53	70.00	8	4	3
40	40	22	1.00	10	3	5
41	41	24	1.00	10	3	5
42	42	127	1.00	10	3	5
43	43	23	1.00	10	3	5
44	44	138	1.00	10	3	5
45	45	137	1.00	10	3	5
46	46	22	70.00	8	3	5
47	47	22	80.00	8	3	8
48	48	24	70.00	8	3	8
49	49	24	1.00	10	3	8
50	50	22	1.00	10	3	8
51	51	122	60.00	8	8	6
52	52	55	1.00	10	4	6
53	53	142	70.00	8	12	6
54	54	47	1.00	10	4	6
55	55	46	70.00	8	5	6
56	56	50	80.00	8	4	6
57	57	47	1.00	10	4	6
58	58	93	50.00	8	8	6
59	59	137	50.00	8	8	6
60	60	149	1.00	10	4	7
61	61	149	1.00	10	4	7
62	62	55	1.00	10	4	7
63	63	150	1.00	10	4	7
64	64	151	1.00	10	4	7
65	65	152	1.00	10	4	7
66	66	154	1.00	10	4	7
67	67	142	1.00	10	4	7
68	68	24	1.00	10	3	8
69	69	22	1.00	10	3	8
70	70	24	1.00	10	3	8
71	71	157	70.00	8	3	8
72	72	156	70.00	8	3	8
73	73	22	1.00	10	3	8
74	74	23	1.00	10	3	8
75	75	24	1.00	10	3	8
76	76	35	50.00	8	5	9
77	77	64	70.00	8	4	9
78	78	63	1.00	10	4	9
79	79	63	1.00	10	4	9
80	80	64	70.00	8	4	9
81	81	40	50.00	8	6	9
82	82	174	80.00	8	4	6
83	83	31	50.00	8	3	10
84	84	52	50.00	8	4	10
85	85	50	80.00	8	4	10
86	86	91	40.00	8	4	10
87	87	22	60.00	8	3	10
88	88	56	40.00	8	4	10
89	89	165	1.00	10	7	11
90	90	166	1.00	10	7	11
91	91	34	5.00	5	5	11
92	92	169	5.00	5	16	11
93	93	175	5.00	5	5	11
94	94	49	10.00	8	4	11
95	95	75	10.00	8	4	11
96	96	81	10.00	8	8	11
97	97	177	10.00	8	12	11
98	98	178	10.00	8	12	11
99	99	171	50.00	9	10	11
100	100	24	1.00	10	3	5
2	2	2	\N	2	1	1
\.


--
-- Data for Name: receptek; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receptek (receptid, "recept_név", "elkészítés", jegyzet, "recept_osztály_id", "alaplé", "zsíradék", "hús", "zöldség", "tejtermék", "gabonaféle", "szárazáru", "állati_termék", "gyümölcs", "fűszer", magvak, "feldolgozott_élelmiszer", "pékáru", ital, "konzervtermék", "édességek", "kész_szósz", "fűszernövény", "kész_krém") FROM stdin;
3	sültburgonya	Sütőben süsd a burgonyát 180 fokon 40-45 percig.	Ropogós külső, puha belső.	1	\N	napraforgóolaj	\N	Burgonya	\N	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	zöldköret	Párold meg a zöldségeket kevés olajon 5-7 percig.	Egészséges és könnyű köret.	9	vega_alaplé	olivaolaj	\N	Zöldborsó	\N	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	orsótészta	Főzd meg az orsótésztát sós vízben 10-12 percig.	Gyors és egyszerű köret.	1	víz	\N	\N	\N	\N	\N	orsótészta	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	spagetti	Főzd meg a spagettit sós vízben 8-10 percig.	Tökéletes bármilyen szószhoz.	1	víz	\N	\N	\N	\N	\N	spagetti	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	burgonyakrokett	Süsd meg a burgonyakroketteket sütőben 200 fokon 15-20 percig.	Ropogós és ízletes.	1	víz	napraforgóolaj	\N	Burgonya	\N	\N	Liszt	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	kockatészta	Főzd meg a kockatésztát sós vízben 8-10 percig.	Nagyszerű köret pörkölthöz.	1	víz	napraforgóolaj	\N	\N	\N	\N	Orsótészta	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	tarhonya	Pirítsd meg a tarhonyát kevés olajon, majd főzd meg vízben 10-12 percig.	Ízletes és olcsó köret.	1	víz	napraforgóolaj	\N	\N	\N	\N	Tarhonya	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	Túrógombóc	Keverd össze a túrót, tojást és búzadarát, formálj gombócokat, főzd meg és szórd meg prézlivel	Ahogy a nagyi csinálta	2	\N	\N	\N	\N	Túró	\N	Búzadara	Tojás	\N	Kristálycukor	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	bulgur	Főzd meg a bulgurt forrásban lévő vízben 10-12 percig.	Egészséges köret.	1	víz	\N	\N	\N	\N	\N	Bulgur	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	Somlóigaluska	Készíts piskótát. Rétegezd vaníliakrémmel, dióval és csokiöntettel	Családi kedvenc édesség	2	\N	\N	\N	\N	Tejszínhab	\N	\N	\N	\N	\N	Dió	\N	\N	\N	\N	Piskóta	\N	\N	Csokiöntet
16	Rétes	Nyújtsd ki a tésztát. Töltsd meg alma, túró vagy meggy töltelékkel, süsd aranybarnára	Retro magyar édesség	2	\N	\N	\N	\N	Túró	\N	\N	\N	Meggy	\N	\N	\N	Réteslap	\N	\N	\N	\N	\N	\N
18	Fánk	Készíts kelt tésztát, formázz fánkokat, süsd ki forró olajban, porcukorral hintve tálald	A gyerekek kedvenc édessége	2	\N	napraforgóolaj	\N	\N	\N	\N	Liszt	\N	\N	\N	\N	\N	\N	\N	Sárgabarack_lekvár	\N	\N	\N	\N
19	Fagylalt	Keverd össze a tejet, cukrot és ízesítőket, fagyaszd le keverés közben	Nyári könnyed desszert	2	\N	\N	\N	\N	Tej	\N	Kristálycukor	Tojás	Banán	Vanília	Pisztácia	\N	\N	\N	\N	Csokiöntet	\N	\N	\N
21	Krumplifőzelék	Hámozd meg és kockázd fel a krumplit, főzd meg sós vízben, készíts rántást és keverd a főtt krumplihoz	Gyorsan elkészül	4	víz	napraforgóolaj	\N	Burgonya	\N	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	Spenót	Párold meg a spenótot, készíts tejjel és fokhagymával ízletes besamel mártást, és keverd össze a spenóttal	Tavaszi vitamin bomba	4	víz	napraforgóolaj	\N	Spenót	\N	\N	Liszt	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	Sóska	Forrald fel a sóskát sós vízben, készíts édes-savanyú mártást cukorral és ecettel, majd keverd össze	Tél végi vitaminos fogás	4	víz	napraforgóolaj	\N	Sóska	\N	\N	Kristálycukor	\N	\N	Vegeta	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
25	Kelkáposztafőzelék	Párold meg a kelkáposztát, készíts rántást, és keverd össze a kelkáposztával, majd ízesítsd sóval és borssal	Paprikával is szinesíthető	4	víz	napraforgóolaj	\N	Kelkáposzta	\N	\N	Liszt	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
26	Karalábéfőzelék	Főzd meg a karalábét sós vízben, készíts rántást, és keverd össze a főtt karalábéval	Csak zsenge karalábéból jó	4	víz	napraforgóolaj	\N	Karalábé	\N	\N	Liszt	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
27	Zöldborsófőzelék	Főzd meg a zöldbörsót, készíts rántást, keverd össze a főtt zöldborsóval, sóval és borssal ízesítsd	Ne főzd sokáig mert kemény lesz!	4	víz	napraforgóolaj	\N	Zöldborsó	\N	\N	Liszt	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
29	Húsleves	Főzz marha vagy sertéshúst zöldségekkel, szűrd le és tésztával vagy galuskával tálald	Nagyi receptje szerint	3	marha_alaplé	\N	Marha	Sárgarépa	\N	\N	Cérnametélt	\N	\N	Delikát	\N	\N	\N	\N	\N	\N	\N	\N	\N
30	Gulyásleves	Főzz marhahúst krumplival, paradicsommal, paprikával és fűszerekkel, friss kenyérrel tálald	Hagyományos magyar étel	3	marha_alaplé	napraforgóolaj	Marha	Burgonya	\N	\N	\N	\N	\N	Pirospaprika	\N	\N	Fehér kenyér	\N	\N	\N	\N	\N	\N
31	Raguleves	Párolj cserkehúst zöldségekkel és fűszerekkel, szórd meg liszttel, keverd el és engedd fel, főzd puhára	Vasárnapi ebédre	3	cserke_alaplé	\N	Csirke	Zöldborsó	\N	\N	Liszt	\N	\N	Delikát	\N	\N	\N	\N	\N	\N	\N	\N	\N
32	Paradicsomleves	Főzz paradicsomot zöldségekkel és fűszerekkel, turmixold és ízesítsd bazsalikommal	Nyári étel	3	vega_alaplé	\N	\N	Paradicsom	Parmezán	\N	\N	\N	\N	Bazsalikom	\N	\N	\N	\N	\N	\N	\N	\N	\N
34	Zöldborsóleves	Főzz zöldborsót zöldségekkel, turmixold és tejszínnel ízesitsd	Gyerekek kedvence	3	víz	Vaj	\N	Zöldborsó	Tejszín	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	Karfiolleves	Főzz karfiolt sárgrépával és fűszerekkel, turmixold majd adj tejfölt hozzá	Szezonális fogás	3	víz	Vaj	\N	Karfiol	Tejföl	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
37	Gombaleves	Apríts  gombát, párold meg zöldségekkel és fűszerekkel, adj tejszínt és aprótésztát hozzá	A legjobb több féle gombából	3	víz	Vaj	\N	Gomba	Tejszín	\N	Aprótészta	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
38	Francia hagymaleves	A szeletelt vöröshagymát vajon párold, adj hozzá fűszereket, zöldséglével engedd fel, turmixold és tejszínnel ízesítsd	Piritott zsemlekockával finomabb	3	víz	Vaj	\N	Vöröshagyma	Tejszín	\N	\N	\N	\N	Vegeta	\N	\N	Zsemle	\N	\N	\N	\N	\N	\N
39	Zöldbableves	Vajon párolj zöldbabot zöldségekkel és fűszerekkel,vízzel engedd fel, készíts világos  rántást és keverd bele	Zsenge zöldbabból a legjobb	3	víz	Vaj	\N	Zöldbab	Tejszín	\N	Liszt	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
41	Rántott sertéskaraj	Panírozd be a sertéskarajt lisztbe, tojásba majd zsemlemorzsába, és süsd aranybarnára forró olajban	Vasárnapi ebédre	5	\N	napraforgóolaj	Sertés	\N	\N	\N	Zsemlemorzsa	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
42	Fasírozott	Keverd össze a darált húst, tojást, zsemlemorzsát és fűszereket, formálj gombócokat és süsd meg forró olajban	Kiadós fogás	5	\N	napraforgóolaj	Darált sertés hús	\N	\N	\N	Zsemlemorzsa	Tojás	\N	Örölt bors	\N	\N	\N	\N	\N	\N	\N	\N	\N
43	Marha steak	Sózd és borsozd a marhahúst, süsd forró serpenyőben mind két oldalát, közepesen vagy jól átsütve	Családi összejövetelekre	5	\N	napraforgóolaj	Marha	\N	\N	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
45	Stefánia szelet	Keverd össze a darált húst, tojást, fűszereket, formálj rudat, töltsd meg főtt tojással és süsd meg	Őzgerinc formában készítve szépen szeletelhető	5	\N	napraforgóolaj	Darált sertés hús	\N	\N	\N	Zsemlemorzsa	Tojás	\N	Örölt bors	\N	\N	\N	\N	\N	\N	\N	\N	\N
46	Cordon blue	Töltsd meg a csirkemellet sonkával és sajttal, panítozd be lisztbe, tojásba és zsemlemorzsába majd süsd meg	Ünnepi fogás	5	\N	napraforgóolaj	Csirke	\N	\N	\N	Zsemlemorzsa	Tojás	\N	Örölt bors	\N	Sonka	\N	\N	\N	\N	\N	\N	\N
48	Natúrszelet	Sózd és borsozd a sertéskarajt, süsd meg forró serpenyőben mindkét oldalát	Főzelékekhez jól illik	5	\N	napraforgóolaj	Sertés	\N	\N	\N	\N	\N	\N	Örölt bors	\N	\N	\N	\N	\N	\N	\N	\N	\N
51	Sólett	Főzd meg a babot, és a füstölt húst, keverd össze hagymával, fokhagymával és fűszerekkel, süsd össze sütőben	Húsvéti menü	6	víz	napraforgóolaj	Füstölt hús	Fokhagyma	\N	\N	Fejtettbab	\N	\N	Babérlevél	\N	\N	\N	\N	\N	\N	\N	\N	\N
53	Székelykáposzta	Főzd meg a savanyúkáposztát és sertéshúst, ízesitsd pirospaprikával és tejföllel	Téli vacsorának kitűnő választás	6	víz	napraforgóolaj	Sertés	Vöröshagyma	Tejföl	\N	\N	\N	\N	Pirospaprika	\N	Savanyúkáposzta	\N	\N	\N	\N	\N	\N	\N
54	Krumplistészta	Főzd meg a kockatésztát, keverd össze párolt krumplival és fűszerekkel, süsd össze sütőben	Nagynéni kedvence	6	víz	napraforgóolaj	\N	Burgonya	\N	\N	Kockatészta	\N	\N	Pirospaprika	\N	\N	\N	\N	\N	\N	\N	\N	\N
56	Lecsó	Párold meg a hagymát, paradicsomot, paprikát és ízesitsd pirospaprikával	Nyári, családi kedvenc	6	víz	napraforgóolaj	\N	paradicsom	\N	\N	\N	\N	\N	Delikát	\N	Szalonna	\N	\N	\N	\N	\N	\N	\N
57	Rakottkrumpli	Rétegezd a főtt krumplit tojással, kolbásszal és tejföllel, süsd aranybarnára	Hétvégi családi fogás	6	\N	napraforgóolaj	\N	Burgonya	Tejföl	\N	\N	Tojás	\N	Vegeta	\N	Száraz kolbász	\N	\N	\N	\N	\N	\N	\N
58	Milánói	Főzd meg a spagettit, keverd össze sonkás-paradicsomos mártással, süsd össze sajttal	Gyerekek kedvence	6	\N	olivaolaj	\N	Vöröshagyma	Sajt	\N	Spagetti	\N	\N	Oregano	\N	Paradicsom szósz	\N	\N	\N	\N	\N	\N	\N
60	Kovászosuborka	Kovászos kenyeret, kaprot és fokhagymát adj az uborkához, töltsd fel sós vízzel és érleld napokig	Rántotthúsokhoz jól illik	7	\N	\N	\N	Uborka	\N	\N	\N	\N	\N	Kapor	\N	\N	Fehér kenyér	\N	\N	\N	\N	\N	\N
61	Csemegeuborka	Uborkát helyezz ecetes-cukros-sós lébe, adj hozzá kaprot és fűszereket, hagyd érni	Sültekhez illik jól	7	\N	\N	\N	Uborka	\N	\N	Kristály cukor	\N	\N	Kapor	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
62	Csalamádé	Káposztát, paprikát és uborkát szeletelj fel, tedd ecetes-cukros-sós lébe és hagyd érni	Krumplistésztához kitűnő	7	\N	\N	\N	Fejeskáposzta	\N	\N	Kristály cukor	\N	\N	Só	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
64	Ecetes almapaprika	Almapaprikát helyezd ecetes-cukros-sós lébe, hagyd érni	A csípőst a gyerekek nem szeretik	7	\N	\N	\N	Almapaprika	\N	\N	Kristály cukor	\N	\N	Só	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
65	Zöld paradicsom	A zöldparadicsomokat helyezd ecetes-cukros-sós lébe, tegyél bele pár meggyfa levelet és hagyd érni	Rizses ételekhez remekül illik	7	\N	\N	\N	Zöldparadicsom	\N	\N	Kristály cukor	\N	\N	Meggyfa levél	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
66	Zöld kis dinnye	Zöld kis dinnyéket helyezd ecetes-cukros-sós lébe és hagyd érni	Sültekhez remek választás	7	\N	\N	\N	Zöld kis dinnye	\N	\N	Kristály cukor	\N	\N	Meggyfa levél	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
68	Dagadó	Fűszerezd be a dagadót, töltsd meg kolbáasszal és zöldségekkel, majd süsd meg a sütőben	Apa receptje szerint	8	\N	sertés zsír	Sertés	Gomba	\N	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
69	Csirkeragu	Főzd meg a csirkét zöldségekkel és fűszerekkel, sűrítsd be tejföllel vagy tejszínnel	Kellemes tavaszi vacsora	8	csirke_alaplé	olivaolaj	Csirke	Zöldborsó	Tejszín	\N	\N	\N	\N	Tárkony	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	Pacalpörkölt	Főzd meg a pacalt hagymával, fokhagymával, paradicsommal és pirospaprikával, tálald főtt krumplival	Csípős étel	8	marha_alaplé	napraforgóolaj	Pacal	Vöröshagyma	\N	\N	\N	\N	\N	Pirospaprika	\N	Paradicsom szósz	\N	\N	\N	\N	\N	\N	\N
72	Resztelt máj	Süsd meg a májat hagymával, fokhagymával és fűszerekkel, tálald krumplipürével vagy rizsel	Sózni nem szabad csak tálaláskor mert megkeményedik!	8	\N	napraforgóolaj	Máj	Vöröshagyma	\N	\N	\N	\N	\N	Őrölt bors	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	Marhapörkölt	Főzd meg a marhahúst hagymával, fokhagymával és fűszerekkel, tálald nokedlivel vagy tarhonyával	Csípősen szereti a család	8	\N	napraforgóolaj	Marha	Vöröshagyma	Tejföl	\N	tarhonya	\N	\N	Pirospaprika	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	Sertéspörkölt	Főzd a sertéshúst hagymával, fokhagymával, pirospaprikával és fűszerekkel, tálald nokedlivel vagy tarhonyával	Téli vacsorára kitűnő választás	8	\N	napraforgóolaj	Sertés	Vöröshagyma	Tejföl	\N	tarhonya	\N	\N	Pirospaprika	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	Rántott sajt	Panírozd be a sajtszeleteket lisztbe, tojásba, zsemlemorzsába, majd forró olajban süsd aranybarnára	Családi kedvenc	9	\N	napraforgóolaj	\N	\N	Sajt	\N	Zsemlemorzsa	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	Rántott cukkini	Panírozd be a cukkiniszeleteket lisztbe, tojásba, zsemlemorzsába és forró olajban süsd aranybarnára	Elötte sózd be és hagy a vizet kicsöpögni belőle	9	\N	napraforgóolaj	\N	Cukkini	\N	\N	Zsemlemorzsa	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	Töltött cukkini	Félbevágott cukkiniket töltsd meg zöldségekkel és sajttal, és süsd meg sütőben	Az én kedvencem	9	\N	napraforgóolaj	\N	Cukkini	Sajt	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	Töltött gomba	Gombafejeket töltsd meg zöldségekkel és sajttal majd süsd meg a sütőben	Champion gombából a legjobb	9	\N	napraforgóolaj	\N	Gomba	Sajt	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	Rakott karfiol	Főzd meg a karfiolt, majd rétegezd túróval, tejföllel és sajttal majd sütőben süsd aranybarnára	A család hétvégi kedvence	9	\N	napraforgóolaj	\N	Karfiol	Sajt	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	Rákkoktél	Tálald a főtt rákot koktélmártással és friss salátával	Az én kedvencem	10	\N	\N	Garnélarák	Fejessaláta	\N	\N	\N	\N	Citrom	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	Franciasaláta	Keverd össze a főtt zöldségeket (zöldborsó, sárgarépa, krumpli) majonázzel és tejföllel	Hűtve tálald	10	\N	\N	\N	Zöldborsó	Tejföl	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Majonéz	\N	\N
85	Töltött paradicsom	Töltsd meg a paradicsomokat krémsajttal és fűszerekkel, sütőben süsd meg	Könnyű nyári vacsora	10	\N	\N	\N	Paradicsom	Krémsajt	\N	\N	\N	\N	Oregano	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	Babcsírasaláta	Keverd össze a babcsírát zöldségekkel (paradicsom, paprika, káposzta) és könnyű öntettel	diétás étel	10	\N	\N	\N	Babcsíra	\N	\N	\N	\N	\N	Vegeta	\N	Balzsamecet	\N	\N	\N	\N	\N	\N	\N
88	Andrássaláta	Keverd össze a friss zöldségeket darabolt főtt tojással, adj hozzá vinaigrette öntetet és tálald hidegen	Apa kedvence	10	\N	\N	\N	Fejessaláta	\N	\N	\N	Tojás	\N	\N	\N	\N	\N	\N	\N	\N	Vinaigrette öntet	\N	\N
89	Baracklekvár	Friss barackból készült lekvár, tökéletes palacsintához és süteményekhez	Összetevők: sárgabarack, cukor	11	\N	\N	\N	\N	\N	\N	Kristálycukor	\N	Sárgabarack	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	Szilvalekvár	Érett szilvából készült lekvár amit kenyérre kenve vagy süteményekben használhatunk	Összetevők: szilva, cukor	11	\N	\N	\N	\N	\N	\N	Kristálycukor	\N	Szilva	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	Vaníliaöntet	Tej, tojássárgája, cukor és vanília összefőzve, amely kiváló süteményekhez és gyümölcsökhöz	Összetevők: tej, tojássárgája, cukor és vanília	11	\N	\N	\N	\N	Tej	\N	Kristálycukor	Tojás	\N	Vanília	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	Csokiöntet	Olvasztott csokoládé, tej és cukor keveréke, melyet fagylalthoz és süteményekhez önthetünk	Összetevők: csokoládé, tej, cukor	11	\N	\N	\N	\N	Tej	\N	Kristálycukor	\N	\N	\N	\N	\N	\N	\N	\N	Tejcsokoládé	\N	\N	\N
93	Tejföl	Friss tejfől amelyet levesekhez, főzelékekhez és süteményekhez használhatunk	Összetevők: tejföl	11	\N	\N	\N	\N	Tejföl	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	főttburgonya	Forrald fel a burgonyát sós vízben 20-25 percig.	Egyszerű és gyors köret.	1	víz	\N	\N	Burgonya	\N	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	rizs	Főzd meg a rizst 2:1 arányban vízben 15-20 percig.	Bármilyen ételhez jól illik.	1	víz	\N	\N	\N	\N	Rizs	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	nokedli	Keverd össze a lisztet, tojást és vizet, majd szaggasd ki forró vízbe.	Hagyományos magyar köret.	1	víz	\N	\N	\N	\N	\N	Liszt	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	palacsinta	Keverd össze a lisztet, tojást, sót, tejet. Süss ki vékony palacsintákat. Lekvárral vagy túróval tálald 	Hagyományos magyar desszert	2	\N	napraforgóolaj	\N	\N	Tej	\N	Liszt	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	gesztenyepüré	Törj össze gesztenyét, keverd össze vaníliával és cukorral, tejszínhabbal tállald	Téli ételekhez jól illik	2	\N	\N	\N	\N	Tejszínhab	\N	Kristálycukor	\N	\N	Vanília	\N	\N	\N	\N	\N	gesztenye_massza	\N	\N	\N
20	Babfőzelék	Főzd puhára a babot, készíts rántást, és keverd össze a főtt babbal, majd ízesítsd sóval és borssal	Téli tápláló vacsora	4	víz	napraforgóolaj	\N	\N	\N	\N	Fejtettbab	\N	\N	Őrölt feketebors	\N	\N	\N	\N	\N	\N	\N	\N	\N
24	Finomfőzelék	Főzd meg a vegyes zöldségeket (borsó, répa, karalábé), készíts besamell mártást, és keverd össze a zöldségekkel	A gyerekek kedvence	4	víz	napraforgóolaj	\N	Zöldborsó	\N	\N	Liszt	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
28	Zöldbabfőzelék	Párold meg a zöldbabot, készíts rántást, és keverd össze a zöldbabbal, majd ízesitsd sóval és borssal	Zsenge zöldbabból a legjobb	4	víz	napraforgóolaj	\N	Zöldbab	\N	\N	Liszt	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
33	Lencseleves	Főzz lencsét zöldségekkel és babérlevéllel, adj hozzá fűszereket, turmixold	Diétás étel	3	víz	napraforgóolaj	\N	\N	\N	\N	Lencse	\N	\N	Babérlevél	\N	\N	\N	\N	\N	\N	\N	\N	\N
36	Brokkolikrémleves	Főzz brokkolit zöldségekkel (pl: sárgarépa, krumpli, karfiol) és fűszerekkel, turmixold és ízesítsd tejszínnel	vitamindús fogás	3	víz	Vaj	\N	Brokkoli	Tejszín	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
40	Rántott csirkemell	Panírozd be a csirkemellet lisztbe, tojásba majd zsemlemorzsába, és süsd aranybarnára forró olajban	Anyuka kedvence	5	\N	napraforgóolaj	Csirke	\N	\N	\N	Zsemlemorzsa	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	Fokhagymás mártás	Fokhagymából, tejfölből és fűszerekből készült mártás, mely kiváló húsételekhez	Összetevők: fokhagyma, tejföl, fűszerek	11	\N	\N	\N	Fokhagyma	Tejföl	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
44	Holstein szelet	Süsd meg a borjúszeletet és tálald tükörtojással, kapribogyóval és szardellával	Húsvéti fogás	5	\N	napraforgóolaj	Borjú	\N	\N	\N	Zsemlemorzsa	Tojás	\N	Örölt bors	\N	Kapribogyó	\N	\N	\N	\N	\N	\N	\N
47	Töltött csirkecomb	Töltsd meg a csirkecombot fűszerekkel és zöldségekkel, süsd meg a sütőben arnybarnára	Családi összejövetelekre	5	\N	napraforgóolaj	Csirke	Gomba	\N	\N	\N	\N	\N	Vegeta	\N	\N	\N	\N	\N	\N	\N	\N	\N
49	Sültoldalas	Fűszerezd be a sültoldalast és süsd fokhagymával a sütőben 1-1,5 órán át	Téli fogás	5	\N	sertészsír	Sertés	Fokhagyma	\N	\N	\N	\N	\N	Örölt bors	\N	\N	\N	\N	\N	\N	\N	\N	\N
50	Csirkesült	Fűszerezd be a csirkét és süsd a sütőben 1-1-5 órán át	Salátákal tálalva remek	5	\N	napraforgóolaj	Csirke	Fejessaláta	\N	\N	\N	\N	\N	Delikát	\N	\N	\N	\N	\N	\N	\N	\N	\N
52	Töltöttkáposzta	Keverd össze a darált húst rizsel és fűszerekkel, töltsd be káposztalevelekbe, főzd meg paradicsomlében	Karácsonyi menü	6	víz	napraforgóolaj	Darálthús	Fejeskáposzta	Tejföl	\N	Rizs	Tojás	\N	Fokhagyma	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	Túróscsusza	Főzd meg a kockatésztát, keverd össze túróval, tejföllel, szalonnával, süsd össze sütőben	Laktatós fogás a családnak	6	víz	napraforgóolaj	\N	\N	Túró	\N	Kockatészta	\N	\N	Só	\N	Szalonna	\N	\N	\N	\N	\N	\N	\N
59	Bolognai	Főzd meg a spagettit, keverd össze darált húsos-paradicsomos mártással, tálald reszelt sajttal	Gyorsan elkészül	6	\N	olivaolaj	Darált sertés hús	Vöröshagyma	Sajt	\N	Spagetti	\N	\N	Oregano	\N	Paradicsom szósz	\N	\N	\N	\N	\N	\N	\N
63	Cékla	Főzd meg a céklát, szeleteld fel, tedd ecetes-cukros-sós lébe, hagyd érni	Bármilyen húsételhez kínálható	7	\N	\N	\N	Cékla	\N	\N	Kristály cukor	\N	\N	Só	\N	Ecet	\N	\N	\N	\N	\N	\N	\N
67	Savanyúkáposzta	Káposztát reszelj le, sózd be, hagyd állni míg savanyú nem lesz	Bármilyen húsételhez kínálható	7	\N	\N	\N	Fejeskáposzta	\N	\N	\N	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	Mexikói sertésragu	Főzd meg a sertéshúst, babbal, kukoricával, paradicsommal és mexikói fűszerekkel	Csípős étel	8	vega_alaplé	olivaolaj	Sertés	Kukorica	\N	\N	Fejtettbab	\N	\N	Chili	\N	Paradicsom szósz	\N	\N	\N	\N	\N	\N	\N
73	Tejfölös csirkepörkölt	Főzd meg a csirkét hagymával, fokhagymával, fűszerekkel, pirospaprikával és tejföllel ízesítsd	Hagyományos magyar étel	8	\N	napraforgóolaj	Csirke	Vöröshagyma	Tejföl	\N	orsótészta	\N	\N	Pirospaprika	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	Rántott gomba	Panírozd be a gombafejeket lisztbe, tojásba, zsemelmorzsába és forró olajban süsd aranybarnára	Elötte sózd be, hogy kidobja a vizet	9	\N	napraforgóolaj	\N	Gomba	\N	\N	Zsemlemorzsa	Tojás	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	Rántott szejtán	Sütés előtt áztasd forró vízbe a szejtánt aztán hagyd lecsorogni, panírozd lisztbe, tojásba, zsemlemorzsába és süsd aranybarnára forró olajban	Erősen fűszerezd	9	\N	napraforgóolaj	\N	\N	\N	szejtán_szelet	liszt	Tojás	\N	fokhagyma	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	Cézársaláta	Keverd össze a római salátát krutonnal, sült csirkemell csíkokkal, parmezánnal és cézár öntettel	Anya kedvence	10	\N	\N	Csirke	Rómaisaláta	Parmezán	\N	\N	\N	\N	\N	\N	Cézáröntet	Kifli	\N	\N	\N	\N	\N	\N
95	Csípős szósz	Chili paprikából, paradicsomból és fűszerekből készült szósz, mely kiváló húsételekhez és tésztákhoz	Összetevők: chili paprika, paradicsom, fűszerek	11	\N	\N	\N	Paradicsom	\N	\N	\N	\N	\N	Chili	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	Porcukor	Finomra őrölt cukor amit sütemények tetejére szórhatunk	Összetevők: cukor	11	\N	\N	\N	\N	\N	\N	Porcukor	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	Méz	Természetes édesítőszer melyet teákhoz, süteményekhez és palacsintához használhatunk	Összetevők: méz	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Méz	\N	\N	\N	\N	\N	\N	\N
98	Juharszirup	Édes szirup, melyet palacsintákhoz és süteményekhez önthetünk	Összetevők: juharszirup	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Juharszirup	\N	\N	\N	\N	\N	\N	\N
99	Fahéj	Illatos fűszer melyet süteményekhez és italokhoz használhatunk	Összetevők: fahéj	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	Fahéj	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	Ananáazos csirke	Szeleteld fel a csirkemelleket, dinszteled vöröshagymával, adj hozzá ananászt és szójaszószt, rizsel tálald	Egzotikus finomság	6	Nincs	Étolaj	Csirke	Vöröshagyma	Nincs	Rizs	Nincs	Nincs	Ananász	Só	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Szójaszósz	Nincs	Nincs
\.


--
-- Data for Name: összetevők; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."összetevők" ("összetevő_id", "összetevő_név", "összetevő_osztály_id", "mérték_mennyiség_id") FROM stdin;
1	víz	1	\N
2	csirke_alaplé	1	\N
3	marha_alaplé	1	\N
4	hal_alaplé	1	\N
5	gomba_alaplé	1	\N
6	tenger_gyümölcsei_alaplé	1	\N
7	parmezán_alaplé	1	\N
8	csont_alaplé	1	\N
9	kagyló_alaplé	1	\N
10	gyümölcs_alaplé	1	\N
11	vega_alaplé	1	\N
12	olivaolaj	2	\N
13	napraforgóolaj	2	\N
14	kókuszolaj	2	\N
15	vaj	2	\N
16	margarin	2	\N
17	sertészsír	2	\N
18	pálmaolaj	2	\N
19	repceolaj	2	\N
20	szőlőmagolaj	2	\N
21	szójaolaj	2	\N
22	Csirke	3	\N
23	Marha	3	\N
24	Sertés	3	\N
25	Bárány	3	\N
26	Kacsa	3	\N
27	Pulyka	3	\N
28	Nyúl	3	\N
29	Fácán	3	\N
30	Vaddisznó	3	\N
31	Garnélarák	3	\N
32	Lazac	3	\N
33	Tonhal	3	\N
34	Tej	5	\N
35	Sajt	5	\N
36	Tejszín	5	\N
37	Tejszinhab	5	\N
38	Joghurt	5	\N
39	Rizs	6	\N
40	Bulgur	6	\N
41	Búzadara	6	\N
43	Köles	6	\N
44	Parmezán	5	\N
45	Mozarella	5	\N
46	Túró	5	\N
47	Burgonya	4	\N
48	Vöröshagyma	4	\N
49	Fokhagyma	4	\N
50	Paradicsom	4	\N
51	Paprika	4	\N
52	Zöldborsó	4	\N
53	Zöldbab	4	\N
54	Kelkáposzta	4	\N
55	Fejeskáposzta	4	\N
56	Fejessaláta	4	\N
57	Spenót	4	\N
58	Sóska	4	\N
59	Sárgarépa	4	\N
60	Zeller	4	\N
61	Kralábé	4	\N
62	Gyökér	4	\N
63	Cukkini	4	\N
64	Gomba	4	\N
65	Pirospaprika	7	\N
66	Őrölt bors	7	\N
67	Egész bors	7	\N
68	Vegeta	7	\N
69	Delikát	7	\N
70	Örölt kömény	7	\N
71	Szemes kömény	7	\N
72	Majoranna	7	\N
73	Tárkony	7	\N
74	Füstölt paprika	7	\N
75	Chili	7	\N
76	Babérlevél	7	\N
77	Pirospaprika	8	\N
78	Füstölt paprika	8	\N
79	Só	8	\N
80	Kristálycukor	8	\N
81	Porcukor	8	\N
82	Örölt feketebors	8	\N
83	Szemes feketebors	8	\N
84	Vegeta	8	\N
85	Delikát	8	\N
86	Örölt kömény	8	\N
87	Szemes kömény	8	\N
88	Majoranna	8	\N
89	Lestyán	8	\N
90	Tárkony	8	\N
91	Babcsíra	4	\N
92	Kockatészta	8	\N
93	Spagetti	8	\N
94	Orsótészta	8	\N
95	Liszt	8	\N
96	Búzadara	8	\N
97	Zsemlemorzsa	8	\N
98	Tojás	9	\N
99	gesztenye_massza	16	\N
100	Valília_öntet	16	\N
101	Csokiöntet	16	\N
102	Piskóta	16	\N
103	Dió	11	\N
104	Mogyoró	11	\N
106	Mandula	11	\N
107	Pisztácia	11	\N
108	Réteslap	13	\N
109	Alma	7	\N
110	Meggy	7	\N
111	Narancs	7	\N
112	Banán	7	\N
113	Ananász	7	\N
114	Mandarin	7	\N
115	Citrom	7	\N
116	Lime	7	\N
117	Vanília	10	\N
118	Sárgabarack_lekvár	15	\N
119	Meggylekvár	15	\N
120	Szilvalekvár	15	\N
121	Narancslekvár	15	\N
122	Fejtettbab	8	\N
123	Lencse	8	\N
124	Ecet	12	\N
125	Mustár	12	\N
126	Ketchup	12	\N
127	Cérnametélt	8	\N
128	Csigatészta	8	\N
42	Szejtán_szelet	6	\N
129	Fehér kenyér	13	\N
130	Rozs kenyér	13	\N
131	Kifli	13	\N
132	Szezámmagos zsemle	13	\N
133	Oregano	10	\N
134	Bazsalikom	10	\N
135	Aprótészta	8	\N
136	Zsemle	13	\N
137	Darált sertés hús	3	\N
138	Borjú	3	\N
139	Kapribogyó	12	\N
140	Sonka	12	\N
141	Füstölt hús	3	\N
142	Savanyúkáposzta	12	\N
143	Szalonna	12	\N
144	Száraz kolbász	12	\N
145	Szalámi	12	\N
146	Virsli	12	\N
147	Paradicsom szósz	17	\N
148	Kapor	7	\N
149	Uborka	4	\N
150	Cékla	4	\N
151	Almapaprika	4	\N
152	Zöld paradicsom	4	\N
153	Zöldparadicsom	7	\N
154	Zöld kis dinnye	4	\N
155	Kukorica	4	\N
156	Máj	3	\N
157	Pacal	3	\N
158	Koktélmártás	17	\N
159	Majonéz	17	\N
160	Krémsajt	5	\N
161	Balzsamecet	12	\N
162	Cézáröntet	17	\N
163	Rómaisaláta	4	\N
164	Vinaigrette öntet	17	\N
165	Sárgabarack	7	\N
166	Szilva	7	\N
167	Meggy	7	\N
168	Étcsokoládé	16	\N
169	Tejcsokoládé	16	\N
170	Vanília	8	\N
171	Fahéj	10	\N
172	Ismeretlen összetevő	\N	\N
174	Ismeretlen összetevő	\N	\N
175	Ismeretlen összetevő	\N	\N
177	Ismeretlen összetevő	\N	\N
178	Ismeretlen összetevő	\N	\N
179	Ismeretlen összetevő	\N	\N
\.


--
-- Data for Name: összetevők_osztály; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."összetevők_osztály" ("összetevő_osztály_id", "összetevő_osztály_leírás") FROM stdin;
1	alaplé
2	zsíradék
3	hús
4	zöldség
5	tejtermék
6	gabonaféle
8	szárazáru
9	állati_termék
7	gyümölcs
10	fűszer
11	magvak
12	feldolgozott_élelmiszer
13	pékáru
14	ital
15	konzervtermék
16	édességek
17	kész_szósz
18	fűszernövény
19	kész_krém
\.


--
-- Name: mértékek_mérték_mennyiség_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."mértékek_mérték_mennyiség_id_seq"', 99, true);


--
-- Name: recept_osztályok_recipeclassid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recept_osztályok_recipeclassid_seq"', 1, false);


--
-- Name: recept_összetevők_receptid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recept_összetevők_receptid_seq"', 1, true);


--
-- Name: receptek_recipeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receptek_recipeid_seq', 99, true);


--
-- Name: összetevők_osztály_összetevő_osztály_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."összetevők_osztály_összetevő_osztály_id_seq"', 19, true);


--
-- Name: összetevők_összetevő_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."összetevők_összetevő_id_seq"', 46, true);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (param_name);


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

