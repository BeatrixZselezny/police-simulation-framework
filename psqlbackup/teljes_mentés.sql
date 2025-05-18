--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE debiana;
ALTER ROLE debiana WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:RpllZcNI09J0kOcjKG9k7A==$FKUJweSvvwk/H/OHW73SC2XC/ZrPXkc+HQLq//WBZEM=:jF1OABYEYoHhMHqlawAm5fj1Oqn/T1C+j5KLSLLASUA=';
CREATE ROLE learner_role;
ALTER ROLE learner_role WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:1gWvk/1xdjw8codACpCZ4w==$4Ikem/ucVHzkU2pGgEyeg73FtOV1X3p344cQEKLU798=:AowFjNwfx5wr1aSsV55UVmq3Ao/jCtGfI8t14l6Nw0s=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:daD7lynEg5SO02m6FBfv8w==$gQFj1N6DcChTsm+xaukLmpvcLGsS2ixDi39lFPwPav4=:2DRd5CIG7gVyijb/x6FsRDnsdxTMtTYB/RmaNbUt2Zo=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

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
-- PostgreSQL database dump complete
--

--
-- Database "policeproject" dump
--

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
-- Name: policeproject; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE policeproject WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE policeproject OWNER TO postgres;

\connect policeproject

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
-- Name: botnet; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.botnet (
    id integer NOT NULL,
    crime_id integer,
    botnet_name character varying(100),
    command character varying(100),
    target character varying(100),
    message text
);


ALTER TABLE public.botnet OWNER TO debiana;

--
-- Name: botnet_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.botnet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.botnet_id_seq OWNER TO debiana;

--
-- Name: botnet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.botnet_id_seq OWNED BY public.botnet.id;


--
-- Name: crimes; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.crimes (
    id integer NOT NULL,
    type character varying(50),
    description text,
    date date,
    officer_id integer,
    detective_id integer,
    category character varying(50),
    status character varying(50)
);


ALTER TABLE public.crimes OWNER TO debiana;

--
-- Name: crimes_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.crimes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crimes_id_seq OWNER TO debiana;

--
-- Name: crimes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.crimes_id_seq OWNED BY public.crimes.id;


--
-- Name: criminals; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.criminals (
    id integer NOT NULL,
    name character varying(100),
    age integer,
    role character varying(50),
    organization character varying(100)
);


ALTER TABLE public.criminals OWNER TO debiana;

--
-- Name: criminals_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.criminals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criminals_id_seq OWNER TO debiana;

--
-- Name: criminals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.criminals_id_seq OWNED BY public.criminals.id;


--
-- Name: cybercriminals; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.cybercriminals (
    id integer NOT NULL,
    name character varying(100),
    expertise character varying(100),
    age integer,
    botnet_id integer
);


ALTER TABLE public.cybercriminals OWNER TO debiana;

--
-- Name: cybercriminals_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.cybercriminals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cybercriminals_id_seq OWNER TO debiana;

--
-- Name: cybercriminals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.cybercriminals_id_seq OWNED BY public.cybercriminals.id;


--
-- Name: detectives; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.detectives (
    id integer NOT NULL,
    name character varying(100),
    age integer,
    rank character varying(50),
    department character varying(100)
);


ALTER TABLE public.detectives OWNER TO debiana;

--
-- Name: detectives_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.detectives_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detectives_id_seq OWNER TO debiana;

--
-- Name: detectives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.detectives_id_seq OWNED BY public.detectives.id;


--
-- Name: drugdealing; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.drugdealing (
    dealing_id integer NOT NULL,
    crime_id integer,
    drug_type character varying(50),
    quantity numeric
);


ALTER TABLE public.drugdealing OWNER TO debiana;

--
-- Name: drugdealing_dealing_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.drugdealing_dealing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drugdealing_dealing_id_seq OWNER TO debiana;

--
-- Name: drugdealing_dealing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.drugdealing_dealing_id_seq OWNED BY public.drugdealing.dealing_id;


--
-- Name: equipment; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.equipment (
    id integer NOT NULL,
    name character varying(50),
    description text,
    quantity integer,
    station_id integer
);


ALTER TABLE public.equipment OWNER TO debiana;

--
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipment_id_seq OWNER TO debiana;

--
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.equipment_id_seq OWNED BY public.equipment.id;


--
-- Name: humantrafficking; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.humantrafficking (
    trafficking_id integer NOT NULL,
    crime_id integer,
    victim_name character varying(100),
    location character varying(100)
);


ALTER TABLE public.humantrafficking OWNER TO debiana;

--
-- Name: humantrafficking_trafficking_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.humantrafficking_trafficking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.humantrafficking_trafficking_id_seq OWNER TO debiana;

--
-- Name: humantrafficking_trafficking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.humantrafficking_trafficking_id_seq OWNED BY public.humantrafficking.trafficking_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying(100),
    address character varying(255)
);


ALTER TABLE public.locations OWNER TO debiana;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO debiana;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: police_relations; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.police_relations (
    police_id integer NOT NULL,
    botnet_id integer,
    crimes_id integer,
    criminals_id integer,
    cybercriminals_id integer,
    detectives_id integer,
    locations_id integer,
    policeofficers_id integer,
    policestation_id integer,
    realtime_id integer,
    simulation_id integer,
    victims_id integer
);


ALTER TABLE public.police_relations OWNER TO debiana;

--
-- Name: police_relations_police_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.police_relations_police_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.police_relations_police_id_seq OWNER TO debiana;

--
-- Name: police_relations_police_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.police_relations_police_id_seq OWNED BY public.police_relations.police_id;


--
-- Name: policeofficers; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.policeofficers (
    id integer NOT NULL,
    name character varying(100),
    rank character varying(50),
    station_id integer,
    age integer,
    department character varying(100)
);


ALTER TABLE public.policeofficers OWNER TO debiana;

--
-- Name: policeofficers_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.policeofficers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.policeofficers_id_seq OWNER TO debiana;

--
-- Name: policeofficers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.policeofficers_id_seq OWNED BY public.policeofficers.id;


--
-- Name: policestation; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.policestation (
    id integer NOT NULL,
    room_name character varying(100),
    location character varying(100),
    description text
);


ALTER TABLE public.policestation OWNER TO debiana;

--
-- Name: policestation_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.policestation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.policestation_id_seq OWNER TO debiana;

--
-- Name: policestation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.policestation_id_seq OWNED BY public.policestation.id;


--
-- Name: realtime; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.realtime (
    id integer NOT NULL,
    event_name character varying(100),
    "timestamp" timestamp without time zone,
    description text
);


ALTER TABLE public.realtime OWNER TO debiana;

--
-- Name: realtime_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.realtime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.realtime_id_seq OWNER TO debiana;

--
-- Name: realtime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.realtime_id_seq OWNED BY public.realtime.id;


--
-- Name: rescue; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.rescue (
    rescue_id integer NOT NULL,
    crime_id integer,
    victim_name character varying(100),
    location character varying(100),
    result boolean,
    completion_time timestamp without time zone
);


ALTER TABLE public.rescue OWNER TO debiana;

--
-- Name: rescue_rescue_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.rescue_rescue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rescue_rescue_id_seq OWNER TO debiana;

--
-- Name: rescue_rescue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.rescue_rescue_id_seq OWNED BY public.rescue.rescue_id;


--
-- Name: simulation; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.simulation (
    id integer NOT NULL,
    scenario character varying(100),
    result character varying(100),
    date date
);


ALTER TABLE public.simulation OWNER TO debiana;

--
-- Name: simulation_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.simulation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.simulation_id_seq OWNER TO debiana;

--
-- Name: simulation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.simulation_id_seq OWNED BY public.simulation.id;


--
-- Name: theft; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.theft (
    theft_id integer NOT NULL,
    crime_id integer,
    stolen_item character varying(100),
    value numeric
);


ALTER TABLE public.theft OWNER TO debiana;

--
-- Name: theft_theft_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.theft_theft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theft_theft_id_seq OWNER TO debiana;

--
-- Name: theft_theft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.theft_theft_id_seq OWNED BY public.theft.theft_id;


--
-- Name: victims; Type: TABLE; Schema: public; Owner: debiana
--

CREATE TABLE public.victims (
    id integer NOT NULL,
    name character varying(100),
    age integer,
    gender character varying(10),
    hair_color character varying(50),
    crime_id integer
);


ALTER TABLE public.victims OWNER TO debiana;

--
-- Name: victims_id_seq; Type: SEQUENCE; Schema: public; Owner: debiana
--

CREATE SEQUENCE public.victims_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.victims_id_seq OWNER TO debiana;

--
-- Name: victims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: debiana
--

ALTER SEQUENCE public.victims_id_seq OWNED BY public.victims.id;


--
-- Name: botnet id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.botnet ALTER COLUMN id SET DEFAULT nextval('public.botnet_id_seq'::regclass);


--
-- Name: crimes id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.crimes ALTER COLUMN id SET DEFAULT nextval('public.crimes_id_seq'::regclass);


--
-- Name: criminals id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.criminals ALTER COLUMN id SET DEFAULT nextval('public.criminals_id_seq'::regclass);


--
-- Name: cybercriminals id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.cybercriminals ALTER COLUMN id SET DEFAULT nextval('public.cybercriminals_id_seq'::regclass);


--
-- Name: detectives id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.detectives ALTER COLUMN id SET DEFAULT nextval('public.detectives_id_seq'::regclass);


--
-- Name: drugdealing dealing_id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.drugdealing ALTER COLUMN dealing_id SET DEFAULT nextval('public.drugdealing_dealing_id_seq'::regclass);


--
-- Name: equipment id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.equipment ALTER COLUMN id SET DEFAULT nextval('public.equipment_id_seq'::regclass);


--
-- Name: humantrafficking trafficking_id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.humantrafficking ALTER COLUMN trafficking_id SET DEFAULT nextval('public.humantrafficking_trafficking_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: police_relations police_id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations ALTER COLUMN police_id SET DEFAULT nextval('public.police_relations_police_id_seq'::regclass);


--
-- Name: policeofficers id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.policeofficers ALTER COLUMN id SET DEFAULT nextval('public.policeofficers_id_seq'::regclass);


--
-- Name: policestation id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.policestation ALTER COLUMN id SET DEFAULT nextval('public.policestation_id_seq'::regclass);


--
-- Name: realtime id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.realtime ALTER COLUMN id SET DEFAULT nextval('public.realtime_id_seq'::regclass);


--
-- Name: rescue rescue_id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.rescue ALTER COLUMN rescue_id SET DEFAULT nextval('public.rescue_rescue_id_seq'::regclass);


--
-- Name: simulation id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.simulation ALTER COLUMN id SET DEFAULT nextval('public.simulation_id_seq'::regclass);


--
-- Name: theft theft_id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.theft ALTER COLUMN theft_id SET DEFAULT nextval('public.theft_theft_id_seq'::regclass);


--
-- Name: victims id; Type: DEFAULT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.victims ALTER COLUMN id SET DEFAULT nextval('public.victims_id_seq'::regclass);


--
-- Data for Name: botnet; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.botnet (id, crime_id, botnet_name, command, target, message) FROM stdin;
1	1	AlphaBot	DDoS attack	Main Server	\N
2	2	BetaBot	Spam email	\N	Join our club!
3	3	GammaBot	Mine cryptocurrency	\N	\N
4	\N	AlphaBot	DDoS attack	Main Server	\N
5	\N	BetaBot	Spam email	\N	Join our club!
6	\N	GammaBot	Mine cryptocurrency	\N	\N
7	\N	AlphaBot	DDoS attack	Main Server	\N
8	\N	BetaBot	Spam email	\N	Join our club!
9	\N	GammaBot	Mine cryptocurrency	\N	\N
10	\N	AlphaBot	DDoS attack	Main Server	\N
11	\N	BetaBot	Spam email	\N	Join our club!
12	\N	GammaBot	Mine cryptocurrency	\N	\N
13	\N	AlphaBot	DDoS attack	Main Server	\N
14	\N	BetaBot	Spam email	\N	Join our club!
15	\N	GammaBot	Mine cryptocurrency	\N	\N
16	\N	AlphaBot	DDoS attack	Main Server	\N
17	\N	BetaBot	Spam email	\N	Join our club!
18	\N	GammaBot	Mine cryptocurrency	\N	\N
\.


--
-- Data for Name: crimes; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.crimes (id, type, description, date, officer_id, detective_id, category, status) FROM stdin;
1	Robbery	Bank robbery at Central Bank	2024-12-01	1	\N	\N	\N
2	Assault	Assault in North Park	2024-12-02	2	\N	\N	\N
3	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
4	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
5	Burglary	House burglary in downtown	2024-10-15	3	3	Theft	Closed
6	Drug Dealing	Illegal drug dealing in the park	2024-10-01	4	4	Drug Offense	Ongoing
7	Hacking	Cyber attack on government systems	2024-09-20	5	5	Cybercrime	Investigation
8	Human Trafficking	Operation to rescue victims of human trafficking	2024-09-10	6	6	Human Rights	Rescue
9	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
10	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
11	Burglary	House burglary in downtown	2024-10-15	3	3	Theft	Closed
12	Drug Dealing	Illegal drug dealing in the park	2024-10-01	4	4	Drug Offense	Ongoing
13	Hacking	Cyber attack on government systems	2024-09-20	5	5	Cybercrime	Investigation
14	Human Trafficking	Operation to rescue victims of human trafficking	2024-09-10	6	6	Human Rights	Rescue
15	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
16	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
17	Burglary	House burglary in downtown	2024-10-15	3	3	Theft	Closed
18	Drug Dealing	Illegal drug dealing in the park	2024-10-01	4	4	Drug Offense	Ongoing
19	Hacking	Cyber attack on government systems	2024-09-20	5	5	Cybercrime	Investigation
20	Human Trafficking	Operation to rescue victims of human trafficking	2024-09-10	6	6	Human Rights	Rescue
21	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
22	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
23	Burglary	House burglary in downtown	2024-10-15	3	3	Theft	Closed
24	Drug Dealing	Illegal drug dealing in the park	2024-10-01	4	4	Drug Offense	Ongoing
25	Hacking	Cyber attack on government systems	2024-09-20	5	5	Cybercrime	Investigation
26	Human Trafficking	Operation to rescue victims of human trafficking	2024-09-10	6	6	Human Rights	Rescue
27	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
28	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
29	Burglary	House burglary in downtown	2024-10-15	3	3	Theft	Closed
30	Drug Dealing	Illegal drug dealing in the park	2024-10-01	4	4	Drug Offense	Ongoing
31	Hacking	Cyber attack on government systems	2024-09-20	5	5	Cybercrime	Investigation
32	Human Trafficking	Operation to rescue victims of human trafficking	2024-09-10	6	6	Human Rights	Rescue
33	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
34	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
35	Burglary	House burglary in downtown	2024-10-15	3	3	Theft	Closed
36	Drug Dealing	Illegal drug dealing in the park	2024-10-01	4	4	Drug Offense	Ongoing
37	Hacking	Cyber attack on government systems	2024-09-20	5	5	Cybercrime	Investigation
38	Human Trafficking	Operation to rescue victims of human trafficking	2024-09-10	6	6	Human Rights	Rescue
39	Robbery	Bank robbery at main street	2024-12-01	1	1	Theft	Solved
40	Fraud	Financial fraud involving multiple companies	2024-11-20	2	2	Financial	Investigation
\.


--
-- Data for Name: criminals; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.criminals (id, name, age, role, organization) FROM stdin;
1	Don Vito	60	Boss	Italian Mafia
2	Michael	40	Underboss	Italian Mafia
3	Sonny	35	Capo	Italian Mafia
4	Paulie	30	Soldier	Italian Mafia
5	Clemenza	45	Soldier	Italian Mafia
6	Corzi	28	Soldier	Italian Mafia
7	Morales	41	Soldier	Italian Mafia
8	Mauro	26	Soldier	Italian Mafia
9	Tom	40	Consigliere	Italian Mafia
10	Tony	35	Dealer	Downtown Drug Den
11	Alice	30	Trafficker	Red Light District
\.


--
-- Data for Name: cybercriminals; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.cybercriminals (id, name, expertise, age, botnet_id) FROM stdin;
1	Adele	Abuser	40	1
2	Anonymus	Hactivist	25	\N
3	Newbie	Script Kiddie	18	\N
4	Agent Smith	State Actor	40	\N
5	Esther Blue	Insider Threat	58	\N
6	Louis Nut	Scammer	50	\N
\.


--
-- Data for Name: detectives; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.detectives (id, name, age, rank, department) FROM stdin;
1	Peter Winston	46	Criminal Investigator	Criminal
2	Marc Hamilton	40	Financial Investigator	Financial
3	Marry Roberts	37	Criminal Investigator	Criminal
4	Andy Folk	28	Technical Investigator	Technical
5	Phil Evans	49	Financial Investigator	Financial
6	Vicky Moore	30	Criminal Investigator	Criminal
\.


--
-- Data for Name: drugdealing; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.drugdealing (dealing_id, crime_id, drug_type, quantity) FROM stdin;
\.


--
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.equipment (id, name, description, quantity, station_id) FROM stdin;
1	Handcuffs	Standard police handcuffs	100	1
2	Batons	Police batons for crowd control	50	2
3	Radios	Communication devices	75	1
\.


--
-- Data for Name: humantrafficking; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.humantrafficking (trafficking_id, crime_id, victim_name, location) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.locations (id, name, address) FROM stdin;
1	Default Bar Name	Unknown Address
2	Drug Den	Secret Location
3	Red Light House	Hidden Alley
9	Location 4	Address 4
10	Location 5	Address 5
11	Location 6	Address 6
12	Location 7	Address 7
13	Location 8	Address 8
\.


--
-- Data for Name: police_relations; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.police_relations (police_id, botnet_id, crimes_id, criminals_id, cybercriminals_id, detectives_id, locations_id, policeofficers_id, policestation_id, realtime_id, simulation_id, victims_id) FROM stdin;
\.


--
-- Data for Name: policeofficers; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.policeofficers (id, name, rank, station_id, age, department) FROM stdin;
5	Tom Wargas	Sergeant	2	45	Patrol
6	Lucy Walles	Junior Patrol	3	23	Patrol
7	Leslie Jackson	Senior Sergeant	4	48	Patrol
8	Angela Morris	Guard Leader	5	39	Patrol
9	Alan White	Patrol	6	30	Patrol
10	Jane Smith	Corporal	\N	34	Patrol
40	John Smith	Sergeant	\N	35	Homicide
41	Jane Doe	Officer	\N	30	Patrol
\.


--
-- Data for Name: policestation; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.policestation (id, room_name, location, description) FROM stdin;
1	Central Station	Downtown	\N
2	North Station	North Side	\N
3	InterrogatorOne	\N	This is interrogation room number one.
4	InterrogatorTwo	\N	This is interrogation room number two.
5	InterrogatorThree	\N	This is interrogation room number three.
6	Prison	\N	This is the detention center for the arrested.
7	OfficeOne	\N	Office number one for the police staff.
8	OfficeTwo	\N	Office number two for the police staff.
9	OfficeThree	\N	Office number three for the police staff.
10	RelaxRoom	\N	This is the relax room for the police staff.
11	LargeHall	\N	This is the big hall, this is where the police hold the briefing.
12	ServerRoom	\N	Servers and internet technology tools for the police.
13	DiningRoom	\N	Dining room and cantin for the police staff.
14	BathRoom	\N	Bathrooms for the police staff.
15	DogKennel	\N	This is the dog kennel for the police dogs.
16	Armory	\N	This is the armory where the weapons are stored.
17	Garage	\N	This is the garage where the police vehicles are kept.
\.


--
-- Data for Name: realtime; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.realtime (id, event_name, "timestamp", description) FROM stdin;
1	Human trafficking reported	2024-12-04 10:00:00	Human trafficking reported
2	Drug dealing reported	2024-12-04 12:30:00	Drug dealing reported
3	Suspect Identified	2024-12-04 10:00:00	A suspect was identified in the robbery case.
4	Crime Scene Investigation	2024-12-04 12:30:00	Forensic team is investigating the crime scene.
\.


--
-- Data for Name: rescue; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.rescue (rescue_id, crime_id, victim_name, location, result, completion_time) FROM stdin;
1	1	John Doe	Red Light House	t	2024-12-05 00:39:19.677696
\.


--
-- Data for Name: simulation; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.simulation (id, scenario, result, date) FROM stdin;
1	Human trafficking reported	Handled	2024-12-04
2	Drug dealing reported	Handled	2024-12-04
3	Simulation 1	Success	2024-12-04
4	Simulation 2	Failure	2024-12-04
5	Simulation 3	Ongoing	2024-12-04
\.


--
-- Data for Name: theft; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.theft (theft_id, crime_id, stolen_item, value) FROM stdin;
\.


--
-- Data for Name: victims; Type: TABLE DATA; Schema: public; Owner: debiana
--

COPY public.victims (id, name, age, gender, hair_color, crime_id) FROM stdin;
1	Anna	22	female	brown	1
2	Sarah	25	female	blonde	2
3	Louis	30	male	black	3
4	Leslie	28	female	red	4
\.


--
-- Name: botnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.botnet_id_seq', 18, true);


--
-- Name: crimes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.crimes_id_seq', 40, true);


--
-- Name: criminals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.criminals_id_seq', 68, true);


--
-- Name: cybercriminals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.cybercriminals_id_seq', 6, true);


--
-- Name: detectives_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.detectives_id_seq', 36, true);


--
-- Name: drugdealing_dealing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.drugdealing_dealing_id_seq', 1, false);


--
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.equipment_id_seq', 3, true);


--
-- Name: humantrafficking_trafficking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.humantrafficking_trafficking_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.locations_id_seq', 13, true);


--
-- Name: police_relations_police_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.police_relations_police_id_seq', 45, true);


--
-- Name: policeofficers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.policeofficers_id_seq', 41, true);


--
-- Name: policestation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.policestation_id_seq', 35, true);


--
-- Name: realtime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.realtime_id_seq', 4, true);


--
-- Name: rescue_rescue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.rescue_rescue_id_seq', 1, true);


--
-- Name: simulation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.simulation_id_seq', 5, true);


--
-- Name: theft_theft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.theft_theft_id_seq', 1, false);


--
-- Name: victims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: debiana
--

SELECT pg_catalog.setval('public.victims_id_seq', 4, true);


--
-- Name: botnet botnet_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.botnet
    ADD CONSTRAINT botnet_pkey PRIMARY KEY (id);


--
-- Name: crimes crimes_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.crimes
    ADD CONSTRAINT crimes_pkey PRIMARY KEY (id);


--
-- Name: criminals criminals_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.criminals
    ADD CONSTRAINT criminals_pkey PRIMARY KEY (id);


--
-- Name: cybercriminals cybercriminals_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.cybercriminals
    ADD CONSTRAINT cybercriminals_pkey PRIMARY KEY (id);


--
-- Name: detectives detectives_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.detectives
    ADD CONSTRAINT detectives_pkey PRIMARY KEY (id);


--
-- Name: drugdealing drugdealing_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.drugdealing
    ADD CONSTRAINT drugdealing_pkey PRIMARY KEY (dealing_id);


--
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- Name: humantrafficking humantrafficking_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.humantrafficking
    ADD CONSTRAINT humantrafficking_pkey PRIMARY KEY (trafficking_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: police_relations police_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_pkey PRIMARY KEY (police_id);


--
-- Name: policeofficers policeofficers_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.policeofficers
    ADD CONSTRAINT policeofficers_pkey PRIMARY KEY (id);


--
-- Name: policestation policestation_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.policestation
    ADD CONSTRAINT policestation_pkey PRIMARY KEY (id);


--
-- Name: realtime realtime_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.realtime
    ADD CONSTRAINT realtime_pkey PRIMARY KEY (id);


--
-- Name: rescue rescue_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.rescue
    ADD CONSTRAINT rescue_pkey PRIMARY KEY (rescue_id);


--
-- Name: simulation simulation_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.simulation
    ADD CONSTRAINT simulation_pkey PRIMARY KEY (id);


--
-- Name: theft theft_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.theft
    ADD CONSTRAINT theft_pkey PRIMARY KEY (theft_id);


--
-- Name: victims victims_pkey; Type: CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.victims
    ADD CONSTRAINT victims_pkey PRIMARY KEY (id);


--
-- Name: botnet botnet_crime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.botnet
    ADD CONSTRAINT botnet_crime_id_fkey FOREIGN KEY (crime_id) REFERENCES public.crimes(id);


--
-- Name: cybercriminals cybercriminals_botnet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.cybercriminals
    ADD CONSTRAINT cybercriminals_botnet_id_fkey FOREIGN KEY (botnet_id) REFERENCES public.botnet(id);


--
-- Name: drugdealing drugdealing_crime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.drugdealing
    ADD CONSTRAINT drugdealing_crime_id_fkey FOREIGN KEY (crime_id) REFERENCES public.crimes(id);


--
-- Name: equipment equipment_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_station_id_fkey FOREIGN KEY (station_id) REFERENCES public.policestation(id);


--
-- Name: humantrafficking humantrafficking_crime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.humantrafficking
    ADD CONSTRAINT humantrafficking_crime_id_fkey FOREIGN KEY (crime_id) REFERENCES public.crimes(id);


--
-- Name: police_relations police_relations_botnet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_botnet_id_fkey FOREIGN KEY (botnet_id) REFERENCES public.botnet(id);


--
-- Name: police_relations police_relations_crimes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_crimes_id_fkey FOREIGN KEY (crimes_id) REFERENCES public.crimes(id);


--
-- Name: police_relations police_relations_criminals_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_criminals_id_fkey FOREIGN KEY (criminals_id) REFERENCES public.criminals(id);


--
-- Name: police_relations police_relations_cybercriminals_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_cybercriminals_id_fkey FOREIGN KEY (cybercriminals_id) REFERENCES public.cybercriminals(id);


--
-- Name: police_relations police_relations_detectives_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_detectives_id_fkey FOREIGN KEY (detectives_id) REFERENCES public.detectives(id);


--
-- Name: police_relations police_relations_locations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_locations_id_fkey FOREIGN KEY (locations_id) REFERENCES public.locations(id);


--
-- Name: police_relations police_relations_policeofficers_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_policeofficers_id_fkey FOREIGN KEY (policeofficers_id) REFERENCES public.policeofficers(id);


--
-- Name: police_relations police_relations_policestation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_policestation_id_fkey FOREIGN KEY (policestation_id) REFERENCES public.policestation(id);


--
-- Name: police_relations police_relations_realtime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_realtime_id_fkey FOREIGN KEY (realtime_id) REFERENCES public.realtime(id);


--
-- Name: police_relations police_relations_simulation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_simulation_id_fkey FOREIGN KEY (simulation_id) REFERENCES public.simulation(id);


--
-- Name: police_relations police_relations_victims_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.police_relations
    ADD CONSTRAINT police_relations_victims_id_fkey FOREIGN KEY (victims_id) REFERENCES public.victims(id);


--
-- Name: rescue rescue_crime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.rescue
    ADD CONSTRAINT rescue_crime_id_fkey FOREIGN KEY (crime_id) REFERENCES public.crimes(id);


--
-- Name: theft theft_crime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.theft
    ADD CONSTRAINT theft_crime_id_fkey FOREIGN KEY (crime_id) REFERENCES public.crimes(id);


--
-- Name: victims victims_crime_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: debiana
--

ALTER TABLE ONLY public.victims
    ADD CONSTRAINT victims_crime_id_fkey FOREIGN KEY (crime_id) REFERENCES public.crimes(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

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
    IF NOT EXISTS (SELECT 1 FROM receptek WHERE receptek.receptid = $1)  THEN
       -- HA már létezik, beszúrunk egy új rekordot
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    fname character varying(100) NOT NULL,
    lname character varying(100) NOT NULL,
    email character varying(50) NOT NULL,
    country character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    cell_phone bigint NOT NULL,
    postal_code integer NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, fname, lname, email, country, city, cell_phone, postal_code) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO learner_role;


--
-- PostgreSQL database dump complete
--

--
-- Database "receptek" dump
--

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
-- Name: receptek; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE receptek WITH TEMPLATE = template0 ENCODING = 'SQL_ASCII' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE receptek OWNER TO postgres;

\connect receptek

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
8	8	8	\N	8	3	2
10	10	10	\N	10	2	3
4	4	4	\N	4	8	4
3	3	3	\N	3	7	5
6	6	6	\N	6	6	6
7	7	7	\N	7	4	7
5	5	5	\N	5	5	8
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

--
-- Database "receptek_utf8" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-0+deb12u1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-0+deb12u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: receptek_utf8; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE receptek_utf8 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'hu_HU.UTF-8';


ALTER DATABASE receptek_utf8 OWNER TO postgres;

\connect receptek_utf8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: interactiverecipeingredientsuploader(integer, integer, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.interactiverecipeingredientsuploader(receptid integer, "recept_sorszám" integer, "összetevő_id" integer, "mennyiség" integer, "mérték_mennyiség_id" integer, "összetevő_osztály_id" integer, "recept_osztály_id" integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
      IF EXISTS (SELECT 1 FROM recept_összetevők WHERE recept_összetevők.receptid = $1)  THEN
         RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
      ELSE
       -- Beszúrunk egy új rekordot
        INSERT INTO recept_összetevők (receptid, recept_sorszám, összetevő_id, mennyiség,  mérték_mennyiség_id, összetevő_osztály_id, recept_osztály_id)
        VALUES ($1, $2, $3, $4, $5, $6, $7);
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_sorszám = %, összetevő_id = %, mennyiség = %, mérték_mennyiség_id = %, összetevő_osztály_id = %, recept_osztály_id = %',  $1, $2, $3, $4, $5, $6, $7;
     END IF;
        EXCEPTION
     WHEN OTHERS THEN
        -- Hibakezelés
        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
        RAISE EXCEPTION 'Nem várt hiba fordult elő!';
  END;
 $_$;


ALTER FUNCTION public.interactiverecipeingredientsuploader(receptid integer, "recept_sorszám" integer, "összetevő_id" integer, "mennyiség" integer, "mérték_mennyiség_id" integer, "összetevő_osztály_id" integer, "recept_osztály_id" integer) OWNER TO postgres;

--
-- Name: interactiverecipeingredientsuploader(integer, integer, integer, numeric, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.interactiverecipeingredientsuploader(receptid integer, "recept_sorszám" integer, "összetevő_id" integer, "mennyiség" numeric, "mérték_mennyiség_id" integer, "összetevő_osztály_id" integer, "recept_osztály_id" integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
       -- Ellenőrizzük, hogy már létezik -e a megadott recept_id
      IF EXISTS (SELECT 1 FROM recept_összetevők WHERE recept_összetevők.receptid = $1)  THEN
         RAISE NOTICE 'Ez az ID már foglalt! Kérlek, válassz másikat!';
      ELSE
       -- Beszúrunk egy új rekordot
        INSERT INTO recept_összetevők (receptid, recept_sorszám, összetevő_id, mennyiség,  mérték_mennyiség_id, összetevő_osztály_id, recept_osztály_id)
        VALUES ($1, $2, $3, $4, $5, $6, $7);
        RAISE NOTICE 'A rekord sikeresen létrejött: receptid = %, recept_sorszám = %, összetevő_id = %, mennyiség = %, mérték_mennyiség_id = %, összetevő_osztály_id = %, recept_osztály_id = %',  $1, $2, $3, $4, $5, $6, $7;
     END IF;
        EXCEPTION
     WHEN OTHERS THEN
        -- Hibakezelés
        RAISE NOTICE 'Hiba történt a beszúrás során. Nem sikerült a művelet!';
        RAISE EXCEPTION 'Nem várt hiba fordult elő!';
  END;
 $_$;


ALTER FUNCTION public.interactiverecipeingredientsuploader(receptid integer, "recept_sorszám" integer, "összetevő_id" integer, "mennyiség" numeric, "mérték_mennyiség_id" integer, "összetevő_osztály_id" integer, "recept_osztály_id" integer) OWNER TO postgres;

--
-- Name: interactiverecipemultiuploader(text, text, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.interactiverecipemultiuploader(receptid text, "recept_sorszám" text, "összetevő_id" text, "mennyiség" text, "mérték_mennyiség_id" text, "összetevő_osztály_id" text, "recept_osztály_id" text) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.interactiverecipemultiuploader(receptid text, "recept_sorszám" text, "összetevő_id" text, "mennyiség" text, "mérték_mennyiség_id" text, "összetevő_osztály_id" text, "recept_osztály_id" text) OWNER TO postgres;

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
-- Name: backup_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backup_log (
    id integer NOT NULL,
    log_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    operation character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    error_message text,
    initiated_by character varying(50) DEFAULT 'System'::character varying
);


ALTER TABLE public.backup_log OWNER TO postgres;

--
-- Name: backup_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.backup_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.backup_log_id_seq OWNER TO postgres;

--
-- Name: backup_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.backup_log_id_seq OWNED BY public.backup_log.id;


--
-- Name: config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config (
    id integer NOT NULL,
    param_name text NOT NULL,
    param_value text NOT NULL,
    version_number integer DEFAULT 1,
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category character varying(50),
    description text
);


ALTER TABLE public.config OWNER TO postgres;

--
-- Name: config_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config_backup (
    id integer NOT NULL,
    original_id integer NOT NULL,
    param_name text NOT NULL,
    param_value text NOT NULL,
    version_number integer DEFAULT 1,
    last_updated timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category character varying(50),
    description text,
    backup_version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.config_backup OWNER TO postgres;

--
-- Name: config_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.config_backup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_backup_id_seq OWNER TO postgres;

--
-- Name: config_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.config_backup_id_seq OWNED BY public.config_backup.id;


--
-- Name: config_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_id_seq OWNER TO postgres;

--
-- Name: config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.config_id_seq OWNED BY public.config.id;


--
-- Name: configaudit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configaudit (
    id integer NOT NULL,
    config_id integer,
    param_name character varying(100),
    old_value character varying(255),
    new_value character varying(255),
    modified_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_by character varying(100)
);


ALTER TABLE public.configaudit OWNER TO postgres;

--
-- Name: configaudit_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configaudit_backup (
    id integer NOT NULL,
    original_id integer NOT NULL,
    config_id integer,
    param_name character varying(100),
    old_value character varying(255),
    new_value character varying(255),
    modified_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modified_by character varying(100),
    backup_version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.configaudit_backup OWNER TO postgres;

--
-- Name: configaudit_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configaudit_backup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configaudit_backup_id_seq OWNER TO postgres;

--
-- Name: configaudit_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configaudit_backup_id_seq OWNED BY public.configaudit_backup.id;


--
-- Name: configaudit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configaudit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configaudit_id_seq OWNER TO postgres;

--
-- Name: configaudit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configaudit_id_seq OWNED BY public.configaudit.id;


--
-- Name: mértékek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."mértékek" (
    "mérték_mennyiség_id" integer NOT NULL,
    "mérés_leírás" character varying(30) NOT NULL
);


ALTER TABLE public."mértékek" OWNER TO postgres;

--
-- Name: mértékek_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."mértékek_backup" (
    id integer NOT NULL,
    original_id integer NOT NULL,
    "mérés_leírás" character varying(30) NOT NULL,
    version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."mértékek_backup" OWNER TO postgres;

--
-- Name: mértékek_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."mértékek_backup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."mértékek_backup_id_seq" OWNER TO postgres;

--
-- Name: mértékek_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."mértékek_backup_id_seq" OWNED BY public."mértékek_backup".id;


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
-- Name: recept_osztályok; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."recept_osztályok" (
    "recept_osztály_id" integer NOT NULL,
    "recept_osztály_név" character varying(50) NOT NULL
);


ALTER TABLE public."recept_osztályok" OWNER TO postgres;

--
-- Name: recept_osztályok_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."recept_osztályok_backup" (
    id integer NOT NULL,
    original_id integer NOT NULL,
    "recept_osztály_név" character varying(50) NOT NULL,
    version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."recept_osztályok_backup" OWNER TO postgres;

--
-- Name: recept_osztályok_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."recept_osztályok_backup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recept_osztályok_backup_id_seq" OWNER TO postgres;

--
-- Name: recept_osztályok_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."recept_osztályok_backup_id_seq" OWNED BY public."recept_osztályok_backup".id;


--
-- Name: recept_osztályok_recept_osztály_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."recept_osztályok_recept_osztály_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recept_osztályok_recept_osztály_id_seq" OWNER TO postgres;

--
-- Name: recept_osztályok_recept_osztály_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."recept_osztályok_recept_osztály_id_seq" OWNED BY public."recept_osztályok"."recept_osztály_id";


--
-- Name: recept_összetevők; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."recept_összetevők" (
    receptid integer NOT NULL,
    "recept_sorszám" integer NOT NULL,
    "összetevő_id" integer,
    "mennyiség" integer,
    "mérték_mennyiség_id" integer,
    "összetevő_osztály_id" integer,
    "recept_osztály_id" integer
);


ALTER TABLE public."recept_összetevők" OWNER TO postgres;

--
-- Name: recept_összetevők_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."recept_összetevők_backup" (
    id integer NOT NULL,
    original_id integer NOT NULL,
    receptid integer NOT NULL,
    "recept_sorszám" integer NOT NULL,
    "összetevő_id" integer,
    "mennyiség" integer,
    "mérték_mennyiség_id" integer,
    "összetevő_osztály_id" integer,
    "recept_osztály_id" integer,
    version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."recept_összetevők_backup" OWNER TO postgres;

--
-- Name: recept_összetevők_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."recept_összetevők_backup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."recept_összetevők_backup_id_seq" OWNER TO postgres;

--
-- Name: recept_összetevők_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."recept_összetevők_backup_id_seq" OWNED BY public."recept_összetevők_backup".id;


--
-- Name: receptek; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receptek (
    receptid integer NOT NULL,
    "recept_név" character varying(50),
    "elkészítés" character varying(300),
    jegyzet character varying(100),
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
-- Name: receptek_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receptek_backup (
    id integer NOT NULL,
    original_id integer NOT NULL,
    "recept_név" character varying(50),
    "elkészítés" character varying(300),
    jegyzet character varying(100),
    "recept_osztály_id" integer,
    version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.receptek_backup OWNER TO postgres;

--
-- Name: receptek_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receptek_backup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receptek_backup_id_seq OWNER TO postgres;

--
-- Name: receptek_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receptek_backup_id_seq OWNED BY public.receptek_backup.id;


--
-- Name: receptek_receptid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receptek_receptid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receptek_receptid_seq OWNER TO postgres;

--
-- Name: receptek_receptid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receptek_receptid_seq OWNED BY public.receptek.receptid;


--
-- Name: összetevők; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."összetevők" (
    "összetevő_id" integer NOT NULL,
    "összetevő_név" character varying(30) NOT NULL,
    "összetevő_osztály_id" integer,
    "mérték_mennyiség_id" integer
);


ALTER TABLE public."összetevők" OWNER TO postgres;

--
-- Name: összetevők_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."összetevők_backup" (
    id integer NOT NULL,
    original_id integer NOT NULL,
    "összetevő_név" character varying(30) NOT NULL,
    "összetevő_osztály_id" integer,
    "mérték_mennyiség_id" integer,
    version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."összetevők_backup" OWNER TO postgres;

--
-- Name: összetevők_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."összetevők_backup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."összetevők_backup_id_seq" OWNER TO postgres;

--
-- Name: összetevők_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."összetevők_backup_id_seq" OWNED BY public."összetevők_backup".id;


--
-- Name: összetevők_osztály; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."összetevők_osztály" (
    "összetevő_osztály_id" integer NOT NULL,
    "összetevő_osztály_leírás" character varying(30) NOT NULL
);


ALTER TABLE public."összetevők_osztály" OWNER TO postgres;

--
-- Name: összetevők_osztály_backup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."összetevők_osztály_backup" (
    id integer NOT NULL,
    original_id integer NOT NULL,
    "összetevő_osztály_leírás" character varying(30) NOT NULL,
    version integer DEFAULT 1,
    backup_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public."összetevők_osztály_backup" OWNER TO postgres;

--
-- Name: összetevők_osztály_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."összetevők_osztály_backup_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."összetevők_osztály_backup_id_seq" OWNER TO postgres;

--
-- Name: összetevők_osztály_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."összetevők_osztály_backup_id_seq" OWNED BY public."összetevők_osztály_backup".id;


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
-- Name: backup_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backup_log ALTER COLUMN id SET DEFAULT nextval('public.backup_log_id_seq'::regclass);


--
-- Name: config id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config ALTER COLUMN id SET DEFAULT nextval('public.config_id_seq'::regclass);


--
-- Name: config_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_backup ALTER COLUMN id SET DEFAULT nextval('public.config_backup_id_seq'::regclass);


--
-- Name: configaudit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configaudit ALTER COLUMN id SET DEFAULT nextval('public.configaudit_id_seq'::regclass);


--
-- Name: configaudit_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configaudit_backup ALTER COLUMN id SET DEFAULT nextval('public.configaudit_backup_id_seq'::regclass);


--
-- Name: mértékek mérték_mennyiség_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek" ALTER COLUMN "mérték_mennyiség_id" SET DEFAULT nextval('public."mértékek_mérték_mennyiség_id_seq"'::regclass);


--
-- Name: mértékek_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek_backup" ALTER COLUMN id SET DEFAULT nextval('public."mértékek_backup_id_seq"'::regclass);


--
-- Name: recept_osztályok recept_osztály_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok" ALTER COLUMN "recept_osztály_id" SET DEFAULT nextval('public."recept_osztályok_recept_osztály_id_seq"'::regclass);


--
-- Name: recept_osztályok_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok_backup" ALTER COLUMN id SET DEFAULT nextval('public."recept_osztályok_backup_id_seq"'::regclass);


--
-- Name: recept_összetevők_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup" ALTER COLUMN id SET DEFAULT nextval('public."recept_összetevők_backup_id_seq"'::regclass);


--
-- Name: receptek receptid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek ALTER COLUMN receptid SET DEFAULT nextval('public.receptek_receptid_seq'::regclass);


--
-- Name: receptek_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek_backup ALTER COLUMN id SET DEFAULT nextval('public.receptek_backup_id_seq'::regclass);


--
-- Name: összetevők összetevő_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők" ALTER COLUMN "összetevő_id" SET DEFAULT nextval('public."összetevők_összetevő_id_seq"'::regclass);


--
-- Name: összetevők_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_backup" ALTER COLUMN id SET DEFAULT nextval('public."összetevők_backup_id_seq"'::regclass);


--
-- Name: összetevők_osztály összetevő_osztály_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_osztály" ALTER COLUMN "összetevő_osztály_id" SET DEFAULT nextval('public."összetevők_osztály_összetevő_osztály_id_seq"'::regclass);


--
-- Name: összetevők_osztály_backup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_osztály_backup" ALTER COLUMN id SET DEFAULT nextval('public."összetevők_osztály_backup_id_seq"'::regclass);


--
-- Data for Name: backup_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backup_log (id, log_timestamp, operation, status, error_message, initiated_by) FROM stdin;
\.


--
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config (id, param_name, param_value, version_number, last_updated, category, description) FROM stdin;
1	csv_path	/home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/recept_összetevők_tömeges_upl/data_utf8.csv	1	2025-05-17 01:09:44.726194	\N	\N
\.


--
-- Data for Name: config_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config_backup (id, original_id, param_name, param_value, version_number, last_updated, category, description, backup_version, backup_timestamp) FROM stdin;
\.


--
-- Data for Name: configaudit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configaudit (id, config_id, param_name, old_value, new_value, modified_at, modified_by) FROM stdin;
\.


--
-- Data for Name: configaudit_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configaudit_backup (id, original_id, config_id, param_name, old_value, new_value, modified_at, modified_by, backup_version, backup_timestamp) FROM stdin;
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
-- Data for Name: mértékek_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."mértékek_backup" (id, original_id, "mérés_leírás", version, backup_timestamp) FROM stdin;
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
-- Data for Name: recept_osztályok_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."recept_osztályok_backup" (id, original_id, "recept_osztály_név", version, backup_timestamp) FROM stdin;
\.


--
-- Data for Name: recept_összetevők; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."recept_összetevők" (receptid, "recept_sorszám", "összetevő_id", "mennyiség", "mérték_mennyiség_id", "összetevő_osztály_id", "recept_osztály_id") FROM stdin;
8	8	8	\N	8	3	2
10	10	10	\N	10	2	3
4	4	4	\N	4	8	4
3	3	3	\N	3	7	5
6	6	6	\N	6	6	6
7	7	7	\N	7	4	7
5	5	5	\N	5	5	8
2	2	2	\N	2	1	1
1	1	95	30	8	8	5
11	11	47	50	8	4	1
16	16	95	80	8	8	2
17	17	99	40	8	16	2
18	18	95	50	8	8	2
19	19	34	10	6	5	2
20	20	122	50	8	8	6
21	21	47	1	10	4	6
22	22	57	50	8	4	6
23	23	58	50	8	4	6
24	24	52	60	8	4	6
25	25	54	1	10	4	6
26	26	61	1	10	4	6
27	27	52	1	10	4	6
28	28	53	1	10	4	6
29	29	23	1	10	3	3
30	30	23	1	10	3	3
31	31	22	1	10	3	3
32	32	50	1	10	3	4
33	33	123	50	8	8	3
34	34	52	50	8	4	3
35	35	174	1	10	4	3
36	36	175	1	10	4	3
37	37	64	60	8	4	3
38	38	48	50	8	4	3
39	39	53	70	8	4	3
40	40	22	1	10	3	5
41	41	24	1	10	3	5
42	42	137	1	10	3	5
43	43	23	1	10	3	5
44	44	138	1	10	3	5
45	45	137	1	10	3	8
46	46	22	70	8	3	5
47	47	22	80	8	3	8
48	48	24	70	8	3	8
49	49	24	1	10	3	8
50	50	22	1	10	3	8
51	51	122	60	8	8	6
52	52	55	1	10	4	6
53	53	142	70	8	12	6
54	54	47	1	10	4	6
55	55	46	70	8	5	6
56	56	50	80	8	4	6
57	57	47	1	10	4	6
58	58	93	50	8	8	6
59	59	137	50	8	8	6
60	60	149	1	10	4	7
61	61	149	1	10	4	7
62	62	55	1	10	4	7
63	63	150	1	10	4	7
64	64	151	1	10	4	7
65	65	152	1	10	4	7
66	66	154	1	10	4	7
67	67	142	1	10	4	7
68	68	24	1	10	3	8
69	69	22	1	10	3	8
70	70	24	1	10	3	8
71	71	157	70	8	3	8
72	72	156	70	8	3	8
73	73	22	1	10	3	8
74	74	23	1	10	3	8
75	75	24	1	10	3	8
76	76	35	50	8	5	9
77	77	64	70	8	4	9
78	78	63	1	10	4	9
79	79	63	1	10	4	9
80	80	64	70	8	4	9
81	81	40	50	8	6	9
82	82	174	80	8	4	6
83	83	31	50	8	3	10
84	84	52	50	8	4	10
85	85	50	80	8	4	10
86	86	91	40	8	4	10
87	87	22	60	8	3	10
88	88	56	40	8	4	10
89	89	165	1	10	7	11
90	90	166	1	10	7	11
91	91	34	5	5	5	11
92	92	169	5	5	16	11
93	93	175	5	5	5	11
94	94	49	10	8	4	11
95	95	75	10	8	4	11
96	96	81	10	8	8	11
97	97	177	10	8	12	11
98	98	178	10	8	12	11
99	99	171	50	9	10	11
100	100	24	1	10	3	6
101	101	172	50	8	12	5
102	102	103	30	8	11	6
104	104	122	50	8	8	6
106	106	24	70	8	3	6
108	108	46	50	8	5	6
109	109	51	70	8	4	6
105	105	22	1	10	3	6
107	107	23	70	8	3	5
110	110	137	50	8	3	6
111	111	109	1	10	7	2
112	112	22	1	10	3	6
113	113	32	50	8	3	5
114	114	44	70	8	5	5
115	115	168	60	8	16	2
116	116	179	50	8	6	9
117	117	39	50	8	6	2
118	118	56	30	8	4	9
119	119	169	10	8	16	2
120	120	47	1	10	4	5
121	121	55	1	10	4	5
\.


--
-- Data for Name: recept_összetevők_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."recept_összetevők_backup" (id, original_id, receptid, "recept_sorszám", "összetevő_id", "mennyiség", "mérték_mennyiség_id", "összetevő_osztály_id", "recept_osztály_id", version, backup_timestamp) FROM stdin;
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
17	gesztenyepüré	Törj össze gesztenyét, keverd össze vaníliával és cukorral, tejszínhabbal tállald	Téli ételekhez jól illik	2	\N	\N	\N	\N	Tejszínhab	\N	Kristálycukor	\N	\N	Vanília	\N	\N	\N	\N	\N	gesztenye_massza	\N	\N	\N
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
1	Lángos	Süsd meg	Edd meg	5	Nincs	Étolaj	Nincs	Fokhagyma	Tejföl	Nincs	Liszt	Nincs	Nincs	Só	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
100	Brassói aprópecsenye	Süsd szaftosra a sertés húst, vöröshagymával, fokhagymásal, sózd-borsozd, tálald sültburgonyával	Családi kedvenc	5	Nincs	Sertés zsír	Sertés	Vöröshagyma	Nincs	Nincs	Nincs	Nincs	Nincs	ÖSó	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
101	Rántott párizsi	Panírozz ujjnyi vastag párizsi szeleteket, süsd meg forró étolajban, tálal rizs körettel	Gyors és finom vacsora	5	Nincs	Étolaj	Nincs	Nincs	Nincs	Nincs	Liszt	Tojás	Nincs	Vegeta	Nincs	Párizsi	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
102	Diós tészta	Főzz tésztát, tálald darált dióval és porcukorral	Nagyi kedvence	6	Víz	Étolaj	Nincs	Nincs	Nincs	Nincs	Spagetti	Nincs	Nincs	Nincs	Dió	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
104	Chilis bab	Főzd meg a babot, párolj vöröshagymát,  keverd össze  babbl, adj hozzá chilit	Csípős fogás	6	Víz	Étolaj	Nincs	Vöröshagyma	Nincs	Nincs	Bab	Nincs	Nincs	Chili	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
106	Lecsós tokány	Főzz lecsó alapot, add hozzá a csíkokra vágott sertés tokányt, főzd össze, színezd pirospaprikával	Tipikusan magyar, nyári fogás	6	Nincs	Sertés zsír	Sertés	Paradicsom	Nincs	Nincs	Nincs	Nincs	Nincs	Pirospaprika	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
108	Túróscsusza	Piríts szalonnát, keverd össze túróval és főtt kockatésztával, tálald tejföllel	Tipikus magyar étel	6	Víz	Sertés zsír	Nincs	Nincs	Túró	Nincs	Kockatészta	Nincs	Nincs	Só	Nincs	Szalonna	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
109	Töltött paprika	Készíts tölteléket darálthúsból, rízsból, tojásból, adj hozzá sót, fokhagymát, borsot, pirospaptikát. Töltsd a kicsumázott TV papikprikába, főzd meg paradicsomos szószban	Tipikusan magyar, nyári fogás	6	Víz	Étolaj	Sertés	Paprika	Nincs	Rizs	Nincs	Tojás	Nincs	Só	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs	Nincs
11	kockatészta	Főzd meg a kockatésztát sós vízben 8-10 percig.	Nagyszerű köret pörkölthöz.	1	víz	napraforgóolaj	\N	\N	\N	\N	Kockatészta	\N	\N	Só	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: receptek_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receptek_backup (id, original_id, "recept_név", "elkészítés", jegyzet, "recept_osztály_id", version, backup_timestamp) FROM stdin;
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
53	Zöldbab	4	\N
54	Kelkáposzta	4	\N
55	Fejeskáposzta	4	\N
56	Fejessaláta	4	\N
57	Spenót	4	\N
58	Sóska	4	\N
59	Sárgarépa	4	\N
60	Zeller	4	\N
62	Gyökér	4	\N
63	Cukkini	4	\N
64	Gomba	4	\N
65	Pirospaprika	7	\N
67	Egész bors	7	\N
68	Vegeta	7	\N
69	Delikát	7	\N
70	Örölt kömény	7	\N
71	Szemes kömény	7	\N
72	Majoranna	7	\N
73	Tárkony	7	\N
74	Füstölt paprika	7	\N
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
42	Szejtán szelet	6	\N
52	Zöldborsó	4	\N
75	Chili	4	\N
66	Fekete bors	7	\N
109	Alma	7	\N
164	Vinaigrette öntet	17	\N
165	Sárgabarack	7	\N
166	Szilva	7	\N
167	Meggy	7	\N
168	Étcsokoládé	16	\N
169	Tejcsokoládé	16	\N
170	Vanília	8	\N
171	Fahéj	10	\N
172	Párizsi	12	\N
173	Tarhonya	8	\N
61	Karalábé	4	\N
174	Karfiol	4	\N
175	Brokkoli	4	\N
176	Tejföl	5	\N
76	Babérlevél	10	\N
177	Méz	12	\N
178	Juharszirup	12	\N
179	Quinoa	6	8
180	Zabpehely	6	8
181	Szójaszósz	17	5
182	Besamel	17	5
183	Mangószósz	17	5
184	Szerecsendió	10	1
185	Vegán sajt	9	8
\.


--
-- Data for Name: összetevők_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."összetevők_backup" (id, original_id, "összetevő_név", "összetevő_osztály_id", "mérték_mennyiség_id", version, backup_timestamp) FROM stdin;
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
-- Data for Name: összetevők_osztály_backup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."összetevők_osztály_backup" (id, original_id, "összetevő_osztály_leírás", version, backup_timestamp) FROM stdin;
\.


--
-- Name: backup_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.backup_log_id_seq', 1, false);


--
-- Name: config_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.config_backup_id_seq', 1, false);


--
-- Name: config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.config_id_seq', 1, true);


--
-- Name: configaudit_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configaudit_backup_id_seq', 1, false);


--
-- Name: configaudit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configaudit_id_seq', 1, false);


--
-- Name: mértékek_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."mértékek_backup_id_seq"', 1, false);


--
-- Name: mértékek_mérték_mennyiség_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."mértékek_mérték_mennyiség_id_seq"', 1, false);


--
-- Name: recept_osztályok_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recept_osztályok_backup_id_seq"', 1, false);


--
-- Name: recept_osztályok_recept_osztály_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recept_osztályok_recept_osztály_id_seq"', 1, false);


--
-- Name: recept_összetevők_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."recept_összetevők_backup_id_seq"', 1, false);


--
-- Name: receptek_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receptek_backup_id_seq', 1, false);


--
-- Name: receptek_receptid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receptek_receptid_seq', 10, true);


--
-- Name: összetevők_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."összetevők_backup_id_seq"', 1, false);


--
-- Name: összetevők_osztály_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."összetevők_osztály_backup_id_seq"', 1, false);


--
-- Name: összetevők_osztály_összetevő_osztály_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."összetevők_osztály_összetevő_osztály_id_seq"', 1, false);


--
-- Name: összetevők_összetevő_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."összetevők_összetevő_id_seq"', 1, false);


--
-- Name: backup_log backup_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backup_log
    ADD CONSTRAINT backup_log_pkey PRIMARY KEY (id);


--
-- Name: config_backup config_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_backup
    ADD CONSTRAINT config_backup_pkey PRIMARY KEY (id);


--
-- Name: config config_param_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_param_name_key UNIQUE (param_name);


--
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id);


--
-- Name: configaudit_backup configaudit_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configaudit_backup
    ADD CONSTRAINT configaudit_backup_pkey PRIMARY KEY (id);


--
-- Name: configaudit configaudit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configaudit
    ADD CONSTRAINT configaudit_pkey PRIMARY KEY (id);


--
-- Name: mértékek_backup mértékek_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek_backup"
    ADD CONSTRAINT "mértékek_backup_pkey" PRIMARY KEY (id);


--
-- Name: mértékek mértékek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek"
    ADD CONSTRAINT "mértékek_pkey" PRIMARY KEY ("mérték_mennyiség_id");


--
-- Name: recept_osztályok_backup recept_osztályok_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok_backup"
    ADD CONSTRAINT "recept_osztályok_backup_pkey" PRIMARY KEY (id);


--
-- Name: recept_osztályok recept_osztályok_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok"
    ADD CONSTRAINT "recept_osztályok_pkey" PRIMARY KEY ("recept_osztály_id");


--
-- Name: recept_összetevők_backup recept_összetevők_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup"
    ADD CONSTRAINT "recept_összetevők_backup_pkey" PRIMARY KEY (id);


--
-- Name: recept_összetevők recept_összetevők_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "recept_összetevők_pkey" PRIMARY KEY (receptid, "recept_sorszám");


--
-- Name: receptek_backup receptek_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek_backup
    ADD CONSTRAINT receptek_backup_pkey PRIMARY KEY (id);


--
-- Name: receptek receptek_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek
    ADD CONSTRAINT receptek_pkey PRIMARY KEY (receptid);


--
-- Name: összetevők_backup összetevők_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_backup"
    ADD CONSTRAINT "összetevők_backup_pkey" PRIMARY KEY (id);


--
-- Name: összetevők_osztály_backup összetevők_osztály_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_osztály_backup"
    ADD CONSTRAINT "összetevők_osztály_backup_pkey" PRIMARY KEY (id);


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
-- Name: receptek_composite_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX receptek_composite_index ON public.receptek USING btree (receptid, "recept_osztály_id");


--
-- Name: config_backup config_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_backup
    ADD CONSTRAINT config_backup_original_id_fkey FOREIGN KEY (original_id) REFERENCES public.config(id) ON DELETE CASCADE;


--
-- Name: configaudit_backup configaudit_backup_config_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configaudit_backup
    ADD CONSTRAINT configaudit_backup_config_id_fkey FOREIGN KEY (config_id) REFERENCES public.config(id) ON DELETE CASCADE;


--
-- Name: configaudit_backup configaudit_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configaudit_backup
    ADD CONSTRAINT configaudit_backup_original_id_fkey FOREIGN KEY (original_id) REFERENCES public.configaudit(id) ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_mérték_mennyiség_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_mérték_mennyiség_id" FOREIGN KEY ("mérték_mennyiség_id") REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_recept_osztály_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_recept_osztály_id" FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE CASCADE;


--
-- Name: receptek fk_recept_osztály_id_receptid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek
    ADD CONSTRAINT "fk_recept_osztály_id_receptid" FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_összetevő_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_összetevő_id" FOREIGN KEY ("összetevő_id") REFERENCES public."összetevők"("összetevő_id") ON DELETE CASCADE;


--
-- Name: összetevők fk_összetevő_osztály_id_összetevő_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők"
    ADD CONSTRAINT "fk_összetevő_osztály_id_összetevő_id" FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők fk_összetevő_osztáy_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők"
    ADD CONSTRAINT "fk_összetevő_osztáy_id" FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- Name: mértékek_backup mértékek_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."mértékek_backup"
    ADD CONSTRAINT "mértékek_backup_original_id_fkey" FOREIGN KEY (original_id) REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE CASCADE;


--
-- Name: recept_osztályok_backup recept_osztályok_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_osztályok_backup"
    ADD CONSTRAINT "recept_osztályok_backup_original_id_fkey" FOREIGN KEY (original_id) REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők_backup recept_összetevők_backup_mérték_mennyiség_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup"
    ADD CONSTRAINT "recept_összetevők_backup_mérték_mennyiség_id_fkey" FOREIGN KEY ("mérték_mennyiség_id") REFERENCES public."mértékek"("mérték_mennyiség_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők_backup recept_összetevők_backup_recept_osztály_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup"
    ADD CONSTRAINT "recept_összetevők_backup_recept_osztály_id_fkey" FOREIGN KEY ("recept_osztály_id") REFERENCES public."recept_osztályok"("recept_osztály_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők_backup recept_összetevők_backup_receptid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup"
    ADD CONSTRAINT "recept_összetevők_backup_receptid_fkey" FOREIGN KEY (receptid) REFERENCES public.receptek(receptid) ON DELETE CASCADE;


--
-- Name: recept_összetevők_backup recept_összetevők_backup_összetevő_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup"
    ADD CONSTRAINT "recept_összetevők_backup_összetevő_id_fkey" FOREIGN KEY ("összetevő_id") REFERENCES public."összetevők"("összetevő_id") ON DELETE CASCADE;


--
-- Name: recept_összetevők_backup recept_összetevők_backup_összetevő_osztály_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."recept_összetevők_backup"
    ADD CONSTRAINT "recept_összetevők_backup_összetevő_osztály_id_fkey" FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- Name: receptek_backup receptek_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receptek_backup
    ADD CONSTRAINT receptek_backup_original_id_fkey FOREIGN KEY (original_id) REFERENCES public.receptek(receptid) ON DELETE CASCADE;


--
-- Name: összetevők_backup összetevők_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_backup"
    ADD CONSTRAINT "összetevők_backup_original_id_fkey" FOREIGN KEY (original_id) REFERENCES public."összetevők"("összetevő_id") ON DELETE CASCADE;


--
-- Name: összetevők_backup összetevők_backup_összetevő_osztály_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_backup"
    ADD CONSTRAINT "összetevők_backup_összetevő_osztály_id_fkey" FOREIGN KEY ("összetevő_osztály_id") REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- Name: összetevők_osztály_backup összetevők_osztály_backup_original_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."összetevők_osztály_backup"
    ADD CONSTRAINT "összetevők_osztály_backup_original_id_fkey" FOREIGN KEY (original_id) REFERENCES public."összetevők_osztály"("összetevő_osztály_id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

