
CREATE SEQUENCE VIC.disease_id_seq;

CREATE TABLE VIC.disease (
                disease_id INTEGER NOT NULL DEFAULT nextval('VIC.disease_id_seq'),
                disease VARCHAR(50) NOT NULL,
                CONSTRAINT disease_id PRIMARY KEY (disease_id)
);
COMMENT ON TABLE VIC.disease IS 'diseases for which vaccinations are given for';
COMMENT ON COLUMN VIC.disease.disease IS 'disease name';


ALTER SEQUENCE VIC.disease_id_seq OWNED BY VIC.disease.disease_id;

CREATE SEQUENCE VIC.vaccine_components_component_id_seq;

CREATE TABLE VIC.vaccine_components (
                component_id INTEGER NOT NULL DEFAULT nextval('VIC.vaccine_components_component_id_seq'),
                vaccine_id INTEGER NOT NULL,
                vaccine_component VARCHAR(100) NOT NULL,
                dose NUMERIC(3,3) NOT NULL,
                dose_scale VARCHAR(5) NOT NULL,
                CONSTRAINT vaccine_component_id PRIMARY KEY (component_id)
);
COMMENT ON TABLE VIC.vaccine_components IS 'components present in a vaccine';
COMMENT ON COLUMN VIC.vaccine_components.component_id IS 'FK on vaccine.id';
COMMENT ON COLUMN VIC.vaccine_components.vaccine_component IS 'name of vaccine component/antigen/adjuvant';
COMMENT ON COLUMN VIC.vaccine_components.dose IS 'amount of antigen/adjuvant/etc present (mg or mcg)';
COMMENT ON COLUMN VIC.vaccine_components.dose_scale IS 'mg, mcg, or ml dose scale';


ALTER SEQUENCE VIC.vaccine_components_component_id_seq OWNED BY VIC.vaccine_components.component_id;

CREATE SEQUENCE VIC.manufacturer_manufacturer_id_seq;

CREATE TABLE VIC.manufacturer (
                manufacturer_id INTEGER NOT NULL DEFAULT nextval('VIC.manufacturer_manufacturer_id_seq'),
                company_name VARCHAR(50) NOT NULL,
                CONSTRAINT manufacturer_id PRIMARY KEY (manufacturer_id)
);
COMMENT ON TABLE VIC.manufacturer IS 'vaccine manufacturers';
COMMENT ON COLUMN VIC.manufacturer.company_name IS 'vaccine manufacturer company';


ALTER SEQUENCE VIC.manufacturer_manufacturer_id_seq OWNED BY VIC.manufacturer.manufacturer_id;

CREATE SEQUENCE VIC.vaccines_vaccine_id_seq;

CREATE TABLE VIC.vaccines (
                vaccine_id INTEGER NOT NULL DEFAULT nextval('VIC.vaccines_vaccine_id_seq'),
                disease_id INTEGER NOT NULL,
                manufacturer_id INTEGER NOT NULL,
                vaccine_name VARCHAR(50) NOT NULL,
                dose NUMERIC(3,1) DEFAULT 0.5 NOT NULL,
                CONSTRAINT vaccines_id PRIMARY KEY (vaccine_id, disease_id, manufacturer_id)
);
COMMENT ON TABLE VIC.vaccines IS 'vaccine base table';
COMMENT ON COLUMN VIC.vaccines.manufacturer_id IS 'FK on manufacturer.id';
COMMENT ON COLUMN VIC.vaccines.vaccine_name IS 'Marketing name of vaccine product';
COMMENT ON COLUMN VIC.vaccines.dose IS 'dose of vaccine to be administered ';


ALTER SEQUENCE VIC.vaccines_vaccine_id_seq OWNED BY VIC.vaccines.vaccine_id;

CREATE INDEX vaccines_idx
 ON VIC.vaccines
 ( manufacturer_id );

ALTER TABLE VIC.vaccines ADD CONSTRAINT disease_vaccines_fk
FOREIGN KEY (disease_id)
REFERENCES VIC.disease (disease_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE VIC.vaccines ADD CONSTRAINT manufacturer_vaccines_fk
FOREIGN KEY (manufacturer_id)
REFERENCES VIC.manufacturer (manufacturer_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
