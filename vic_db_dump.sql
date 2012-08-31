--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: VIC; Type: DATABASE; Schema: -; Owner: mschrimshaw
--

CREATE DATABASE "VIC" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C' TABLESPACE = vic_tablespace;


ALTER DATABASE "VIC" OWNER TO mschrimshaw;

\connect "VIC"

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: VIC; Type: COMMENT; Schema: -; Owner: mschrimshaw
--

COMMENT ON DATABASE "VIC" IS 'vaccine ingredients calculator database';


--
-- Name: vic; Type: SCHEMA; Schema: -; Owner: mschrimshaw
--

CREATE SCHEMA vic;


ALTER SCHEMA vic OWNER TO mschrimshaw;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = vic, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: disease; Type: TABLE; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE TABLE disease (
    disease_id integer NOT NULL,
    vaccine_type_id integer NOT NULL,
    disease character varying(50) NOT NULL
);


ALTER TABLE vic.disease OWNER TO mschrimshaw;

--
-- Name: TABLE disease; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON TABLE disease IS 'diseases for which vaccinations are given for';


--
-- Name: COLUMN disease.disease; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN disease.disease IS 'disease name';


--
-- Name: disease_id_seq; Type: SEQUENCE; Schema: vic; Owner: mschrimshaw
--

CREATE SEQUENCE disease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.disease_id_seq OWNER TO mschrimshaw;

--
-- Name: disease_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: mschrimshaw
--

ALTER SEQUENCE disease_id_seq OWNED BY disease.disease_id;


--
-- Name: disease_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: mschrimshaw
--

SELECT pg_catalog.setval('disease_id_seq', 27, true);


--
-- Name: manufacturer; Type: TABLE; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE TABLE manufacturer (
    manufacturer_id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    mvx character varying(3) NOT NULL
);


ALTER TABLE vic.manufacturer OWNER TO mschrimshaw;

--
-- Name: TABLE manufacturer; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON TABLE manufacturer IS 'vaccine manufacturers';


--
-- Name: COLUMN manufacturer.company_name; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN manufacturer.company_name IS 'vaccine manufacturer company';


--
-- Name: COLUMN manufacturer.mvx; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN manufacturer.mvx IS 'CDC MVX manufacturer code';


--
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE; Schema: vic; Owner: mschrimshaw
--

CREATE SEQUENCE manufacturer_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.manufacturer_manufacturer_id_seq OWNER TO mschrimshaw;

--
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: mschrimshaw
--

ALTER SEQUENCE manufacturer_manufacturer_id_seq OWNED BY manufacturer.manufacturer_id;


--
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: mschrimshaw
--

SELECT pg_catalog.setval('manufacturer_manufacturer_id_seq', 6, true);


--
-- Name: test; Type: TABLE; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE TABLE test (
    a numeric
);


ALTER TABLE vic.test OWNER TO mschrimshaw;

--
-- Name: vaccine_components; Type: TABLE; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE TABLE vaccine_components (
    component_id integer NOT NULL,
    vaccine_id integer NOT NULL,
    vaccine_component character varying(100) NOT NULL,
    dose numeric NOT NULL,
    dose_measurement character varying(3) NOT NULL,
    current_as_of timestamp without time zone DEFAULT now()
);


ALTER TABLE vic.vaccine_components OWNER TO mschrimshaw;

--
-- Name: TABLE vaccine_components; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON TABLE vaccine_components IS 'components present in a vaccine';


--
-- Name: COLUMN vaccine_components.component_id; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccine_components.component_id IS 'FK on vaccine.id';


--
-- Name: COLUMN vaccine_components.vaccine_component; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccine_components.vaccine_component IS 'name of vaccine component/antigen/adjuvant';


--
-- Name: COLUMN vaccine_components.dose; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccine_components.dose IS 'amount of antigen/adjuvant/etc present (mg or mcg)';


--
-- Name: COLUMN vaccine_components.dose_measurement; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccine_components.dose_measurement IS 'mg, mcg, or ml dose scale';


--
-- Name: vaccine_components_component_id_seq; Type: SEQUENCE; Schema: vic; Owner: mschrimshaw
--

CREATE SEQUENCE vaccine_components_component_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.vaccine_components_component_id_seq OWNER TO mschrimshaw;

--
-- Name: vaccine_components_component_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: mschrimshaw
--

ALTER SEQUENCE vaccine_components_component_id_seq OWNED BY vaccine_components.component_id;


--
-- Name: vaccine_components_component_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: mschrimshaw
--

SELECT pg_catalog.setval('vaccine_components_component_id_seq', 61, true);


--
-- Name: vaccines; Type: TABLE; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE TABLE vaccines (
    vaccine_id integer NOT NULL,
    manufacturer_id integer NOT NULL,
    vaccine_type_id integer NOT NULL,
    vaccine_name character varying(50) NOT NULL,
    combo_vaccine bit(1) NOT NULL,
    dose numeric(3,1) DEFAULT 0.5 NOT NULL,
    dose_measurement character varying(3) DEFAULT 'ml'::character varying NOT NULL,
    current_as_of timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE vic.vaccines OWNER TO mschrimshaw;

--
-- Name: TABLE vaccines; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON TABLE vaccines IS 'vaccine base table';


--
-- Name: COLUMN vaccines.manufacturer_id; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccines.manufacturer_id IS 'FK on manufacturer.id';


--
-- Name: COLUMN vaccines.vaccine_name; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccines.vaccine_name IS 'Marketing name of vaccine product';


--
-- Name: COLUMN vaccines.dose; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccines.dose IS 'dose of vaccine to be administered ';


--
-- Name: vaccine_id_seq; Type: SEQUENCE; Schema: vic; Owner: mschrimshaw
--

CREATE SEQUENCE vaccine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.vaccine_id_seq OWNER TO mschrimshaw;

--
-- Name: vaccine_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: mschrimshaw
--

ALTER SEQUENCE vaccine_id_seq OWNED BY vaccines.vaccine_id;


--
-- Name: vaccine_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: mschrimshaw
--

SELECT pg_catalog.setval('vaccine_id_seq', 10, true);


--
-- Name: vaccine_type; Type: TABLE; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE TABLE vaccine_type (
    vaccine_type_id integer NOT NULL,
    name character varying(25) NOT NULL,
    cvx smallint NOT NULL
);


ALTER TABLE vic.vaccine_type OWNER TO mschrimshaw;

--
-- Name: TABLE vaccine_type; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON TABLE vaccine_type IS 'Vaccine types (DTaP, Hib, MMR, etc)';


--
-- Name: COLUMN vaccine_type.cvx; Type: COMMENT; Schema: vic; Owner: mschrimshaw
--

COMMENT ON COLUMN vaccine_type.cvx IS 'CDC CVX code for vaccine type';


--
-- Name: vaccine_type_id_seq; Type: SEQUENCE; Schema: vic; Owner: mschrimshaw
--

CREATE SEQUENCE vaccine_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.vaccine_type_id_seq OWNER TO mschrimshaw;

--
-- Name: vaccine_type_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: mschrimshaw
--

ALTER SEQUENCE vaccine_type_id_seq OWNED BY vaccine_type.vaccine_type_id;


--
-- Name: vaccine_type_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: mschrimshaw
--

SELECT pg_catalog.setval('vaccine_type_id_seq', 20, true);


--
-- Name: disease_id; Type: DEFAULT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY disease ALTER COLUMN disease_id SET DEFAULT nextval('disease_id_seq'::regclass);


--
-- Name: manufacturer_id; Type: DEFAULT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY manufacturer ALTER COLUMN manufacturer_id SET DEFAULT nextval('manufacturer_manufacturer_id_seq'::regclass);


--
-- Name: component_id; Type: DEFAULT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY vaccine_components ALTER COLUMN component_id SET DEFAULT nextval('vaccine_components_component_id_seq'::regclass);


--
-- Name: vaccine_type_id; Type: DEFAULT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY vaccine_type ALTER COLUMN vaccine_type_id SET DEFAULT nextval('vaccine_type_id_seq'::regclass);


--
-- Name: vaccine_id; Type: DEFAULT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY vaccines ALTER COLUMN vaccine_id SET DEFAULT nextval('vaccine_id_seq'::regclass);


--
-- Data for Name: disease; Type: TABLE DATA; Schema: vic; Owner: mschrimshaw
--

COPY disease (disease_id, vaccine_type_id, disease) FROM stdin;
1	1	Pertussis
2	1	Diphtheria
3	1	Tetanus
4	1	Pertussis
5	1	Diphtheria
6	1	Tetanus
7	6	Hib
8	6	Hib
9	9	Measles
10	9	Mumps
11	9	Rubella
12	9	Measles
13	9	Mumps
14	9	Rubella
15	11	Varicella
16	11	Varicella
17	18	Pneumococcal
18	19	Pneumococcal
19	20	Pneumococcal
20	12	Hepatitis B
21	13	Hepatitis B
22	14	Hepatitis B
23	17	Polio
24	15	Human Papaloma Virus 4
25	16	Human Papaloma Virus 2
27	8	Hib-Hep B
\.


--
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: vic; Owner: mschrimshaw
--

COPY manufacturer (manufacturer_id, company_name, mvx) FROM stdin;
1	Sanofi Pasteur SA	PMC
2	GlaxoSmithKline	SKB
3	Merck	MSD
4	Pfizer	PFR
5	Novartis	NOV
6	MedImmune	MED
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: vic; Owner: mschrimshaw
--

COPY test (a) FROM stdin;
0.100
7.4
\.


--
-- Data for Name: vaccine_components; Type: TABLE DATA; Schema: vic; Owner: mschrimshaw
--

COPY vaccine_components (component_id, vaccine_id, vaccine_component, dose, dose_measurement, current_as_of) FROM stdin;
1	1	formaldehyde	0.100	mg	2012-08-30 19:57:46.404868
2	1	thimerosal	0.03	mg	2012-08-30 19:57:46.404868
3	1	pertussis antigen	0.0468	mg	2012-08-30 19:57:46.404868
4	1	diptheria toxoid	6.7	Lf	2012-08-30 19:57:46.404868
5	1	aluminum potassium sulfate	0.170	mg	2012-08-30 19:57:46.404868
6	1	tetanus toxoid	5	Lf	2012-08-30 19:57:46.404868
7	1	polysorbate 80	0	mg	2012-08-30 19:57:46.404868
8	1	gelatin	0	mg	2012-08-30 19:57:46.404868
9	4	formaldehyde	0.100	mg	2012-08-30 19:57:46.404868
10	4	thimerosal	0.03	mg	2012-08-30 19:57:46.404868
11	4	pertussis antigen	0.0468	mg	2012-08-30 19:57:46.404868
12	4	diptheria toxoid	6.7	Lf	2012-08-30 19:57:46.404868
13	4	aluminum potassium sulfate	0.170	mg	2012-08-30 19:57:46.404868
14	4	tetanus toxoid	5	Lf	2012-08-30 19:57:46.404868
15	4	Hib polysaccharide	0.010	mg	2012-08-30 19:57:46.404868
16	4	tetanus toxoid conjugate	0.024	mg	2012-08-30 19:57:46.404868
17	2	pertussis antigen	0.025	mg	2012-08-30 19:57:46.404868
18	2	pertactin	0.008	mg	2012-08-30 19:57:46.404868
19	2	diptheria toxoid	25	Lf	2012-08-30 19:57:46.404868
20	2	tetanus toxoid	10	Lf	2012-08-30 19:57:46.404868
21	2	aluminum hydroxide	0.625	mg	2012-08-30 19:57:46.404868
22	2	formaldehyde	0.100	mg	2012-08-30 19:57:46.404868
23	2	polysorbate 80	0.100	mg	2012-08-30 19:57:46.404868
24	2	bovine extract	0	mg	2012-08-30 19:57:46.404868
25	2	sodium chloride	4.5	mg	2012-08-30 19:57:46.404868
26	8	pertussis antigen	0.010	mg	2012-08-30 19:57:46.404868
27	8	pertactin	0.003	mg	2012-08-30 19:57:46.404868
28	8	diptheria toxoid	15	Lf	2012-08-30 19:57:46.404868
29	8	tetanus toxoid	5	Lf	2012-08-30 19:57:46.404868
30	8	formaldehyde	0.005	mg	2012-08-30 19:57:46.404868
31	8	2-phenoxyethanol	3.3	mg	2012-08-30 19:57:46.404868
32	8	aluminum phosphate	1.5	mg	2012-08-30 19:57:46.404868
33	9	pertussis antigen	0.025	mg	2012-08-30 19:57:46.404868
34	9	pertactin	0.008	mg	2012-08-30 19:57:46.404868
35	9	diptheria toxoid	25	Lf	2012-08-30 19:57:46.404868
36	9	tetanus toxoid	10	Lf	2012-08-30 19:57:46.404868
37	9	formaldehyde	0.100	mg	2012-08-30 19:57:46.404868
38	9	aluminum hydroxide/phosphate	0.085	mg	2012-08-30 19:57:46.404868
39	9	sodium chloride	4.5	mg	2012-08-30 19:57:46.404868
40	9	polysorbate 80	0.100	mg	2012-08-30 19:57:46.404868
41	9	bovine extract	0	mg	2012-08-30 19:57:46.404868
42	9	Hep-B surface antigens	0.010	mg	2012-08-30 19:57:46.404868
43	9	Type 1 Polio Virus/Mahoney	40	DU	2012-08-30 19:57:46.404868
44	9	Type 2 Polio Virus/MEF-1	8	DU	2012-08-30 19:57:46.404868
45	9	Type 3 Polio Virus/Saukett	32	DU	2012-08-30 19:57:46.404868
46	9	Neomycin	0.05	ng	2012-08-30 19:57:46.404868
47	9	Polymyxin-B	0.01	ng	2012-08-30 19:57:46.404868
48	11	pertussis antigen	0.025	mg	2012-08-30 19:57:46.404868
49	11	pertactin	0.008	mg	2012-08-30 19:57:46.404868
50	11	diptheria toxoid	25	Lf	2012-08-30 19:57:46.404868
51	11	tetanus toxoid	10	Lf	2012-08-30 19:57:46.404868
52	11	formaldehyde	0.100	mg	2012-08-30 19:57:46.404868
53	11	aluminum hydroxide/phosphate	0.085	mg	2012-08-30 19:57:46.404868
54	11	sodium chloride	4.5	mg	2012-08-30 19:57:46.404868
55	11	polysorbate 80	0.100	mg	2012-08-30 19:57:46.404868
56	11	bovine extract	0	mg	2012-08-30 19:57:46.404868
57	11	Type 1 Polio Virus/Mahoney	40	DU	2012-08-30 19:57:46.404868
58	11	Type 2 Polio Virus/MEF-1	8	DU	2012-08-30 19:57:46.404868
59	11	Type 3 Polio Virus/Saukett	32	DU	2012-08-30 19:57:46.404868
60	11	Neomycin	0.05	ng	2012-08-30 19:57:46.404868
61	11	Polymyxin-B	0.01	ng	2012-08-30 19:57:46.404868
\.


--
-- Data for Name: vaccine_type; Type: TABLE DATA; Schema: vic; Owner: mschrimshaw
--

COPY vaccine_type (vaccine_type_id, name, cvx) FROM stdin;
1	DTaP	20
2	DTaP-Hib	50
3	DTaP-Hep B,IPV	110
4	DTaP-IPV	130
5	DTaP-Hib-IPV	120
6	Hib	48
7	Hib	49
8	Hib-Hep B	51
9	MMR	3
10	MMRV	94
11	Varicella	21
12	Hep B	8
13	Hep B	42
14	Hep B	43
15	HPV-4	62
16	HPV-2	118
17	IPV	10
18	PCV13	133
19	PCV7	100
20	PCV23	33
\.


--
-- Data for Name: vaccines; Type: TABLE DATA; Schema: vic; Owner: mschrimshaw
--

COPY vaccines (vaccine_id, manufacturer_id, vaccine_type_id, vaccine_name, combo_vaccine, dose, dose_measurement, current_as_of) FROM stdin;
1	1	1	Tripedia	1	0.5	ml	2012-08-30 15:17:39.479328
2	2	1	Infanrix	1	0.5	ml	2012-08-30 15:17:39.563989
3	1	2	ActHIB	1	0.5	ml	2012-08-30 15:17:39.565158
4	1	2	TriHIBit	1	0.5	ml	2012-08-30 15:17:39.566312
5	3	9	MMR	1	0.5	ml	2012-08-30 15:17:43.439905
6	3	10	MMRV	1	0.5	ml	2012-08-30 15:17:43.441088
7	3	15	HPV-4	0	0.5	ml	2012-08-30 15:17:43.442028
8	1	1	Daptecel	1	0.5	ml	2012-08-30 15:17:47.071194
9	2	3	Pediarix	1	0.5	ml	2012-08-30 15:17:47.072314
10	2	3	Kinrix	1	0.5	ml	2012-08-30 15:17:47.073155
\.


--
-- Name: disease_id; Type: CONSTRAINT; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

ALTER TABLE ONLY disease
    ADD CONSTRAINT disease_id PRIMARY KEY (disease_id, vaccine_type_id);


--
-- Name: manufacturer_id; Type: CONSTRAINT; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

ALTER TABLE ONLY manufacturer
    ADD CONSTRAINT manufacturer_id PRIMARY KEY (manufacturer_id);


--
-- Name: vaccine_component_id; Type: CONSTRAINT; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

ALTER TABLE ONLY vaccine_components
    ADD CONSTRAINT vaccine_component_id PRIMARY KEY (component_id, vaccine_id);


--
-- Name: vaccine_type_id; Type: CONSTRAINT; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

ALTER TABLE ONLY vaccine_type
    ADD CONSTRAINT vaccine_type_id PRIMARY KEY (vaccine_type_id);


--
-- Name: vaccines_id; Type: CONSTRAINT; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

ALTER TABLE ONLY vaccines
    ADD CONSTRAINT vaccines_id PRIMARY KEY (vaccine_id, manufacturer_id);


--
-- Name: vaccines_idx; Type: INDEX; Schema: vic; Owner: mschrimshaw; Tablespace: 
--

CREATE INDEX vaccines_idx ON vaccines USING btree (manufacturer_id);


--
-- Name: manufacturer_vaccines_fk; Type: FK CONSTRAINT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY vaccines
    ADD CONSTRAINT manufacturer_vaccines_fk FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id);


--
-- Name: vaccine_type_disease_fk; Type: FK CONSTRAINT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY disease
    ADD CONSTRAINT vaccine_type_disease_fk FOREIGN KEY (vaccine_type_id) REFERENCES vaccine_type(vaccine_type_id);


--
-- Name: vaccine_type_vaccines_fk; Type: FK CONSTRAINT; Schema: vic; Owner: mschrimshaw
--

ALTER TABLE ONLY vaccines
    ADD CONSTRAINT vaccine_type_vaccines_fk FOREIGN KEY (vaccine_type_id) REFERENCES vaccine_type(vaccine_type_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: vic; Type: ACL; Schema: -; Owner: mschrimshaw
--

REVOKE ALL ON SCHEMA vic FROM PUBLIC;
REVOKE ALL ON SCHEMA vic FROM mschrimshaw;
GRANT ALL ON SCHEMA vic TO mschrimshaw;


--
-- PostgreSQL database dump complete
--

