-- POSTGRESQL

-- create Draft Case Table

CREATE TABLE "draft_cases" (
  "id" VARCHAR(26) NOT NULL PRIMARY KEY,
  "subject" varchar(255) NOT NULL,
  "subject_type" smallint NOT NULL,
  "person_in_charge" varchar(255) NULL,
  "beneficial_ownership" TEXT NULL,
  "case_date" date NOT NULL,
  "decision_number" varchar(255) NOT NULL,
  "source" varchar(255) NOT NULL,
  "link" varchar(255) NOT NULL,
  "nation" varchar(255) NOT NULL,
  "punishment_start" date NULL,
  "punishment_end" date NULL,
  "case_type" smallint NOT NULL,
  "year" varchar(4) NOT NULL,
  "summary" text NULL,
  "summary_formatted" text NULL,
  "summary_en" text NULL,
  "summary_formatted_en" text NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- add each index to type, nation, year, subject

CREATE INDEX idx_subject_type ON "draft_cases" ("subject_type");
CREATE INDEX idx_subject ON "draft_cases" ("subject");
CREATE INDEX idx_year ON "draft_cases" ("year");

