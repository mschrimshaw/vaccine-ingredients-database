/*
 Navicat PostgreSQL Data Transfer

 Source Server         : local VIC instance
 Source Server Version : 90103
 Source Host           : localhost
 Source Database       : VIC
 Source Schema         : vic

 Target Server Version : 90103
 File Encoding         : utf-8

 Date: 09/04/2012 20:52:12 PM
*/

-- ----------------------------
--  Sequence structure for "disease_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "disease_id_seq";
CREATE SEQUENCE "disease_id_seq" INCREMENT 1 START 27 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "disease_id_seq" OWNER TO "mschrimshaw";

-- ----------------------------
--  Sequence structure for "manufacturer_manufacturer_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "manufacturer_manufacturer_id_seq";
CREATE SEQUENCE "manufacturer_manufacturer_id_seq" INCREMENT 1 START 6 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "manufacturer_manufacturer_id_seq" OWNER TO "mschrimshaw";

-- ----------------------------
--  Sequence structure for "normalized_vaccine_components_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "normalized_vaccine_components_id_seq";
CREATE SEQUENCE "normalized_vaccine_components_id_seq" INCREMENT 1 START 29 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "normalized_vaccine_components_id_seq" OWNER TO "mschrimshaw";

-- ----------------------------
--  Sequence structure for "vaccine_components_component_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_components_component_id_seq";
CREATE SEQUENCE "vaccine_components_component_id_seq" INCREMENT 1 START 80 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_components_component_id_seq" OWNER TO "mschrimshaw";

-- ----------------------------
--  Sequence structure for "vaccine_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_id_seq";
CREATE SEQUENCE "vaccine_id_seq" INCREMENT 1 START 13 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_id_seq" OWNER TO "mschrimshaw";

-- ----------------------------
--  Sequence structure for "vaccine_type_id_seq"
-- ----------------------------
DROP SEQUENCE IF EXISTS "vaccine_type_id_seq";
CREATE SEQUENCE "vaccine_type_id_seq" INCREMENT 1 START 21 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "vaccine_type_id_seq" OWNER TO "mschrimshaw";

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
ALTER TABLE "vaccine_type" OWNER TO "mschrimshaw";

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
ALTER TABLE "disease" OWNER TO "mschrimshaw";

-- ----------------------------
--  Table structure for "normalized_vaccine_components"
-- ----------------------------
DROP TABLE IF EXISTS "normalized_vaccine_components";
CREATE TABLE "normalized_vaccine_components" (
	"normalized_id" int4 NOT NULL DEFAULT nextval('normalized_vaccine_components_id_seq'::regclass),
	"component_name" varchar(100) NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "normalized_vaccine_components" OWNER TO "mschrimshaw";

-- ----------------------------
--  Table structure for "vaccine_components"
-- ----------------------------
DROP TABLE IF EXISTS "vaccine_components";
CREATE TABLE "vaccine_components" (
	"component_id" int4 NOT NULL DEFAULT nextval('vaccine_components_component_id_seq'::regclass),
	"vaccine_id" int4 NOT NULL,
	"dose" numeric NOT NULL,
	"dose_measurement" varchar(3) NOT NULL,
	"current_as_of" timestamp(6) NOT NULL DEFAULT now(),
	"normalized_component_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "vaccine_components" OWNER TO "mschrimshaw";

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
ALTER TABLE "manufacturer" OWNER TO "mschrimshaw";

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
ALTER TABLE "vaccines" OWNER TO "mschrimshaw";


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "disease_id_seq" OWNED BY "disease"."disease_id";
ALTER SEQUENCE "manufacturer_manufacturer_id_seq" OWNED BY "manufacturer"."manufacturer_id";
ALTER SEQUENCE "normalized_vaccine_components_id_seq" OWNED BY "normalized_vaccine_components"."normalized_id";
ALTER SEQUENCE "vaccine_components_component_id_seq" OWNED BY "vaccine_components"."component_id";
ALTER SEQUENCE "vaccine_id_seq" OWNED BY "vaccines"."vaccine_id";
ALTER SEQUENCE "vaccine_type_id_seq" OWNED BY "vaccine_type"."vaccine_type_id";
-- ----------------------------
--  Primary key structure for table "vaccine_type"
-- ----------------------------
ALTER TABLE "vaccine_type" ADD CONSTRAINT "vaccine_type_id" PRIMARY KEY ("vaccine_type_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "disease"
-- ----------------------------
ALTER TABLE "disease" ADD CONSTRAINT "disease_id" PRIMARY KEY ("disease_id", "vaccine_type_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "normalized_vaccine_components"
-- ----------------------------
ALTER TABLE "normalized_vaccine_components" ADD CONSTRAINT "normalized_id" PRIMARY KEY ("normalized_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "normalized_vaccine_components"
-- ----------------------------
CREATE UNIQUE INDEX "normalized_vaccine_components_normalized_id_key" ON "normalized_vaccine_components" USING btree(normalized_id ASC NULLS LAST);

-- ----------------------------
--  Primary key structure for table "vaccine_components"
-- ----------------------------
ALTER TABLE "vaccine_components" ADD CONSTRAINT "vaccine_component_id" PRIMARY KEY ("component_id", "vaccine_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "manufacturer"
-- ----------------------------
ALTER TABLE "manufacturer" ADD CONSTRAINT "manufacturer_id" PRIMARY KEY ("manufacturer_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table "vaccines"
-- ----------------------------
ALTER TABLE "vaccines" ADD CONSTRAINT "vaccines_id" PRIMARY KEY ("vaccine_id", "manufacturer_id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table "vaccines"
-- ----------------------------
CREATE INDEX "vaccines_idx" ON "vaccines" USING btree(manufacturer_id ASC NULLS LAST);

