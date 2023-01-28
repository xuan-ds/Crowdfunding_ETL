-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- Drop Tables if exist
Drop TABLE "category", 
"subcategory", 
"campaign", 
"contact" 

-- Create Tables
CREATE TABLE "category" (
    "category_id" VARCHAR(30) NOT NULL,
    "category" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(30) NOT NULL,
    "subcategory" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" INT  NOT NULL,
    "contact_id" INT  NOT NULL,
    "company_name" VARCHAR(80) NOT NULL,
    "description" VARCHAR(80) NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR(45) NOT NULL,
    "backers_count" INT  NOT NULL,
    "country" VARCHAR(30) NOT NULL,
    "currency" VARCHAR(30) NOT NULL,
    "launched_date" DATE  NOT NULL,
    "end_date" DATE  NOT NULL,
    "category_id" VARCHAR(30) NOT NULL,
    "subcategory_id" VARCHAR(30) NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "contact" (
    "contact_id" INT   NOT NULL,
    "fist_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "email" VARCHAR(45) NOT NULL,
    CONSTRAINT "pk_contact" PRIMARY KEY (
        "contact_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contact" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

