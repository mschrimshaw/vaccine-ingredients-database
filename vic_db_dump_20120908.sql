/*
 Navicat PostgreSQL Data Transfer

 Source Server         : VIC
 Source Server Version : 90104
 Source Host           : localhost
 Source Database       : VIC
 Source Schema         : vic

 Target Server Version : 90104
 File Encoding         : utf-8

 Date: 09/08/2012 04:01:33 AM
*/

-- ----------------------------
--  Sequence structure for "disease_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "disease_id_seq";
CREATE SEQUENCE "disease_id_seq" INCREMENT 1 START 27 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "disease_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "manufacturer_manufacturer_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "manufacturer_manufacturer_id_seq";
CREATE SEQUENCE "manufacturer_manufacturer_id_seq" INCREMENT 1 START 6 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "manufacturer_manufacturer_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "measurement_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "measurement_id_seq";
CREATE SEQUENCE "measurement_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "measurement_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "normalized_vaccine_components_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "normalized_vaccine_components_id_seq";
CREATE SEQUENCE "normalized_vaccine_components_id_seq" INCREMENT 1 START 29 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "normalized_vaccine_components_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "vaccine_components_component_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_components_component_id_seq";
CREATE SEQUENCE "vaccine_components_component_id_seq" INCREMENT 1 START 80 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_components_component_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "vaccine_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_id_seq";
CREATE SEQUENCE "vaccine_id_seq" INCREMENT 1 START 14 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "vaccine_type_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_type_id_seq";
CREATE SEQUENCE "vaccine_type_id_seq" INCREMENT 1 START 21 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_type_id_seq" OWNER TO "vic";

-- ----------------------------
--  Table structure for "measurements"
-- ----------------------------
DROP TABLE IF EXISTS "measurements";
CREATE TABLE "measurements" (
	"measurement_id" int2 NOT NULL,
	"measurement" varchar(3) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "measurements" OWNER TO "vic";

-- ----------------------------
--  Records of "measurements"
-- ----------------------------
BEGIN;
INSERT INTO "measurements" VALUES ('1', 'pg');
INSERT INTO "measurements" VALUES ('2', 'Lf');
INSERT INTO "measurements" VALUES ('3', 'DU');
INSERT INTO "measurements" VALUES ('4', 'ppm');
INSERT INTO "measurements" VALUES ('5', 'mg');
INSERT INTO "measurements" VALUES ('6', 'ng');
COMMIT;

-- ----------------------------
--  Table structure for "manufacturer"
-- ----------------------------
DROP TABLE IF EXISTS "manufacturer";
CREATE TABLE "manufacturer" (
	"manufacturer_id" int4 NOT NULL DEFAULT nextval('manufacturer_manufacturer_id_seq'::regclass),
	"company_name" varchar(50) NOT NULL,
	"mvx" varchar(3) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "manufacturer" OWNER TO "vic";

-- ----------------------------
--  Records of "manufacturer"
-- ----------------------------
BEGIN;
INSERT INTO "manufacturer" VALUES ('1', 'Sanofi Pasteur SA', 'PMC');
INSERT INTO "manufacturer" VALUES ('2', 'GlaxoSmithKline', 'SKB');
INSERT INTO "manufacturer" VALUES ('3', 'Merck', 'MSD');
INSERT INTO "manufacturer" VALUES ('4', 'Pfizer', 'PFR');
INSERT INTO "manufacturer" VALUES ('5', 'Novartis', 'NOV');
INSERT INTO "manufacturer" VALUES ('6', 'MedImmune', 'MED');
COMMIT;

-- ----------------------------
--  Table structure for "disease"
-- ----------------------------
DROP TABLE IF EXISTS "disease";
CREATE TABLE "disease" (
	"disease_id" int4 NOT NULL DEFAULT nextval('disease_id_seq'::regclass),
	"vaccine_type_id" int4 NOT NULL,
	"disease" varchar(50) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "disease" OWNER TO "vic";

-- ----------------------------
--  Records of "disease"
-- ----------------------------
BEGIN;
INSERT INTO "disease" VALUES ('1', '1', 'Pertussis');
INSERT INTO "disease" VALUES ('2', '1', 'Diphtheria');
INSERT INTO "disease" VALUES ('3', '1', 'Tetanus');
INSERT INTO "disease" VALUES ('4', '1', 'Pertussis');
INSERT INTO "disease" VALUES ('5', '1', 'Diphtheria');
INSERT INTO "disease" VALUES ('6', '1', 'Tetanus');
INSERT INTO "disease" VALUES ('7', '6', 'Hib');
INSERT INTO "disease" VALUES ('8', '6', 'Hib');
INSERT INTO "disease" VALUES ('9', '9', 'Measles');
INSERT INTO "disease" VALUES ('10', '9', 'Mumps');
INSERT INTO "disease" VALUES ('11', '9', 'Rubella');
INSERT INTO "disease" VALUES ('12', '9', 'Measles');
INSERT INTO "disease" VALUES ('13', '9', 'Mumps');
INSERT INTO "disease" VALUES ('14', '9', 'Rubella');
INSERT INTO "disease" VALUES ('15', '11', 'Varicella');
INSERT INTO "disease" VALUES ('16', '11', 'Varicella');
INSERT INTO "disease" VALUES ('17', '18', 'Pneumococcal');
INSERT INTO "disease" VALUES ('18', '19', 'Pneumococcal');
INSERT INTO "disease" VALUES ('19', '20', 'Pneumococcal');
INSERT INTO "disease" VALUES ('20', '12', 'Hepatitis B');
INSERT INTO "disease" VALUES ('21', '13', 'Hepatitis B');
INSERT INTO "disease" VALUES ('22', '14', 'Hepatitis B');
INSERT INTO "disease" VALUES ('23', '17', 'Polio');
INSERT INTO "disease" VALUES ('24', '15', 'Human Papaloma Virus 4');
INSERT INTO "disease" VALUES ('25', '16', 'Human Papaloma Virus 2');
INSERT INTO "disease" VALUES ('27', '8', 'Hib-Hep B');
COMMIT;

-- ----------------------------
--  Table structure for "vaccine_type"
-- ----------------------------
DROP TABLE IF EXISTS "vaccine_type";
CREATE TABLE "vaccine_type" (
	"vaccine_type_id" int4 NOT NULL DEFAULT nextval('vaccine_type_id_seq'::regclass),
	"name" varchar(25) NOT NULL,
	"cvx" int2 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccine_type" OWNER TO "vic";

-- ----------------------------
--  Records of "vaccine_type"
-- ----------------------------
BEGIN;
INSERT INTO "vaccine_type" VALUES ('1', 'DTaP', '20');
INSERT INTO "vaccine_type" VALUES ('2', 'DTaP-Hib', '50');
INSERT INTO "vaccine_type" VALUES ('4', 'DTaP-IPV', '130');
INSERT INTO "vaccine_type" VALUES ('5', 'DTaP-Hib-IPV', '120');
INSERT INTO "vaccine_type" VALUES ('6', 'Hib', '48');
INSERT INTO "vaccine_type" VALUES ('7', 'Hib', '49');
INSERT INTO "vaccine_type" VALUES ('8', 'Hib-Hep B', '51');
INSERT INTO "vaccine_type" VALUES ('9', 'MMR', '3');
INSERT INTO "vaccine_type" VALUES ('10', 'MMRV', '94');
INSERT INTO "vaccine_type" VALUES ('11', 'Varicella', '21');
INSERT INTO "vaccine_type" VALUES ('12', 'Hep B', '8');
INSERT INTO "vaccine_type" VALUES ('13', 'Hep B', '42');
INSERT INTO "vaccine_type" VALUES ('14', 'Hep B', '43');
INSERT INTO "vaccine_type" VALUES ('15', 'HPV-4', '62');
INSERT INTO "vaccine_type" VALUES ('16', 'HPV-2', '118');
INSERT INTO "vaccine_type" VALUES ('17', 'IPV', '10');
INSERT INTO "vaccine_type" VALUES ('18', 'PCV13', '133');
INSERT INTO "vaccine_type" VALUES ('19', 'PCV7', '100');
INSERT INTO "vaccine_type" VALUES ('20', 'PCV23', '33');
INSERT INTO "vaccine_type" VALUES ('3', 'DTaP-Hep B-IPV', '110');
INSERT INTO "vaccine_type" VALUES ('21', 'Tdap', '115');
COMMIT;

-- ----------------------------
--  Table structure for "normalized_vaccine_components"
-- ----------------------------
DROP TABLE IF EXISTS "normalized_vaccine_components";
CREATE TABLE "normalized_vaccine_components" (
	"normalized_id" int4 NOT NULL DEFAULT nextval('normalized_vaccine_components_id_seq'::regclass),
	"component_name" varchar(100) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "normalized_vaccine_components" OWNER TO "vic";

-- ----------------------------
--  Records of "normalized_vaccine_components"
-- ----------------------------
BEGIN;
INSERT INTO "normalized_vaccine_components" VALUES ('1', 'formaldehyde');
INSERT INTO "normalized_vaccine_components" VALUES ('2', 'thimerosal');
INSERT INTO "normalized_vaccine_components" VALUES ('3', 'pertussis antigen');
INSERT INTO "normalized_vaccine_components" VALUES ('4', 'diphtheria toxoid');
INSERT INTO "normalized_vaccine_components" VALUES ('5', 'tetanus toxoid');
INSERT INTO "normalized_vaccine_components" VALUES ('6', 'aluminum potassium sulfate');
INSERT INTO "normalized_vaccine_components" VALUES ('7', 'aluminum hydroxide');
INSERT INTO "normalized_vaccine_components" VALUES ('8', 'aluminum phosphate');
INSERT INTO "normalized_vaccine_components" VALUES ('9', 'polysorbate 80');
INSERT INTO "normalized_vaccine_components" VALUES ('10', 'gelatin');
INSERT INTO "normalized_vaccine_components" VALUES ('11', 'Hib polysaccharide');
INSERT INTO "normalized_vaccine_components" VALUES ('12', 'tetanus toxoid conjugate');
INSERT INTO "normalized_vaccine_components" VALUES ('13', 'pertactin');
INSERT INTO "normalized_vaccine_components" VALUES ('14', '2-phenoxyethanol');
INSERT INTO "normalized_vaccine_components" VALUES ('15', 'bovine extract');
INSERT INTO "normalized_vaccine_components" VALUES ('16', 'sodium chloride');
INSERT INTO "normalized_vaccine_components" VALUES ('17', 'Hep-B surface antigens');
INSERT INTO "normalized_vaccine_components" VALUES ('18', 'Type 1 Polio Virus/Mahoney');
INSERT INTO "normalized_vaccine_components" VALUES ('19', 'Type 2 Polio Virus/MEF-1');
INSERT INTO "normalized_vaccine_components" VALUES ('20', 'Type 3 Polio Virus/Saukett');
INSERT INTO "normalized_vaccine_components" VALUES ('21', 'Neomycin');
INSERT INTO "normalized_vaccine_components" VALUES ('22', 'Polymyxin-B');
INSERT INTO "normalized_vaccine_components" VALUES ('23', 'tetanus toxoid covalently bound with Hib');
INSERT INTO "normalized_vaccine_components" VALUES ('24', 'sucrose');
INSERT INTO "normalized_vaccine_components" VALUES ('25', 'glutaraldehyde');
INSERT INTO "normalized_vaccine_components" VALUES ('26', 'MRC-5/human diploid cells');
INSERT INTO "normalized_vaccine_components" VALUES ('27', 'WI-38/human diploid cells');
INSERT INTO "normalized_vaccine_components" VALUES ('28', 'PER-C6/human retinal cells');
INSERT INTO "normalized_vaccine_components" VALUES ('29', 'aluminum hydroxide/phosphate');
COMMIT;

-- ----------------------------
--  Table structure for "vaccines"
-- ----------------------------
DROP TABLE IF EXISTS "vaccines";
CREATE TABLE "vaccines" (
	"vaccine_id" int4 NOT NULL DEFAULT nextval('vaccine_id_seq'::regclass),
	"manufacturer_id" int4 NOT NULL,
	"vaccine_type_id" int4 NOT NULL,
	"vaccine_name" varchar(50) NOT NULL,
	"combo_vaccine" bit(1) NOT NULL,
	"dose" numeric(3,1) NOT NULL DEFAULT 0.5,
	"dose_measurement" varchar(3) NOT NULL DEFAULT 'ml'::character varying,
	"current_as_of" timestamp(6) NOT NULL DEFAULT now()
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccines" OWNER TO "vic";

-- ----------------------------
--  Records of "vaccines"
-- ----------------------------
BEGIN;
INSERT INTO "vaccines" VALUES ('1', '1', '1', 'Tripedia', '1', '0.5', 'ml', '2012-08-30 15:17:39.479328');
INSERT INTO "vaccines" VALUES ('2', '2', '1', 'Infanrix', '1', '0.5', 'ml', '2012-08-30 15:17:39.563989');
INSERT INTO "vaccines" VALUES ('3', '1', '2', 'ActHIB', '1', '0.5', 'ml', '2012-08-30 15:17:39.565158');
INSERT INTO "vaccines" VALUES ('4', '1', '2', 'TriHIBit', '1', '0.5', 'ml', '2012-08-30 15:17:39.566312');
INSERT INTO "vaccines" VALUES ('5', '3', '9', 'MMR', '1', '0.5', 'ml', '2012-08-30 15:17:43.439905');
INSERT INTO "vaccines" VALUES ('6', '3', '10', 'MMRV', '1', '0.5', 'ml', '2012-08-30 15:17:43.441088');
INSERT INTO "vaccines" VALUES ('7', '3', '15', 'HPV-4', '0', '0.5', 'ml', '2012-08-30 15:17:43.442028');
INSERT INTO "vaccines" VALUES ('8', '1', '1', 'Daptecel', '1', '0.5', 'ml', '2012-08-30 15:17:47.071194');
INSERT INTO "vaccines" VALUES ('9', '2', '3', 'Pediarix', '1', '0.5', 'ml', '2012-08-30 15:17:47.072314');
INSERT INTO "vaccines" VALUES ('10', '2', '4', 'Kinrix', '1', '0.5', 'ml', '2012-08-30 15:17:47.073155');
INSERT INTO "vaccines" VALUES ('12', '1', '5', 'Pentacel', '1', '0.5', 'ml', '2012-09-01 22:22:58.799466');
INSERT INTO "vaccines" VALUES ('13', '1', '1', 'Adacel', '1', '0.5', 'ml', '2012-09-03 11:38:50.294041');
INSERT INTO "vaccines" VALUES ('14', '1', '21', 'Boostrix', '1', '0.5', 'ml', '2012-09-08 04:01:05.911766');
COMMIT;

-- ----------------------------
--  Table structure for "vaccine_components"
-- ----------------------------
DROP TABLE IF EXISTS "vaccine_components";
CREATE TABLE "vaccine_components" (
	"component_id" int4 NOT NULL DEFAULT nextval('vaccine_components_component_id_seq'::regclass),
	"vaccine_id" int4 NOT NULL,
	"dose" numeric NOT NULL,
	"current_as_of" timestamp(6) NOT NULL DEFAULT now(),
	"normalized_component_id" int4 NOT NULL,
	"dose_measurement" int2 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccine_components" OWNER TO "vic";

-- ----------------------------
--  Records of "vaccine_components"
-- ----------------------------
BEGIN;
INSERT INTO "vaccine_components" VALUES ('68', '12', '0.005', '2012-09-02 00:43:42.40273', '1', '5');
INSERT INTO "vaccine_components" VALUES ('52', '11', '0.100', '2012-08-30 19:57:46.404868', '1', '5');
INSERT INTO "vaccine_components" VALUES ('37', '9', '0.100', '2012-08-30 19:57:46.404868', '1', '5');
INSERT INTO "vaccine_components" VALUES ('30', '8', '0.005', '2012-08-30 19:57:46.404868', '1', '5');
INSERT INTO "vaccine_components" VALUES ('22', '2', '0.100', '2012-08-30 19:57:46.404868', '1', '5');
INSERT INTO "vaccine_components" VALUES ('9', '4', '0.100', '2012-08-30 19:57:46.404868', '1', '5');
INSERT INTO "vaccine_components" VALUES ('1', '1', '0.100', '2012-08-30 19:57:46.404868', '1', '5');
INSERT INTO "vaccine_components" VALUES ('10', '4', '0.03', '2012-08-30 19:57:46.404868', '2', '5');
INSERT INTO "vaccine_components" VALUES ('2', '1', '0.03', '2012-08-30 19:57:46.404868', '2', '5');
INSERT INTO "vaccine_components" VALUES ('62', '12', '0.020', '2012-09-02 00:43:42.297587', '3', '5');
INSERT INTO "vaccine_components" VALUES ('48', '11', '0.025', '2012-08-30 19:57:46.404868', '3', '5');
INSERT INTO "vaccine_components" VALUES ('33', '9', '0.025', '2012-08-30 19:57:46.404868', '3', '5');
INSERT INTO "vaccine_components" VALUES ('26', '8', '0.010', '2012-08-30 19:57:46.404868', '3', '5');
INSERT INTO "vaccine_components" VALUES ('17', '2', '0.025', '2012-08-30 19:57:46.404868', '3', '5');
INSERT INTO "vaccine_components" VALUES ('11', '4', '0.0468', '2012-08-30 19:57:46.404868', '3', '5');
INSERT INTO "vaccine_components" VALUES ('3', '1', '0.0468', '2012-08-30 19:57:46.404868', '3', '5');
INSERT INTO "vaccine_components" VALUES ('64', '12', '15', '2012-09-02 00:43:42.398848', '4', '2');
INSERT INTO "vaccine_components" VALUES ('50', '11', '25', '2012-08-30 19:57:46.404868', '4', '2');
INSERT INTO "vaccine_components" VALUES ('35', '9', '25', '2012-08-30 19:57:46.404868', '4', '2');
INSERT INTO "vaccine_components" VALUES ('28', '8', '15', '2012-08-30 19:57:46.404868', '4', '2');
INSERT INTO "vaccine_components" VALUES ('19', '2', '25', '2012-08-30 19:57:46.404868', '4', '2');
INSERT INTO "vaccine_components" VALUES ('12', '4', '6.7', '2012-08-30 19:57:46.404868', '4', '2');
INSERT INTO "vaccine_components" VALUES ('74', '12', '50', '2012-09-02 00:43:47.269155', '25', '6');
INSERT INTO "vaccine_components" VALUES ('38', '9', '0.085', '2012-08-30 19:57:46.404868', '29', '5');
INSERT INTO "vaccine_components" VALUES ('53', '11', '0.085', '2012-08-30 19:57:46.404868', '29', '5');
INSERT INTO "vaccine_components" VALUES ('4', '1', '6.7', '2012-08-30 19:57:46.404868', '4', '2');
INSERT INTO "vaccine_components" VALUES ('65', '12', '5', '2012-09-02 00:43:42.399888', '5', '2');
INSERT INTO "vaccine_components" VALUES ('51', '11', '10', '2012-08-30 19:57:46.404868', '5', '2');
INSERT INTO "vaccine_components" VALUES ('36', '9', '10', '2012-08-30 19:57:46.404868', '5', '2');
INSERT INTO "vaccine_components" VALUES ('29', '8', '5', '2012-08-30 19:57:46.404868', '5', '2');
INSERT INTO "vaccine_components" VALUES ('20', '2', '10', '2012-08-30 19:57:46.404868', '5', '2');
INSERT INTO "vaccine_components" VALUES ('14', '4', '5', '2012-08-30 19:57:46.404868', '5', '2');
INSERT INTO "vaccine_components" VALUES ('6', '1', '5', '2012-08-30 19:57:46.404868', '5', '2');
INSERT INTO "vaccine_components" VALUES ('13', '4', '0.170', '2012-08-30 19:57:46.404868', '6', '5');
INSERT INTO "vaccine_components" VALUES ('5', '1', '0.170', '2012-08-30 19:57:46.404868', '6', '5');
INSERT INTO "vaccine_components" VALUES ('21', '2', '0.625', '2012-08-30 19:57:46.404868', '7', '5');
INSERT INTO "vaccine_components" VALUES ('69', '12', '1.5', '2012-09-02 00:43:42.404042', '8', '5');
INSERT INTO "vaccine_components" VALUES ('32', '8', '1.5', '2012-08-30 19:57:46.404868', '8', '5');
INSERT INTO "vaccine_components" VALUES ('71', '12', '10', '2012-09-02 00:43:47.266026', '9', '4');
INSERT INTO "vaccine_components" VALUES ('55', '11', '0.100', '2012-08-30 19:57:46.404868', '9', '5');
INSERT INTO "vaccine_components" VALUES ('40', '9', '0.100', '2012-08-30 19:57:46.404868', '9', '5');
INSERT INTO "vaccine_components" VALUES ('23', '2', '0.100', '2012-08-30 19:57:46.404868', '9', '5');
INSERT INTO "vaccine_components" VALUES ('7', '1', '0', '2012-08-30 19:57:46.404868', '9', '5');
INSERT INTO "vaccine_components" VALUES ('8', '1', '0', '2012-08-30 19:57:46.404868', '10', '5');
INSERT INTO "vaccine_components" VALUES ('66', '12', '0.010', '2012-09-02 00:43:42.400768', '11', '5');
INSERT INTO "vaccine_components" VALUES ('15', '4', '0.010', '2012-08-30 19:57:46.404868', '11', '5');
INSERT INTO "vaccine_components" VALUES ('16', '4', '0.024', '2012-08-30 19:57:46.404868', '12', '5');
INSERT INTO "vaccine_components" VALUES ('63', '12', '0.008', '2012-09-02 00:43:42.396094', '13', '5');
INSERT INTO "vaccine_components" VALUES ('49', '11', '0.008', '2012-08-30 19:57:46.404868', '13', '5');
INSERT INTO "vaccine_components" VALUES ('34', '9', '0.008', '2012-08-30 19:57:46.404868', '13', '5');
INSERT INTO "vaccine_components" VALUES ('27', '8', '0.003', '2012-08-30 19:57:46.404868', '13', '5');
INSERT INTO "vaccine_components" VALUES ('18', '2', '0.008', '2012-08-30 19:57:46.404868', '13', '5');
INSERT INTO "vaccine_components" VALUES ('72', '12', '3.3', '2012-09-02 00:43:47.267181', '14', '5');
INSERT INTO "vaccine_components" VALUES ('31', '8', '3.3', '2012-08-30 19:57:46.404868', '14', '5');
INSERT INTO "vaccine_components" VALUES ('73', '12', '50', '2012-09-02 00:43:47.268192', '15', '6');
INSERT INTO "vaccine_components" VALUES ('56', '11', '0', '2012-08-30 19:57:46.404868', '15', '5');
INSERT INTO "vaccine_components" VALUES ('41', '9', '0', '2012-08-30 19:57:46.404868', '15', '5');
INSERT INTO "vaccine_components" VALUES ('24', '2', '0', '2012-08-30 19:57:46.404868', '15', '5');
INSERT INTO "vaccine_components" VALUES ('54', '11', '4.5', '2012-08-30 19:57:46.404868', '16', '5');
INSERT INTO "vaccine_components" VALUES ('39', '9', '4.5', '2012-08-30 19:57:46.404868', '16', '5');
INSERT INTO "vaccine_components" VALUES ('25', '2', '4.5', '2012-08-30 19:57:46.404868', '16', '5');
INSERT INTO "vaccine_components" VALUES ('42', '9', '0.010', '2012-08-30 19:57:46.404868', '17', '5');
INSERT INTO "vaccine_components" VALUES ('76', '12', '40', '2012-09-02 00:43:51.666745', '18', '3');
INSERT INTO "vaccine_components" VALUES ('57', '11', '40', '2012-08-30 19:57:46.404868', '18', '3');
INSERT INTO "vaccine_components" VALUES ('43', '9', '40', '2012-08-30 19:57:46.404868', '18', '3');
INSERT INTO "vaccine_components" VALUES ('77', '12', '8', '2012-09-02 00:43:51.782274', '19', '3');
INSERT INTO "vaccine_components" VALUES ('58', '11', '8', '2012-08-30 19:57:46.404868', '19', '3');
INSERT INTO "vaccine_components" VALUES ('44', '9', '8', '2012-08-30 19:57:46.404868', '19', '3');
INSERT INTO "vaccine_components" VALUES ('45', '9', '32', '2012-08-30 19:57:46.404868', '20', '3');
INSERT INTO "vaccine_components" VALUES ('46', '9', '0.05', '2012-08-30 19:57:46.404868', '21', '6');
INSERT INTO "vaccine_components" VALUES ('78', '12', '32', '2012-09-02 00:43:51.783501', '20', '3');
INSERT INTO "vaccine_components" VALUES ('59', '11', '32', '2012-08-30 19:57:46.404868', '20', '3');
INSERT INTO "vaccine_components" VALUES ('79', '12', '4', '2012-09-02 00:43:51.784532', '21', '1');
INSERT INTO "vaccine_components" VALUES ('60', '11', '0.05', '2012-08-30 19:57:46.404868', '21', '6');
INSERT INTO "vaccine_components" VALUES ('80', '12', '4', '2012-09-02 00:43:51.78561', '22', '1');
INSERT INTO "vaccine_components" VALUES ('61', '11', '0.01', '2012-08-30 19:57:46.404868', '22', '6');
INSERT INTO "vaccine_components" VALUES ('47', '9', '0.01', '2012-08-30 19:57:46.404868', '22', '6');
INSERT INTO "vaccine_components" VALUES ('67', '12', '0.024', '2012-09-02 00:43:42.401536', '23', '5');
INSERT INTO "vaccine_components" VALUES ('70', '12', '42.5', '2012-09-02 00:43:47.170731', '24', '5');
INSERT INTO "vaccine_components" VALUES ('75', '12', '0.0', '2012-09-02 00:43:47.271754', '26', '5');
COMMIT;


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "disease_id_seq" OWNED BY "disease"."disease_id";
ALTER SEQUENCE "manufacturer_manufacturer_id_seq" OWNED BY "manufacturer"."manufacturer_id";
ALTER SEQUENCE "measurement_id_seq" OWNED BY "measurements"."measurement_id";
ALTER SEQUENCE "normalized_vaccine_components_id_seq" OWNED BY "normalized_vaccine_components"."normalized_id";
ALTER SEQUENCE "vaccine_components_component_id_seq" OWNED BY "vaccine_components"."component_id";
ALTER SEQUENCE "vaccine_id_seq" OWNED BY "vaccines"."vaccine_id";
ALTER SEQUENCE "vaccine_type_id_seq" OWNED BY "vaccine_type"."vaccine_type_id";
-- ----------------------------
--  Primary key structure for table "measurements"
-- ----------------------------
ALTER TABLE "measurements" ADD CONSTRAINT "measurements_pkey" PRIMARY KEY ("measurement", "measurement_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "measurements"
-- ----------------------------
CREATE UNIQUE INDEX "measurements_measurement_id_key" ON "measurements" USING btree(measurement_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "manufacturer"
-- ----------------------------
ALTER TABLE "manufacturer" ADD CONSTRAINT "manufacturer_id" PRIMARY KEY ("manufacturer_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "disease"
-- ----------------------------
ALTER TABLE "disease" ADD CONSTRAINT "disease_id" PRIMARY KEY ("disease_id", "vaccine_type_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "vaccine_type"
-- ----------------------------
ALTER TABLE "vaccine_type" ADD CONSTRAINT "vaccine_type_id" PRIMARY KEY ("vaccine_type_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "normalized_vaccine_components"
-- ----------------------------
ALTER TABLE "normalized_vaccine_components" ADD CONSTRAINT "normalized_id" PRIMARY KEY ("normalized_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "normalized_vaccine_components"
-- ----------------------------
CREATE UNIQUE INDEX "normalized_vaccine_components_normalized_id_key" ON "normalized_vaccine_components" USING btree(normalized_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "vaccines"
-- ----------------------------
ALTER TABLE "vaccines" ADD CONSTRAINT "vaccines_id" PRIMARY KEY ("vaccine_id", "manufacturer_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "vaccines"
-- ----------------------------
CREATE INDEX "vaccines_idx" ON "vaccines" USING btree(manufacturer_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "vaccine_components"
-- ----------------------------
ALTER TABLE "vaccine_components" ADD CONSTRAINT "vaccine_component_id" PRIMARY KEY ("component_id", "vaccine_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

