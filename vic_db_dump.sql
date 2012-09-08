--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: VIC; Type: COMMENT; Schema: -; Owner: vic
--

COMMENT ON DATABASE "VIC" IS 'vaccine ingredients calculator database';


--
-- Name: vic; Type: SCHEMA; Schema: -; Owner: vic
--

CREATE SCHEMA vic;


ALTER SCHEMA vic OWNER TO vic;

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
-- Name: disease; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
--

CREATE TABLE disease (
    disease_id integer NOT NULL,
    vaccine_type_id integer NOT NULL,
    disease character varying(50) NOT NULL
);


ALTER TABLE vic.disease OWNER TO vic;

--
-- Name: TABLE disease; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE disease IS 'diseases for which vaccinations are given for';


--
-- Name: COLUMN disease.disease; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN disease.disease IS 'disease name';


--
-- Name: disease_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE disease_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.disease_id_seq OWNER TO vic;

--
-- Name: disease_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE disease_id_seq OWNED BY disease.disease_id;


--
-- Name: disease_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('disease_id_seq', 27, true);


--
-- Name: manufacturer; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
--

CREATE TABLE manufacturer (
    manufacturer_id integer NOT NULL,
    company_name character varying(50) NOT NULL,
    mvx character varying(3) NOT NULL
);


ALTER TABLE vic.manufacturer OWNER TO vic;

--
-- Name: TABLE manufacturer; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE manufacturer IS 'vaccine manufacturers';


--
-- Name: COLUMN manufacturer.company_name; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN manufacturer.company_name IS 'vaccine manufacturer company';


--
-- Name: COLUMN manufacturer.mvx; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN manufacturer.mvx IS 'CDC MVX manufacturer code';


--
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE manufacturer_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.manufacturer_manufacturer_id_seq OWNER TO vic;

--
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE manufacturer_manufacturer_id_seq OWNED BY manufacturer.manufacturer_id;


--
-- Name: manufacturer_manufacturer_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('manufacturer_manufacturer_id_seq', 6, true);


--
-- Name: measurements; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
--

CREATE TABLE measurements (
    measurement_id smallint NOT NULL,
    measurement character varying(3) NOT NULL
);


ALTER TABLE vic.measurements OWNER TO vic;

--
-- Name: TABLE measurements; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE measurements IS 'Contains normalized vaccine component measurements';


--
-- Name: measurement_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE measurement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.measurement_id_seq OWNER TO vic;

--
-- Name: measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE measurement_id_seq OWNED BY measurements.measurement_id;


--
-- Name: measurement_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('measurement_id_seq', 1, false);


--
-- Name: normalized_vaccine_components; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
--

CREATE TABLE normalized_vaccine_components (
    normalized_id integer NOT NULL,
    component_name character varying(100) NOT NULL
);


ALTER TABLE vic.normalized_vaccine_components OWNER TO vic;

--
-- Name: TABLE normalized_vaccine_components; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE normalized_vaccine_components IS 'individual vaccine components will be stored in this table to increase normalization of data';


--
-- Name: normalized_vaccine_components_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE normalized_vaccine_components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.normalized_vaccine_components_id_seq OWNER TO vic;

--
-- Name: normalized_vaccine_components_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE normalized_vaccine_components_id_seq OWNED BY normalized_vaccine_components.normalized_id;


--
-- Name: normalized_vaccine_components_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('normalized_vaccine_components_id_seq', 29, true);


--
-- Name: vaccine_components; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
--

CREATE TABLE vaccine_components (
    component_id integer NOT NULL,
    vaccine_id integer NOT NULL,
    dose numeric NOT NULL,
    current_as_of timestamp without time zone DEFAULT now() NOT NULL,
    normalized_component_id integer NOT NULL,
    dose_measurement smallint NOT NULL
);


ALTER TABLE vic.vaccine_components OWNER TO vic;

--
-- Name: TABLE vaccine_components; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE vaccine_components IS 'components present in a vaccine';


--
-- Name: COLUMN vaccine_components.component_id; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN vaccine_components.component_id IS 'FK on vaccine.id';


--
-- Name: COLUMN vaccine_components.dose; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN vaccine_components.dose IS 'amount of antigen/adjuvant/etc present (mg or mcg)';


--
-- Name: vaccine_components_component_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE vaccine_components_component_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.vaccine_components_component_id_seq OWNER TO vic;

--
-- Name: vaccine_components_component_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE vaccine_components_component_id_seq OWNED BY vaccine_components.component_id;


--
-- Name: vaccine_components_component_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('vaccine_components_component_id_seq', 80, true);


--
-- Name: vaccines; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
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


ALTER TABLE vic.vaccines OWNER TO vic;

--
-- Name: TABLE vaccines; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE vaccines IS 'vaccine base table';


--
-- Name: COLUMN vaccines.manufacturer_id; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN vaccines.manufacturer_id IS 'FK on manufacturer.id';


--
-- Name: COLUMN vaccines.vaccine_name; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN vaccines.vaccine_name IS 'Marketing name of vaccine product';


--
-- Name: COLUMN vaccines.dose; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN vaccines.dose IS 'dose of vaccine to be administered ';


--
-- Name: vaccine_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE vaccine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.vaccine_id_seq OWNER TO vic;

--
-- Name: vaccine_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE vaccine_id_seq OWNED BY vaccines.vaccine_id;


--
-- Name: vaccine_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('vaccine_id_seq', 14, true);


--
-- Name: vaccine_type; Type: TABLE; Schema: vic; Owner: vic; Tablespace: 
--

CREATE TABLE vaccine_type (
    vaccine_type_id integer NOT NULL,
    name character varying(25) NOT NULL,
    cvx smallint NOT NULL
);


ALTER TABLE vic.vaccine_type OWNER TO vic;

--
-- Name: TABLE vaccine_type; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON TABLE vaccine_type IS 'Vaccine types (DTaP, Hib, MMR, etc)';


--
-- Name: COLUMN vaccine_type.cvx; Type: COMMENT; Schema: vic; Owner: vic
--

COMMENT ON COLUMN vaccine_type.cvx IS 'CDC CVX code for vaccine type';


--
-- Name: vaccine_type_id_seq; Type: SEQUENCE; Schema: vic; Owner: vic
--

CREATE SEQUENCE vaccine_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vic.vaccine_type_id_seq OWNER TO vic;

--
-- Name: vaccine_type_id_seq; Type: SEQUENCE OWNED BY; Schema: vic; Owner: vic
--

ALTER SEQUENCE vaccine_type_id_seq OWNED BY vaccine_type.vaccine_type_id;


--
-- Name: vaccine_type_id_seq; Type: SEQUENCE SET; Schema: vic; Owner: vic
--

SELECT pg_catalog.setval('vaccine_type_id_seq', 21, true);


--
-- Name: disease_id; Type: DEFAULT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY disease ALTER COLUMN disease_id SET DEFAULT nextval('disease_id_seq'::regclass);


--
-- Name: manufacturer_id; Type: DEFAULT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY manufacturer ALTER COLUMN manufacturer_id SET DEFAULT nextval('manufacturer_manufacturer_id_seq'::regclass);


--
-- Name: normalized_id; Type: DEFAULT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY normalized_vaccine_components ALTER COLUMN normalized_id SET DEFAULT nextval('normalized_vaccine_components_id_seq'::regclass);


--
-- Name: component_id; Type: DEFAULT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY vaccine_components ALTER COLUMN component_id SET DEFAULT nextval('vaccine_components_component_id_seq'::regclass);


--
-- Name: vaccine_type_id; Type: DEFAULT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY vaccine_type ALTER COLUMN vaccine_type_id SET DEFAULT nextval('vaccine_type_id_seq'::regclass);


--
-- Name: vaccine_id; Type: DEFAULT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY vaccines ALTER COLUMN vaccine_id SET DEFAULT nextval('vaccine_id_seq'::regclass);


--
-- Data for Name: disease; Type: TABLE DATA; Schema: vic; Owner: vic
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
-- Data for Name: manufacturer; Type: TABLE DATA; Schema: vic; Owner: vic
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
-- Data for Name: measurements; Type: TABLE DATA; Schema: vic; Owner: vic
--

COPY measurements (measurement_id, measurement) FROM stdin;
1	pg
2	Lf
3	DU
4	ppm
5	mg
6	ng
\.


--
-- Data for Name: normalized_vaccine_components; Type: TABLE DATA; Schema: vic; Owner: vic
--

COPY normalized_vaccine_components (normalized_id, component_name) FROM stdin;
1	formaldehyde
2	thimerosal
3	pertussis antigen
4	diphtheria toxoid
5	tetanus toxoid
6	aluminum potassium sulfate
7	aluminum hydroxide
8	aluminum phosphate
9	polysorbate 80
10	gelatin
11	Hib polysaccharide
12	tetanus toxoid conjugate
13	pertactin
14	2-phenoxyethanol
15	bovine extract
16	sodium chloride
17	Hep-B surface antigens
18	Type 1 Polio Virus/Mahoney
19	Type 2 Polio Virus/MEF-1
20	Type 3 Polio Virus/Saukett
21	Neomycin
22	Polymyxin-B
23	tetanus toxoid covalently bound with Hib
24	sucrose
25	glutaraldehyde
26	MRC-5/human diploid cells
27	WI-38/human diploid cells
28	PER-C6/human retinal cells
29	aluminum hydroxide/phosphate
\.


--
-- Data for Name: vaccine_components; Type: TABLE DATA; Schema: vic; Owner: vic
--

COPY vaccine_components (component_id, vaccine_id, dose, current_as_of, normalized_component_id, dose_measurement) FROM stdin;
68	12	0.005	2012-09-02 00:43:42.40273	1	5
52	11	0.100	2012-08-30 19:57:46.404868	1	5
37	9	0.100	2012-08-30 19:57:46.404868	1	5
30	8	0.005	2012-08-30 19:57:46.404868	1	5
22	2	0.100	2012-08-30 19:57:46.404868	1	5
9	4	0.100	2012-08-30 19:57:46.404868	1	5
1	1	0.100	2012-08-30 19:57:46.404868	1	5
10	4	0.03	2012-08-30 19:57:46.404868	2	5
2	1	0.03	2012-08-30 19:57:46.404868	2	5
62	12	0.020	2012-09-02 00:43:42.297587	3	5
48	11	0.025	2012-08-30 19:57:46.404868	3	5
33	9	0.025	2012-08-30 19:57:46.404868	3	5
26	8	0.010	2012-08-30 19:57:46.404868	3	5
17	2	0.025	2012-08-30 19:57:46.404868	3	5
11	4	0.0468	2012-08-30 19:57:46.404868	3	5
3	1	0.0468	2012-08-30 19:57:46.404868	3	5
64	12	15	2012-09-02 00:43:42.398848	4	2
50	11	25	2012-08-30 19:57:46.404868	4	2
35	9	25	2012-08-30 19:57:46.404868	4	2
28	8	15	2012-08-30 19:57:46.404868	4	2
19	2	25	2012-08-30 19:57:46.404868	4	2
12	4	6.7	2012-08-30 19:57:46.404868	4	2
74	12	50	2012-09-02 00:43:47.269155	25	6
38	9	0.085	2012-08-30 19:57:46.404868	29	5
53	11	0.085	2012-08-30 19:57:46.404868	29	5
4	1	6.7	2012-08-30 19:57:46.404868	4	2
65	12	5	2012-09-02 00:43:42.399888	5	2
51	11	10	2012-08-30 19:57:46.404868	5	2
36	9	10	2012-08-30 19:57:46.404868	5	2
29	8	5	2012-08-30 19:57:46.404868	5	2
20	2	10	2012-08-30 19:57:46.404868	5	2
14	4	5	2012-08-30 19:57:46.404868	5	2
6	1	5	2012-08-30 19:57:46.404868	5	2
13	4	0.170	2012-08-30 19:57:46.404868	6	5
5	1	0.170	2012-08-30 19:57:46.404868	6	5
21	2	0.625	2012-08-30 19:57:46.404868	7	5
69	12	1.5	2012-09-02 00:43:42.404042	8	5
32	8	1.5	2012-08-30 19:57:46.404868	8	5
71	12	10	2012-09-02 00:43:47.266026	9	4
55	11	0.100	2012-08-30 19:57:46.404868	9	5
40	9	0.100	2012-08-30 19:57:46.404868	9	5
23	2	0.100	2012-08-30 19:57:46.404868	9	5
7	1	0	2012-08-30 19:57:46.404868	9	5
8	1	0	2012-08-30 19:57:46.404868	10	5
66	12	0.010	2012-09-02 00:43:42.400768	11	5
15	4	0.010	2012-08-30 19:57:46.404868	11	5
16	4	0.024	2012-08-30 19:57:46.404868	12	5
63	12	0.008	2012-09-02 00:43:42.396094	13	5
49	11	0.008	2012-08-30 19:57:46.404868	13	5
34	9	0.008	2012-08-30 19:57:46.404868	13	5
27	8	0.003	2012-08-30 19:57:46.404868	13	5
18	2	0.008	2012-08-30 19:57:46.404868	13	5
72	12	3.3	2012-09-02 00:43:47.267181	14	5
31	8	3.3	2012-08-30 19:57:46.404868	14	5
73	12	50	2012-09-02 00:43:47.268192	15	6
56	11	0	2012-08-30 19:57:46.404868	15	5
41	9	0	2012-08-30 19:57:46.404868	15	5
24	2	0	2012-08-30 19:57:46.404868	15	5
54	11	4.5	2012-08-30 19:57:46.404868	16	5
39	9	4.5	2012-08-30 19:57:46.404868	16	5
25	2	4.5	2012-08-30 19:57:46.404868	16	5
42	9	0.010	2012-08-30 19:57:46.404868	17	5
76	12	40	2012-09-02 00:43:51.666745	18	3
57	11	40	2012-08-30 19:57:46.404868	18	3
43	9	40	2012-08-30 19:57:46.404868	18	3
77	12	8	2012-09-02 00:43:51.782274	19	3
58	11	8	2012-08-30 19:57:46.404868	19	3
44	9	8	2012-08-30 19:57:46.404868	19	3
45	9	32	2012-08-30 19:57:46.404868	20	3
46	9	0.05	2012-08-30 19:57:46.404868	21	6
78	12	32	2012-09-02 00:43:51.783501	20	3
59	11	32	2012-08-30 19:57:46.404868	20	3
79	12	4	2012-09-02 00:43:51.784532	21	1
60	11	0.05	2012-08-30 19:57:46.404868	21	6
80	12	4	2012-09-02 00:43:51.78561	22	1
61	11	0.01	2012-08-30 19:57:46.404868	22	6
47	9	0.01	2012-08-30 19:57:46.404868	22	6
67	12	0.024	2012-09-02 00:43:42.401536	23	5
70	12	42.5	2012-09-02 00:43:47.170731	24	5
75	12	0.0	2012-09-02 00:43:47.271754	26	5
\.


--
-- Data for Name: vaccine_type; Type: TABLE DATA; Schema: vic; Owner: vic
--

COPY vaccine_type (vaccine_type_id, name, cvx) FROM stdin;
1	DTaP	20
2	DTaP-Hib	50
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
3	DTaP-Hep B-IPV	110
21	Tdap	115
\.


--
-- Data for Name: vaccines; Type: TABLE DATA; Schema: vic; Owner: vic
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
10	2	4	Kinrix	1	0.5	ml	2012-08-30 15:17:47.073155
12	1	5	Pentacel	1	0.5	ml	2012-09-01 22:22:58.799466
13	1	1	Adacel	1	0.5	ml	2012-09-03 11:38:50.294041
14	1	21	Boostrix	1	0.5	ml	2012-09-08 04:01:05.911766
\.


--
-- Name: disease_id; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY disease
    ADD CONSTRAINT disease_id PRIMARY KEY (disease_id, vaccine_type_id);


--
-- Name: manufacturer_id; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY manufacturer
    ADD CONSTRAINT manufacturer_id PRIMARY KEY (manufacturer_id);


--
-- Name: measurements_pkey; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY measurements
    ADD CONSTRAINT measurements_pkey PRIMARY KEY (measurement, measurement_id);


--
-- Name: normalized_id; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY normalized_vaccine_components
    ADD CONSTRAINT normalized_id PRIMARY KEY (normalized_id);


--
-- Name: vaccine_component_id; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY vaccine_components
    ADD CONSTRAINT vaccine_component_id PRIMARY KEY (component_id, vaccine_id);


--
-- Name: vaccine_type_id; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY vaccine_type
    ADD CONSTRAINT vaccine_type_id PRIMARY KEY (vaccine_type_id);


--
-- Name: vaccines_id; Type: CONSTRAINT; Schema: vic; Owner: vic; Tablespace: 
--

ALTER TABLE ONLY vaccines
    ADD CONSTRAINT vaccines_id PRIMARY KEY (vaccine_id, manufacturer_id);


--
-- Name: measurements_measurement_id_key; Type: INDEX; Schema: vic; Owner: vic; Tablespace: 
--

CREATE UNIQUE INDEX measurements_measurement_id_key ON measurements USING btree (measurement_id);


--
-- Name: normalized_vaccine_components_normalized_id_key; Type: INDEX; Schema: vic; Owner: vic; Tablespace: 
--

CREATE UNIQUE INDEX normalized_vaccine_components_normalized_id_key ON normalized_vaccine_components USING btree (normalized_id);


--
-- Name: vaccines_idx; Type: INDEX; Schema: vic; Owner: vic; Tablespace: 
--

CREATE INDEX vaccines_idx ON vaccines USING btree (manufacturer_id);


--
-- Name: fK_component_id; Type: FK CONSTRAINT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY vaccine_components
    ADD CONSTRAINT "fK_component_id" FOREIGN KEY (normalized_component_id) REFERENCES normalized_vaccine_components(normalized_id);


--
-- Name: fk_dose_measurement; Type: FK CONSTRAINT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY vaccine_components
    ADD CONSTRAINT fk_dose_measurement FOREIGN KEY (dose_measurement) REFERENCES measurements(measurement_id);


--
-- Name: manufacturer_vaccines_fk; Type: FK CONSTRAINT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY vaccines
    ADD CONSTRAINT manufacturer_vaccines_fk FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id);


--
-- Name: vaccine_type_disease_fk; Type: FK CONSTRAINT; Schema: vic; Owner: vic
--

ALTER TABLE ONLY disease
    ADD CONSTRAINT vaccine_type_disease_fk FOREIGN KEY (vaccine_type_id) REFERENCES vaccine_type(vaccine_type_id);


--
-- Name: vaccine_type_vaccines_fk; Type: FK CONSTRAINT; Schema: vic; Owner: vic
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
-- Name: vic; Type: ACL; Schema: -; Owner: vic
--

REVOKE ALL ON SCHEMA vic FROM PUBLIC;
REVOKE ALL ON SCHEMA vic FROM vic;
GRANT ALL ON SCHEMA vic TO vic;


--
-- PostgreSQL database dump complete
--

