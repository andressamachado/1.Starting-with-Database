/*
Created: 3/5/2018
Modified: 3/5/2018
Model: RE PostgreSQL 9.5
Database: PostgreSQL 9.5
*/


-- Create schemas section -------------------------------------------------

CREATE SCHEMA "public" AUTHORIZATION "postgres"
;

COMMENT ON SCHEMA "public" IS 'standard public schema'
;

-- Create tables section -------------------------------------------------

-- Table public.park_t

CREATE TABLE "public"."park_t"(
 "parkid" Character(4) NOT NULL,
 "abbreviation" Character(2) NOT NULL,
 "parkname" Character varying(45)
)
;

-- Add keys for table public.park_t

ALTER TABLE "public"."park_t" ADD CONSTRAINT "park_pk" PRIMARY KEY ("parkid")
;

-- Table public.parkvegetation_t

CREATE TABLE "public"."parkvegetation_t"(
 "vegid" Character(4) NOT NULL,
 "parkid" Character(4) NOT NULL
)
;

-- Add keys for table public.parkvegetation_t

ALTER TABLE "public"."parkvegetation_t" ADD CONSTRAINT "parkvegetation_pk" PRIMARY KEY ("parkid","vegid")
;

-- Table public.province_t

CREATE TABLE "public"."province_t"(
 "abbreviation" Character(2) NOT NULL,
 "province" Character(35),
 "capital" Character(30)
)
;

-- Add keys for table public.province_t

ALTER TABLE "public"."province_t" ADD CONSTRAINT "abbreviation_pk" PRIMARY KEY ("abbreviation")
;

-- Table public.vegetation_t

CREATE TABLE "public"."vegetation_t"(
 "vegid" Character(4) NOT NULL,
 "vegname" Character varying(45)
)
;

-- Add keys for table public.vegetation_t

ALTER TABLE "public"."vegetation_t" ADD CONSTRAINT "vegetation_pk" PRIMARY KEY ("vegid")
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "public"."park_t" ADD CONSTRAINT "abbrev_fk" FOREIGN KEY ("abbreviation") REFERENCES "public"."province_t" ("abbreviation") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."parkvegetation_t" ADD CONSTRAINT "parkid_fk" FOREIGN KEY ("parkid") REFERENCES "public"."park_t" ("parkid") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."parkvegetation_t" ADD CONSTRAINT "vegid_fk" FOREIGN KEY ("vegid") REFERENCES "public"."vegetation_t" ("vegid") ON DELETE NO ACTION ON UPDATE NO ACTION
;



-- Grant permissions section -------------------------------------------------


GRANT CREATE ON SCHEMA "public" TO "postgres"
;
GRANT USAGE ON SCHEMA "public" TO "postgres"
;
GRANT CREATE ON SCHEMA "public" TO "public"
;
GRANT USAGE ON SCHEMA "public" TO "public"
;
