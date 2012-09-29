/*
 Navicat PostgreSQL Data Transfer

 Source Server         : VIC
 Source Server Version : 90104
 Source Host           : localhost
 Source Database       : VIC
 Source Schema         : vic

 Target Server Version : 90104
 File Encoding         : utf-8

 Date: 09/29/2012 13:07:08 PM
*/

-- ----------------------------
--  Sequence structure for "disease_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "disease_id_seq";
CREATE SEQUENCE "disease_id_seq" INCREMENT 1 START 22 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "disease_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "manufacturer_manufacturer_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "manufacturer_manufacturer_id_seq";
CREATE SEQUENCE "manufacturer_manufacturer_id_seq" INCREMENT 1 START 7 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
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
CREATE SEQUENCE "normalized_vaccine_components_id_seq" INCREMENT 1 START 103 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "normalized_vaccine_components_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "vaccine_components_component_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_components_component_id_seq";
CREATE SEQUENCE "vaccine_components_component_id_seq" INCREMENT 1 START 215 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_components_component_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "vaccine_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_id_seq";
CREATE SEQUENCE "vaccine_id_seq" INCREMENT 1 START 22 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_id_seq" OWNER TO "vic";

-- ----------------------------
--  Sequence structure for "vaccine_type_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_type_id_seq";
CREATE SEQUENCE "vaccine_type_id_seq" INCREMENT 1 START 26 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_type_id_seq" OWNER TO "vic";

-- ----------------------------
--  Table structure for "measurements"
-- ----------------------------
DROP TABLE IF EXISTS "measurements";
CREATE TABLE "measurements" (
	"measurement_id" int2 NOT NULL DEFAULT nextval('measurement_id_seq'::regclass),
	"measurement" varchar(6) NOT NULL,
	"long_form" varchar(50)
)
WITH (OIDS=FALSE);
ALTER TABLE "measurements" OWNER TO "vic";

-- ----------------------------
--  Records of "measurements"
-- ----------------------------
BEGIN;
INSERT INTO "measurements" VALUES ('1', 'pg', 'picogram');
INSERT INTO "measurements" VALUES ('4', 'ppm', 'parts per million');
INSERT INTO "measurements" VALUES ('5', 'mg', 'milligram');
INSERT INTO "measurements" VALUES ('6', 'ng', 'nanogram');
INSERT INTO "measurements" VALUES ('7', 'mcg', 'microgram');
INSERT INTO "measurements" VALUES ('9', 'PFU', 'plaque forming units');
INSERT INTO "measurements" VALUES ('8', 'TCID50', 'tissue culture infectious doses');
INSERT INTO "measurements" VALUES ('2', 'Lf', 'limit of flocculation');
INSERT INTO "measurements" VALUES ('3', 'DU', 'D-antigen units');
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
INSERT INTO "manufacturer" VALUES ('7', 'Wyeth', 'PFR');
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
INSERT INTO "disease" VALUES ('1', '1', 'Pertussis, Diphtheria, Tetanus');
INSERT INTO "disease" VALUES ('2', '2', 'Tetanus, Diphtheria, Pertussis');
INSERT INTO "disease" VALUES ('3', '7', 'Hib PRP-OMP');
INSERT INTO "disease" VALUES ('4', '8', 'Hib PRP-T');
INSERT INTO "disease" VALUES ('5', '10', 'Measles, Mumps, Rubella');
INSERT INTO "disease" VALUES ('6', '11', 'Measles, Mumps, Rubella, Varicella');
INSERT INTO "disease" VALUES ('7', '12', 'Varicella');
INSERT INTO "disease" VALUES ('8', '22', 'Pneumococcal 13 valent');
INSERT INTO "disease" VALUES ('9', '23', 'Pneumococcal 7 valent');
INSERT INTO "disease" VALUES ('10', '24', 'Pneumococcal 23 valent');
INSERT INTO "disease" VALUES ('11', '13', 'Hep A-adult');
INSERT INTO "disease" VALUES ('12', '14', 'Hep A-ped or adol 2 dose');
INSERT INTO "disease" VALUES ('13', '15', 'Hep A-Hep B');
INSERT INTO "disease" VALUES ('14', '16', 'Hep B-adol or ped');
INSERT INTO "disease" VALUES ('15', '17', 'Hep B-adult');
INSERT INTO "disease" VALUES ('16', '18', 'Hep B-dialysis');
INSERT INTO "disease" VALUES ('17', '21', 'Polio');
INSERT INTO "disease" VALUES ('18', '19', 'Human Papaloma Virus 4');
INSERT INTO "disease" VALUES ('19', '20', 'Human Papaloma Virus 2');
INSERT INTO "disease" VALUES ('20', '9', 'Hib-Hep B');
INSERT INTO "disease" VALUES ('21', '25', 'Shingles');
INSERT INTO "disease" VALUES ('22', '26', 'Meningitis, Hib');
COMMIT;

-- ----------------------------
--  Table structure for "vaccine_type"
-- ----------------------------
DROP TABLE IF EXISTS "vaccine_type";
CREATE TABLE "vaccine_type" (
	"vaccine_type_id" int4 NOT NULL DEFAULT nextval('vaccine_type_id_seq'::regclass),
	"vaccine_type" varchar(25) NOT NULL,
	"cvx" int2 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccine_type" OWNER TO "vic";

-- ----------------------------
--  Records of "vaccine_type"
-- ----------------------------
BEGIN;
INSERT INTO "vaccine_type" VALUES ('1', 'DTaP', '20');
INSERT INTO "vaccine_type" VALUES ('2', 'Tdap', '115');
INSERT INTO "vaccine_type" VALUES ('3', 'DTaP-Hib', '50');
INSERT INTO "vaccine_type" VALUES ('4', 'DTaP-Hep B-IPV', '110');
INSERT INTO "vaccine_type" VALUES ('5', 'DTaP-IPV', '130');
INSERT INTO "vaccine_type" VALUES ('6', 'DTaP-Hib-IPV', '120');
INSERT INTO "vaccine_type" VALUES ('9', 'Hib-Hep B', '51');
INSERT INTO "vaccine_type" VALUES ('10', 'MMR', '3');
INSERT INTO "vaccine_type" VALUES ('11', 'MMRV', '94');
INSERT INTO "vaccine_type" VALUES ('12', 'Varicella', '21');
INSERT INTO "vaccine_type" VALUES ('13', 'Hep A-adult', '52');
INSERT INTO "vaccine_type" VALUES ('14', 'Hep A-ped or adol 2 dose', '83');
INSERT INTO "vaccine_type" VALUES ('15', 'Hep A-Hep B', '104');
INSERT INTO "vaccine_type" VALUES ('16', 'Hep B-adol or ped', '8');
INSERT INTO "vaccine_type" VALUES ('17', 'Hep B-adult', '43');
INSERT INTO "vaccine_type" VALUES ('18', 'Hep B-dialysis', '44');
INSERT INTO "vaccine_type" VALUES ('19', 'HPV-4', '62');
INSERT INTO "vaccine_type" VALUES ('20', 'HPV-2', '118');
INSERT INTO "vaccine_type" VALUES ('21', 'IPV', '10');
INSERT INTO "vaccine_type" VALUES ('22', 'PCV13', '133');
INSERT INTO "vaccine_type" VALUES ('23', 'PCV7', '100');
INSERT INTO "vaccine_type" VALUES ('7', 'Hib (PRP-OMP)', '49');
INSERT INTO "vaccine_type" VALUES ('8', 'Hib (PRP-T)', '48');
INSERT INTO "vaccine_type" VALUES ('24', 'PPV23', '33');
INSERT INTO "vaccine_type" VALUES ('25', 'Zoster', '121');
INSERT INTO "vaccine_type" VALUES ('26', 'Meningococcal C/Y-Hib PRP', '148');
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
INSERT INTO "normalized_vaccine_components" VALUES ('31', 'Streptococcus pneumoniae serotype 4');
INSERT INTO "normalized_vaccine_components" VALUES ('32', 'Streptococcus pneumoniae serotype 9V');
INSERT INTO "normalized_vaccine_components" VALUES ('33', 'Streptococcus pneumoniae serotype 14');
INSERT INTO "normalized_vaccine_components" VALUES ('34', 'Streptococcus pneumoniae serotype 18C');
INSERT INTO "normalized_vaccine_components" VALUES ('35', 'Streptococcus pneumoniae serotype 19F');
INSERT INTO "normalized_vaccine_components" VALUES ('36', 'Streptococcus pneumoniae serotype 23F');
INSERT INTO "normalized_vaccine_components" VALUES ('37', 'Streptococcus pneumoniae serotype 6B');
INSERT INTO "normalized_vaccine_components" VALUES ('38', 'Diphtheria CRM197 protein');
INSERT INTO "normalized_vaccine_components" VALUES ('39', 'succinate buffer (for pH control)');
INSERT INTO "normalized_vaccine_components" VALUES ('40', 'Streptococcus pneumoniae serotype 1');
INSERT INTO "normalized_vaccine_components" VALUES ('41', 'Streptococcus pneumoniae serotype 3');
INSERT INTO "normalized_vaccine_components" VALUES ('42', 'Streptococcus pneumoniae serotype 5');
INSERT INTO "normalized_vaccine_components" VALUES ('43', 'Streptococcus pneumoniae serotype 6A');
INSERT INTO "normalized_vaccine_components" VALUES ('44', 'Streptococcus pneumoniae serotype 7F');
INSERT INTO "normalized_vaccine_components" VALUES ('45', 'Streptococcus pneumoniae serotype 9V');
INSERT INTO "normalized_vaccine_components" VALUES ('46', 'Streptococcus pneumoniae serotype 8');
INSERT INTO "normalized_vaccine_components" VALUES ('47', 'Streptococcus pneumoniae serotype 9N');
INSERT INTO "normalized_vaccine_components" VALUES ('48', 'Streptococcus pneumoniae serotype 9V');
INSERT INTO "normalized_vaccine_components" VALUES ('49', 'Streptococcus pneumoniae serotype 10A');
INSERT INTO "normalized_vaccine_components" VALUES ('50', 'Streptococcus pneumoniae serotype 11A');
INSERT INTO "normalized_vaccine_components" VALUES ('51', 'Streptococcus pneumoniae serotype 12F');
INSERT INTO "normalized_vaccine_components" VALUES ('52', 'Streptococcus pneumoniae serotype 15B');
INSERT INTO "normalized_vaccine_components" VALUES ('53', 'Streptococcus pneumoniae serotype 17F');
INSERT INTO "normalized_vaccine_components" VALUES ('54', 'Streptococcus pneumoniae serotype 18C');
INSERT INTO "normalized_vaccine_components" VALUES ('55', 'Streptococcus pneumoniae serotype 19F');
INSERT INTO "normalized_vaccine_components" VALUES ('56', 'Streptococcus pneumoniae serotype 19A');
INSERT INTO "normalized_vaccine_components" VALUES ('57', 'Streptococcus pneumoniae serotype 20');
INSERT INTO "normalized_vaccine_components" VALUES ('58', 'Streptococcus pneumoniae serotype 22F');
INSERT INTO "normalized_vaccine_components" VALUES ('59', 'Streptococcus pneumoniae serotype 33F');
INSERT INTO "normalized_vaccine_components" VALUES ('60', 'Streptococcus pneumoniae serotype 8');
INSERT INTO "normalized_vaccine_components" VALUES ('61', 'Streptococcus pneumoniae serotype 9N');
INSERT INTO "normalized_vaccine_components" VALUES ('62', 'Streptococcus pneumoniae serotype 9V');
INSERT INTO "normalized_vaccine_components" VALUES ('63', 'Streptococcus pneumoniae serotype 10A');
INSERT INTO "normalized_vaccine_components" VALUES ('64', 'Streptococcus pneumoniae serotype 11A');
INSERT INTO "normalized_vaccine_components" VALUES ('65', 'Streptococcus pneumoniae serotype 12F');
INSERT INTO "normalized_vaccine_components" VALUES ('66', 'Streptococcus pneumoniae serotype 15B');
INSERT INTO "normalized_vaccine_components" VALUES ('67', 'Streptococcus pneumoniae serotype 17F');
INSERT INTO "normalized_vaccine_components" VALUES ('68', 'Streptococcus pneumoniae serotype 18C');
INSERT INTO "normalized_vaccine_components" VALUES ('69', 'Streptococcus pneumoniae serotype 19F');
INSERT INTO "normalized_vaccine_components" VALUES ('70', 'Streptococcus pneumoniae serotype 19A');
INSERT INTO "normalized_vaccine_components" VALUES ('71', 'Streptococcus pneumoniae serotype 20');
INSERT INTO "normalized_vaccine_components" VALUES ('72', 'Streptococcus pneumoniae serotype 22F');
INSERT INTO "normalized_vaccine_components" VALUES ('73', 'Streptococcus pneumoniae serotype 33F');
INSERT INTO "normalized_vaccine_components" VALUES ('74', 'Streptococcus pneumoniae serotype 2');
INSERT INTO "normalized_vaccine_components" VALUES ('75', 'calf serum');
INSERT INTO "normalized_vaccine_components" VALUES ('76', 'Streptomycin');
INSERT INTO "normalized_vaccine_components" VALUES ('77', 'Human albumin');
INSERT INTO "normalized_vaccine_components" VALUES ('78', 'Bovine serum albumin');
INSERT INTO "normalized_vaccine_components" VALUES ('79', 'monosodium L-glutamate');
INSERT INTO "normalized_vaccine_components" VALUES ('80', 'sorbitol');
INSERT INTO "normalized_vaccine_components" VALUES ('81', 'sodium bicarbonate');
INSERT INTO "normalized_vaccine_components" VALUES ('82', 'potassium phosphate');
INSERT INTO "normalized_vaccine_components" VALUES ('83', 'phosphate chloride');
INSERT INTO "normalized_vaccine_components" VALUES ('84', 'hydrolyzed gelatin');
INSERT INTO "normalized_vaccine_components" VALUES ('85', 'urea');
INSERT INTO "normalized_vaccine_components" VALUES ('86', 'yeast protein');
INSERT INTO "normalized_vaccine_components" VALUES ('87', 'recombinant human albumin');
INSERT INTO "normalized_vaccine_components" VALUES ('88', 'fetal bovine serum');
INSERT INTO "normalized_vaccine_components" VALUES ('89', 'live measles virus');
INSERT INTO "normalized_vaccine_components" VALUES ('90', 'live mumps virus');
INSERT INTO "normalized_vaccine_components" VALUES ('91', 'live rubella virus');
INSERT INTO "normalized_vaccine_components" VALUES ('92', 'hydrolyzed porcine gelatin');
INSERT INTO "normalized_vaccine_components" VALUES ('93', 'live Varicella-Zoster virus');
INSERT INTO "normalized_vaccine_components" VALUES ('94', 'sodium phosphate dibasic');
INSERT INTO "normalized_vaccine_components" VALUES ('95', 'potassium phosphate monobasic');
INSERT INTO "normalized_vaccine_components" VALUES ('97', 'potassium chloride');
INSERT INTO "normalized_vaccine_components" VALUES ('96', 'bovine calf serum');
INSERT INTO "normalized_vaccine_components" VALUES ('98', 'filamentous hemagglutinin');
INSERT INTO "normalized_vaccine_components" VALUES ('100', 'Neisseria meningitidis C');
INSERT INTO "normalized_vaccine_components" VALUES ('101', 'Neisseria meningitidis Y');
INSERT INTO "normalized_vaccine_components" VALUES ('102', 'trometamol HCl');
INSERT INTO "normalized_vaccine_components" VALUES ('103', 'fimbriae types 2 and 3');
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
	"dose" numeric(3,2) NOT NULL DEFAULT 0.5,
	"dose_measurement" varchar(3) NOT NULL DEFAULT 'ml'::character varying,
	"current_as_of" timestamp(6) NOT NULL DEFAULT now()
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccines" OWNER TO "vic";

-- ----------------------------
--  Records of "vaccines"
-- ----------------------------
BEGIN;
INSERT INTO "vaccines" VALUES ('1', '1', '1', 'Tripedia', '1', '0.50', 'ml', '2012-09-09 17:00:03.823776');
INSERT INTO "vaccines" VALUES ('2', '2', '1', 'Infanrix', '1', '0.50', 'ml', '2012-09-09 17:00:03.835687');
INSERT INTO "vaccines" VALUES ('3', '1', '8', 'ActHIB', '0', '0.50', 'ml', '2012-09-09 17:00:03.837267');
INSERT INTO "vaccines" VALUES ('4', '1', '3', 'TriHIBit', '1', '0.50', 'ml', '2012-09-09 17:00:03.838423');
INSERT INTO "vaccines" VALUES ('5', '3', '10', 'MMR', '1', '0.50', 'ml', '2012-09-09 17:00:03.839865');
INSERT INTO "vaccines" VALUES ('7', '3', '19', 'HPV-4', '0', '0.50', 'ml', '2012-09-09 17:00:03.842657');
INSERT INTO "vaccines" VALUES ('8', '1', '1', 'Daptacel', '1', '0.50', 'ml', '2012-09-09 17:00:03.845212');
INSERT INTO "vaccines" VALUES ('10', '2', '5', 'Kinrix', '1', '0.50', 'ml', '2012-09-09 17:00:03.848622');
INSERT INTO "vaccines" VALUES ('12', '1', '2', 'Adacel', '1', '0.50', 'ml', '2012-09-09 17:00:03.852474');
INSERT INTO "vaccines" VALUES ('16', '2', '15', 'Twinrix', '1', '0.50', 'ml', '2012-09-09 17:00:03.963894');
INSERT INTO "vaccines" VALUES ('17', '1', '21', 'IPOL', '0', '0.50', 'ml', '2012-09-10 12:04:09.968487');
INSERT INTO "vaccines" VALUES ('6', '3', '11', 'ProQuad', '1', '0.50', 'ml', '2012-09-09 17:00:03.841138');
INSERT INTO "vaccines" VALUES ('18', '3', '16', 'Recombivax HB', '0', '0.50', 'ml', '2012-09-10 16:17:34.863255');
INSERT INTO "vaccines" VALUES ('19', '3', '17', 'Recombivax HB', '0', '1.00', 'ml', '2012-09-10 19:47:58.138828');
INSERT INTO "vaccines" VALUES ('20', '3', '18', 'Recombivax HB', '0', '1.00', 'ml', '2012-09-10 19:47:58.331116');
INSERT INTO "vaccines" VALUES ('13', '7', '21', 'Prevnar', '0', '0.50', 'ml', '2012-09-09 17:00:03.85491');
INSERT INTO "vaccines" VALUES ('14', '7', '22', 'Prevnar 13', '0', '0.50', 'ml', '2012-09-09 17:00:03.85626');
INSERT INTO "vaccines" VALUES ('15', '3', '24', 'Pneumovax 23', '0', '0.50', 'ml', '2012-09-09 17:00:03.857603');
INSERT INTO "vaccines" VALUES ('9', '2', '4', 'Pediarix', '1', '0.50', 'ml', '2012-09-09 17:00:03.84693');
INSERT INTO "vaccines" VALUES ('11', '1', '6', 'Pentacel', '1', '0.50', 'ml', '2012-09-09 17:00:03.850459');
INSERT INTO "vaccines" VALUES ('22', '2', '26', 'Menhibrix', '1', '0.50', 'ml', '2012-09-29 10:08:15.899461');
INSERT INTO "vaccines" VALUES ('21', '3', '25', 'Zostavax', '0', '0.65', 'ml', '2012-09-24 23:15:06.127667');
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
	"dose_measurement" int2 NOT NULL,
	"antigen_type" char(1) NOT NULL DEFAULT 'O'::bpchar
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccine_components" OWNER TO "vic";

-- ----------------------------
--  Records of "vaccine_components"
-- ----------------------------
BEGIN;
INSERT INTO "vaccine_components" VALUES ('1', '1', '0.100', '2012-09-09 17:11:52.15005', '1', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('3', '1', '6.7', '2012-09-09 17:13:24.223603', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('4', '1', '0.170', '2012-09-09 17:14:02.343066', '6', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('5', '1', '5', '2012-09-09 17:14:27.72462', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('6', '1', '0', '2012-09-09 17:21:27.098845', '9', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('7', '1', '0', '2012-09-09 17:21:46.435545', '10', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('8', '4', '0.100', '2012-09-09 17:23:00.403873', '1', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('10', '4', '6.7', '2012-09-09 17:28:55.150471', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('11', '4', '0.170', '2012-09-09 17:29:50.20106', '6', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('12', '4', '5', '2012-09-09 17:30:16.648888', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('131', '15', '25', '2012-09-10 11:11:28.252711', '67', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('13', '4', '10', '2012-09-09 18:02:04.403183', '11', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('14', '4', '24', '2012-09-09 18:02:49.085146', '12', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('2', '1', '46.8', '2012-09-09 17:12:51.125297', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('9', '4', '46.8', '2012-09-09 17:28:11.5904', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('15', '4', '0.3', '2012-09-09 18:07:41.686789', '2', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('16', '1', '0.3', '2012-09-09 18:07:52.955892', '2', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('18', '2', '25', '2012-09-09 18:26:31.851408', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('19', '2', '8', '2012-09-09 18:38:11.881676', '13', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('20', '2', '25', '2012-09-09 18:38:33.303851', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('21', '2', '10', '2012-09-09 18:39:04.034748', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('22', '2', '0.625', '2012-09-09 18:39:32.910534', '7', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('23', '2', '100', '2012-09-09 18:40:21.4762', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('24', '2', '100', '2012-09-09 18:40:39.961379', '9', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('25', '2', '0', '2012-09-09 18:41:01.450172', '15', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('26', '2', '4.5', '2012-09-09 18:41:21.882856', '16', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('27', '8', '10', '2012-09-09 18:45:22.837509', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('28', '8', '3', '2012-09-09 18:45:43.401534', '13', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('29', '8', '15', '2012-09-09 18:46:08.215666', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('30', '8', '5', '2012-09-09 18:46:27.424865', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('31', '8', '5', '2012-09-09 18:46:52.531799', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('32', '8', '3.3', '2012-09-09 18:47:16.251685', '14', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('34', '8', '1.5', '2012-09-09 18:48:48.694557', '8', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('35', '9', '25', '2012-09-09 19:00:34.408302', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('36', '9', '25', '2012-09-09 19:02:55.155069', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('37', '9', '8', '2012-09-09 19:07:07.513804', '13', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('38', '9', '10', '2012-09-09 19:07:55.082331', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('39', '9', '100', '2012-09-09 19:08:17.125873', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('40', '9', '0.85', '2012-09-09 19:15:54.914175', '29', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('41', '9', '4.5', '2012-09-09 19:19:20.500886', '16', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('42', '9', '100', '2012-09-09 19:19:45.17091', '9', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('43', '9', '0', '2012-09-09 19:20:05.876644', '15', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('44', '9', '10', '2012-09-09 19:20:26.813543', '17', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('45', '9', '40', '2012-09-09 19:21:00.859338', '18', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('46', '9', '8', '2012-09-09 19:21:24.5311', '19', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('47', '9', '32', '2012-09-09 19:21:44.391831', '20', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('48', '9', '0.05', '2012-09-09 19:22:19.913401', '21', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('49', '9', '0.01', '2012-09-09 19:22:34.077057', '22', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('50', '10', '25', '2012-09-09 19:24:44.170682', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('51', '10', '8', '2012-09-09 19:25:07.683437', '13', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('52', '10', '25', '2012-09-09 19:25:42.457945', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('53', '10', '10', '2012-09-09 19:26:02.815824', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('54', '10', '100', '2012-09-09 19:26:18.018055', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('55', '10', '0.6', '2012-09-09 19:37:59.830762', '7', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('56', '10', '4.5', '2012-09-09 19:38:25.002153', '16', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('57', '10', '100', '2012-09-09 19:38:49.924992', '9', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('58', '10', '0', '2012-09-09 19:39:07.046149', '15', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('59', '10', '40', '2012-09-09 19:39:29.181193', '18', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('60', '10', '8', '2012-09-09 19:39:47.972803', '19', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('61', '10', '32', '2012-09-09 19:40:05.417577', '20', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('62', '10', '0.01', '2012-09-09 19:40:49.228623', '22', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('63', '11', '20', '2012-09-09 19:42:06.389856', '3', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('64', '11', '8', '2012-09-09 19:42:43.295096', '13', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('65', '11', '15', '2012-09-09 19:43:05.738385', '4', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('66', '11', '5', '2012-09-09 19:43:25.40832', '5', '2', 'O');
INSERT INTO "vaccine_components" VALUES ('67', '11', '10', '2012-09-09 19:43:54.351203', '11', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('68', '11', '24', '2012-09-09 19:47:49.821845', '23', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('69', '11', '5', '2012-09-09 19:48:30.325858', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('70', '11', '1.5', '2012-09-09 19:48:50.349185', '8', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('71', '11', '3.3', '2012-09-09 19:49:48.825052', '14', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('73', '11', '50', '2012-09-09 19:52:54.570977', '25', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('74', '11', '0', '2012-09-09 19:53:17.16612', '26', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('75', '11', '40', '2012-09-09 19:54:00.536573', '18', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('76', '11', '8', '2012-09-09 19:54:22.388121', '19', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('77', '11', '32', '2012-09-09 19:54:41.331426', '20', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('78', '11', '4', '2012-09-09 19:55:05.139306', '21', '1', 'O');
INSERT INTO "vaccine_components" VALUES ('79', '11', '4', '2012-09-09 19:55:20.495884', '22', '1', 'O');
INSERT INTO "vaccine_components" VALUES ('80', '13', '2', '2012-09-10 08:50:37.538229', '31', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('81', '13', '2', '2012-09-10 08:51:08.756583', '32', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('82', '13', '2', '2012-09-10 08:51:36.298522', '33', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('83', '13', '2', '2012-09-10 08:51:54.094769', '34', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('84', '13', '2', '2012-09-10 08:52:27.658495', '35', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('85', '13', '2', '2012-09-10 08:52:49.708847', '36', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('86', '13', '4', '2012-09-10 08:56:19.115285', '37', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('87', '13', '20', '2012-09-10 09:10:18.068264', '38', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('88', '13', '0.125', '2012-09-10 09:10:58.26543', '8', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('89', '14', '2.2', '2012-09-10 10:03:52.482831', '40', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('90', '14', '2.2', '2012-09-10 10:04:08.784037', '41', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('91', '14', '2.2', '2012-09-10 10:04:25.37854', '31', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('92', '14', '2.2', '2012-09-10 10:04:41.943253', '42', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('93', '14', '2.2', '2012-09-10 10:04:54.201074', '43', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('95', '14', '4.4', '2012-09-10 10:06:37.40334', '37', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('96', '14', '2.2', '2012-09-10 10:07:02.75147', '44', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('97', '14', '2.2', '2012-09-10 10:07:10.370291', '32', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('98', '14', '2.2', '2012-09-10 10:07:10.370291', '45', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('99', '14', '2.2', '2012-09-10 10:07:16.94836', '33', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('100', '14', '2.2', '2012-09-10 10:07:24.314804', '34', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('101', '14', '2.2', '2012-09-10 10:07:39.559357', '35', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('102', '14', '2.2', '2012-09-10 10:07:45.495496', '36', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('103', '14', '34', '2012-09-10 10:08:05.486274', '38', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('104', '14', '0.125', '2012-09-10 10:08:30.952663', '8', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('105', '14', '295', '2012-09-10 10:09:19.009961', '39', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('106', '15', '25', '2012-09-10 11:01:31.090298', '40', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('107', '15', '25', '2012-09-10 11:03:38.36644', '74', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('108', '15', '25', '2012-09-10 11:03:42.266708', '41', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('109', '15', '25', '2012-09-10 11:06:12.733679', '31', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('110', '15', '25', '2012-09-10 11:06:18.343869', '42', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('111', '15', '25', '2012-09-10 11:06:26.989888', '37', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('112', '15', '25', '2012-09-10 11:06:34.317562', '44', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('113', '15', '25', '2012-09-10 11:06:39.813241', '46', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('115', '15', '25', '2012-09-10 11:06:47.017767', '47', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('117', '15', '25', '2012-09-10 11:06:51.295298', '32', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('121', '15', '25', '2012-09-10 11:06:58.687374', '49', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('123', '15', '25', '2012-09-10 11:07:05.61763', '50', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('125', '15', '25', '2012-09-10 11:07:12.24925', '51', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('127', '15', '25', '2012-09-10 11:07:19.271737', '33', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('128', '15', '25', '2012-09-10 11:07:26.223292', '52', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('132', '15', '25', '2012-09-10 11:17:17.931291', '34', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('137', '15', '25', '2012-09-10 11:21:29.952495', '69', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('139', '15', '25', '2012-09-10 11:21:37.546987', '70', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('141', '15', '25', '2012-09-10 11:21:44.968639', '71', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('142', '15', '25', '2012-09-10 11:21:57.185289', '58', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('144', '15', '25', '2012-09-10 11:22:00.334786', '36', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('146', '15', '25', '2012-09-10 11:22:06.564381', '73', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('147', '17', '40', '2012-09-10 12:09:54.747687', '18', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('148', '17', '8', '2012-09-10 12:10:41.274829', '19', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('149', '17', '32', '2012-09-10 12:11:29.372818', '20', '3', 'O');
INSERT INTO "vaccine_components" VALUES ('150', '17', '200', '2012-09-10 12:14:02.417006', '76', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('151', '17', '25', '2012-09-10 12:16:11.061673', '22', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('152', '17', '5', '2012-09-10 12:16:52.60735', '21', '6', 'O');
INSERT INTO "vaccine_components" VALUES ('153', '17', '0', '2012-09-10 12:24:25.562952', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('154', '17', '0', '2012-09-10 12:29:27.769353', '14', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('155', '17', '1', '2012-09-10 12:31:09.729488', '75', '4', 'O');
INSERT INTO "vaccine_components" VALUES ('156', '18', '0.5', '2012-09-10 20:57:29.471299', '7', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('157', '18', '5', '2012-09-10 20:58:17.496934', '17', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('158', '18', '7.5', '2012-09-10 20:58:49.173674', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('159', '18', '0', '2012-09-10 20:59:40.232514', '86', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('160', '19', '10', '2012-09-10 21:01:08.73299', '17', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('161', '19', '0.5', '2012-09-10 21:01:30.370844', '7', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('162', '19', '15', '2012-09-10 21:01:49.166526', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('163', '19', '0', '2012-09-10 21:02:22.637349', '86', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('164', '5', '14.5', '2012-09-10 21:06:33.725651', '84', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('165', '5', '14.5', '2012-09-10 21:07:16.130101', '80', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('166', '5', '1.9', '2012-09-10 21:07:36.979649', '24', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('167', '5', '0.3', '2012-09-10 21:09:52.83392', '87', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('168', '5', '1', '2012-09-10 21:12:50.559102', '88', '4', 'O');
INSERT INTO "vaccine_components" VALUES ('169', '5', '25', '2012-09-10 21:13:51.954755', '21', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('170', '5', '1000', '2012-09-10 21:17:40.556235', '89', '8', 'O');
INSERT INTO "vaccine_components" VALUES ('171', '5', '12500', '2012-09-10 21:18:11.533089', '90', '8', 'O');
INSERT INTO "vaccine_components" VALUES ('172', '5', '1000', '2012-09-10 21:18:58.67908', '91', '8', 'O');
INSERT INTO "vaccine_components" VALUES ('173', '21', '19400', '2012-09-25 00:18:21.610003', '93', '9', 'O');
INSERT INTO "vaccine_components" VALUES ('174', '21', '31.16', '2012-09-25 00:18:51.105677', '24', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('175', '21', '15.58', '2012-09-25 00:19:11.304106', '92', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('176', '21', '3.99', '2012-09-25 00:19:32.274096', '16', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('177', '21', '0.62', '2012-09-25 00:19:55.007074', '79', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('178', '21', '0.57', '2012-09-25 00:20:16.532446', '94', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('179', '21', '0.10', '2012-09-25 00:20:34.601113', '95', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('180', '21', '0', '2012-09-25 00:21:10.224767', '26', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('182', '21', '0', '2012-09-25 00:21:20.998328', '21', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('185', '21', '0.10', '2012-09-25 00:33:49.431523', '97', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('186', '21', '0', '2012-09-25 00:37:44.250307', '96', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('187', '10', '25', '2012-09-27 23:02:23.108974', '98', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('189', '6', '20', '2012-09-28 23:04:42.365808', '24', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('190', '6', '11', '2012-09-28 23:05:18.615367', '84', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('191', '6', '2.5', '2012-09-28 23:06:12.764216', '85', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('192', '6', '2.3', '2012-09-28 23:06:26.689684', '16', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('193', '6', '16', '2012-09-28 23:07:08.458419', '80', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('194', '6', '0.38', '2012-09-28 23:08:16.990696', '79', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('195', '6', '0.13', '2012-09-28 23:08:47.745581', '81', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('196', '6', '94', '2012-09-28 23:09:11.351984', '82', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('197', '6', '58', '2012-09-28 23:09:35.538808', '97', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('198', '6', '0', '2012-09-28 23:11:01.522642', '26', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('199', '6', '0', '2012-09-28 23:11:25.462401', '27', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('200', '6', '5', '2012-09-28 23:11:56.94993', '21', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('201', '6', '0.5', '2012-09-28 23:12:23.592219', '78', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('202', '22', '5', '2012-09-29 10:59:50.283667', '100', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('203', '22', '2.5', '2012-09-29 11:03:06.737255', '11', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('204', '22', '17.25', '2012-09-29 11:03:32.310873', '5', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('205', '22', '96.8', '2012-09-29 11:03:54.858192', '102', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('206', '22', '12.6', '2012-09-29 11:04:18.508833', '24', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('207', '22', '0.72', '2012-09-29 11:04:36.966574', '1', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('208', '22', '5', '2012-09-29 11:07:22.605122', '101', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('209', '9', '25', '2012-09-29 12:34:35.381617', '98', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('210', '8', '5', '2012-09-29 12:36:05.364225', '98', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('211', '8', '5', '2012-09-29 12:37:03.548995', '103', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('212', '2', '25', '2012-09-29 12:39:12.344057', '98', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('213', '11', '20', '2012-09-29 12:42:48.739472', '98', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('214', '11', '5', '2012-09-29 12:43:11.004705', '103', '7', 'O');
INSERT INTO "vaccine_components" VALUES ('215', '11', '42.5', '2012-09-29 12:45:05.608237', '24', '5', 'O');
INSERT INTO "vaccine_components" VALUES ('72', '11', '50', '2012-09-09 19:52:39.762708', '78', '6', 'O');
COMMIT;

-- ----------------------------
--  Table structure for "cvx_mvx_map"
-- ----------------------------
DROP TABLE IF EXISTS "cvx_mvx_map";
CREATE TABLE "cvx_mvx_map" (
	"product_name" varchar(50) NOT NULL,
	"description" varchar(100) NOT NULL,
	"cvx" int2 NOT NULL,
	"manufacturer" varchar(100) NOT NULL,
	"mvx" varchar(5) NOT NULL,
	"mvx_status" varchar(10) NOT NULL,
	"product_name_status" varchar(10) NOT NULL,
	"last_updated" date NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "cvx_mvx_map" OWNER TO "vic";

-- ----------------------------
--  Records of "cvx_mvx_map"
-- ----------------------------
BEGIN;
INSERT INTO "cvx_mvx_map" VALUES ('Adenovirus types 4 and 7', 'Adenovirus types 4 and 7', '143', 'Barr Laboratories', 'BRR', 'Active', 'Active', '2012-08-07');
INSERT INTO "cvx_mvx_map" VALUES ('BIOTHRAX', 'anthrax', '24', 'Emergent BioDefense Operations Lansing', 'MIP', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('MYCOBAX', 'BCG', '19', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('TICE BCG', 'BCG', '19', 'Organon Teknika Corporation', 'OTC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('DT(GENERIC)', 'DT (pediatric)', '28', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ACEL-IMUNE', 'DTaP', '20', 'Wyeth', 'WAL', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('CERTIVA', 'DTaP', '20', 'North American Vaccine Inc.', 'NAV', 'Inactive', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('INFANRIX', 'DTaP', '20', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('TRIPEDIA', 'DTaP', '20', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('DAPTACEL', 'DTaP 5 pertussis antigens', '106', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('PEDIARIX', 'DTaP-Hep B-IPV', '110', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('TRIHIBIT', 'DTaP-Hib', '50', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('PENTACEL', 'DTaP-Hib-IPV', '120', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('KINRIX', 'DTaP-IPV', '130', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('TETRAMUNE', 'DTP-Hib', '22', 'Wyeth', 'WAL', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('HAVRIX-ADULT', 'Hep A adult', '52', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('VAQTA-ADULT', 'Hep A adult', '52', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('HAVRIX-PEDS', 'Hep A ped/adol 2 dose', '83', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('VAQTA-PEDS', 'Hep A ped/adol 2 dose', '83', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('TWINRIX', 'Hep A-Hep B', '104', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ENGERIX B-PEDS', 'Hep B adolescent or pediatric', '8', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('RECOMBIVAX-PEDS', 'Hep B adolescent or pediatric', '8', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ENGERIX-B-ADULT', 'Hep B adult', '43', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('RECOMBIVAX-ADULT', 'Hep B adult', '43', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('RECOMBIVAX-DIALYSIS', 'Hep B dialysis', '44', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-09-20');
INSERT INTO "cvx_mvx_map" VALUES ('HIBTITER', 'Hib (HbOC)', '47', 'Wyeth', 'WAL', 'Active', 'Inactive', '2010-08-18');
INSERT INTO "cvx_mvx_map" VALUES ('PROHIBIT', 'Hib (PRP-D)', '46', 'sanofi pasteur', 'PMC', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('PEDVAXHIB', 'Hib (PRP-OMP)', '49', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ACTHIB', 'Hib (PRP-T)', '48', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('HIBERIX', 'Hib (PRP-T)', '48', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('OMNIHIB', 'Hib (PRP-T)', '48', 'GlaxoSmithKline', 'SKB', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('COMVAX', 'Hib-Hep B', '51', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('CERVARIX', 'HPV bivalent', '118', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('GARDASIL', 'HPV quadrivalent', '62', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('FLUZONE-HIGH DOSE', 'Influenza high dose seasonal', '135', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('FLUMIST', 'influenza live intranasal', '111', 'MedImmune Inc.', 'MED', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('Flumist quadrivalent', 'influenza live intranasal quadrivalent', '149', 'MedImmune Inc.', 'MED', 'Active', 'Active', '2012-08-07');
INSERT INTO "cvx_mvx_map" VALUES ('AFLURIA', 'Influenza seasonal injectable', '141', 'CSL Behring Inc', 'CSL', 'Active', 'Active', '2011-04-25');
INSERT INTO "cvx_mvx_map" VALUES ('FLULAVAL', 'Influenza seasonal injectable', '141', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('FLUVIRIN', 'Influenza seasonal injectable', '141', 'Novartis Pharmaceutical Corporation', 'NOV', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('FLUZONE', 'Influenza seasonal injectable', '141', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('Afluria preservative free', 'Influenza seasonal injectable preservative free', '140', 'CSL Behring Inc', 'CSL', 'Active', '', '2011-05-02');
INSERT INTO "cvx_mvx_map" VALUES ('AGRIFLU', 'Influenza seasonal injectable preservative free', '140', 'Novartis Pharmaceutical Corporation', 'NOV', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('FLUARIX', 'Influenza seasonal injectable preservative free', '140', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('FLUVIRIN-PRESERVATIVE FREE', 'Influenza seasonal injectable preservative free', '140', 'Novartis Pharmaceutical Corporation', 'NOV', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('FLUZONE-PRESERVATIVE FREE', 'Influenza seasonal injectable preservative free', '140', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-09-27');
INSERT INTO "cvx_mvx_map" VALUES ('Fluzone intradermal', 'influenza seasonal intradermal preservative free', '144', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2011-06-30');
INSERT INTO "cvx_mvx_map" VALUES ('IPOL', 'IPV', '10', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('IXIARO', 'Japanese Encephalitis IM', '134', 'Intercell Biomedical', 'INT', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('JE-VAX', 'Japanese encephalitis SC', '39', 'The Research Foundation for Microbial Diseases of Osaka University (BIKEN)', 'JPN', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ATTENUVAX', 'measles', '5', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2012-08-07');
INSERT INTO "cvx_mvx_map" VALUES ('MENHIBRIX', 'Meningococcal C/Y-HIB PRP', '148', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2012-07-11');
INSERT INTO "cvx_mvx_map" VALUES ('MENVEO', 'Meningococcal MCV4O', '136', 'Novartis Pharmaceutical Corporation', 'NOV', 'Active', 'Active', '2010-08-16');
INSERT INTO "cvx_mvx_map" VALUES ('MENACTRA', 'meningococcal MCV4P', '114', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('MENOMUNE', 'meningococcal MPSV4', '32', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('M-M-R II', 'MMR', '3', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('PROQUAD', 'MMRV', '94', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('MUMPSVAX', 'mumps', '7', 'Merck & Co. Inc.', 'MSD', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('ORIMUNE', 'OPV', '2', 'Wyeth', 'WAL', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('PREVNAR 13', 'Pneumococcal conjugate PCV 13', '133', 'Wyeth', 'WAL', 'Active', 'Inactive', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('PREVNAR 13', 'Pneumococcal conjugate PCV 13', '133', 'Pfizer Inc', 'PFR', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('PNEUMOVAX 23', 'pneumococcal polysaccharide PPV23', '33', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('IMOVAX ID', 'rabies intradermal injection', '40', 'sanofi pasteur', 'PMC', 'Active', 'Inactive', '2010-08-18');
INSERT INTO "cvx_mvx_map" VALUES ('RabAvert', 'rabies intradermal injection', '40', 'Chiron Corporation', 'CHI', 'Inactive', 'Inactive', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('IMOVAX', 'rabies intramuscular injection', '18', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('RABAVERT', 'rabies intramuscular injection', '18', 'Novartis Pharmaceutical Corporation', 'NOV', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ROTARIX', 'rotavirus monovalent', '119', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ROTATEQ', 'rotavirus pentavalent', '116', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('MERUVAX II', 'rubella', '6', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-08-18');
INSERT INTO "cvx_mvx_map" VALUES ('BIAVAX II', 'rubella/mumps', '38', 'Merck & Co. Inc.', 'MSD', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('DECAVAC', 'Td (adult) preservative free', '113', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('Tenivac', 'Td (adult) preservative free', '113', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2012-08-02');
INSERT INTO "cvx_mvx_map" VALUES ('TD(GENERIC)', 'Td (adult) adsorbed', '9', 'Massachusetts Biologic Laboratories', 'MBL', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ADACEL', 'Tdap', '115', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('BOOSTRIX', 'Tdap', '115', 'GlaxoSmithKline', 'SKB', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('TETANUS TOXOID (GENERIC)', 'tetanus toxoid adsorbed', '35', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('VIVOTIF BERNA', 'typhoid oral', '25', 'Berna Products Corporation', 'BPC', 'Active', 'Active', '2011-02-14');
INSERT INTO "cvx_mvx_map" VALUES ('TYPHOID-AKD', 'typhoid parenteral AKD (U.S. military)', '53', 'United States Army Medical Research and Material Command', 'USA', 'Active', 'Active', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('TYPHIM VI', 'typhoid ViCPs', '101', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ACAM2000', 'vaccinia (smallpox)', '75', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ACAM2000', 'vaccinia (smallpox)', '75', 'Acambis Inc', 'ACA', 'Inactive', 'Inactive', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('DRYVAX', 'vaccinia (smallpox)', '75', 'Wyeth', 'WAL', 'Active', 'Inactive', '2010-09-01');
INSERT INTO "cvx_mvx_map" VALUES ('VARIVAX', 'varicella', '21', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('YF-VAX', 'yellow fever', '37', 'sanofi pasteur', 'PMC', 'Active', 'Active', '2010-05-28');
INSERT INTO "cvx_mvx_map" VALUES ('ZOSTAVAX', 'zoster', '121', 'Merck & Co. Inc.', 'MSD', 'Active', 'Active', '2010-05-28');
COMMIT;

-- ----------------------------
--  Function structure for lookup_vaccines(text)
-- ----------------------------
DROP FUNCTION IF EXISTS "lookup_vaccines"(text);
CREATE FUNCTION "lookup_vaccines"(IN check_disease text) RETURNS SETOF "vic"."lookup_vaccines_type" 
	AS $BODY$ 

DECLARE
	results TEXT := '' ; 
	searchsql TEXT := '' ; 
	var_match TEXT := '' ; 
	vax_type_id TEXT := '';

BEGIN

	check_disease := '''%'||check_disease||'%''';

	searchsql := 'WITH vax_type_id AS (
		SELECT DISTINCT
			vaccine_type_id
		FROM
			disease
		WHERE
			disease ILIKE ' || quote_nullable(check_disease) || '
		) 
		SELECT cmm.description, cmm.product_name, cmm.manufacturer FROM vaccine_type vt
		JOIN cvx_mvx_map cmm on cmm.cvx = vt.cvx
		WHERE vaccine_type_id IN (SELECT * FROM vax_type_id)';

	EXECUTE (searchsql) INTO results;

	RETURN;

IF NOT FOUND THEN
    RAISE EXCEPTION 'disease % not found', check_disease;
END IF;

END ; 
$BODY$
	LANGUAGE plpgsql
	COST 100
	ROWS 1000
	CALLED ON NULL INPUT
	SECURITY INVOKER
	IMMUTABLE;
ALTER FUNCTION "lookup_vaccines"(IN check_disease text) OWNER TO "vic";


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
CREATE UNIQUE INDEX "vaccines_vaccine_id_key" ON "vaccines" USING btree(vaccine_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "vaccine_components"
-- ----------------------------
ALTER TABLE "vaccine_components" ADD CONSTRAINT "vaccine_component_id" PRIMARY KEY ("component_id", "vaccine_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "vaccine_components"
-- ----------------------------
CREATE UNIQUE INDEX "ix_vax_components" ON "vaccine_components" USING btree(vaccine_id ASC NULLS LAST, normalized_component_id ASC NULLS LAST);

