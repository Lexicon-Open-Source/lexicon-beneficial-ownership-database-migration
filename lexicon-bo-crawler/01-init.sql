-- POSTGRESQL

-- Create Database
CREATE DATABASE lexicon_bo_crawler;

-- Create UrlFrontier Table

CREATE TABLE "url_frontier" (
  "id" bpchar(26) NOT NULL PRIMARY KEY,
  "domain" varchar(255) NOT NULL,
  "url" varchar(255) NOT NULL,
  "crawler" varchar(255) NOT NULL,
  "hash" varchar(255) NULL,
  "status" smallint NOT NULL DEFAULT 0,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Set Comment for Status Column
COMMENT ON COLUMN "url_frontier"."status" IS '0: Pending, 1: Crawled, 2: Changed';

-- Create index for domain
CREATE INDEX idx_domain ON url_frontier (domain);

-- Create index for url
CREATE INDEX idx_url ON url_frontier (url);

-- Create index for crawler
CREATE INDEX idx_crawler ON url_frontier (crawler);


-- Create extraction table
CREATE TABLE "extraction" (
  "id" bpchar(26) NOT NULL PRIMARY KEY,
  "url_frontier_id" varchar(255) NOT NULL,
  "site_content" text NULL,
  "artifact_link" varchar(255) NULL,
  "raw_page_link" varchar(255) NULL,
  "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  CONSTRAINT fk_extraction_url_frontier_id FOREIGN KEY (url_frontier_id) REFERENCES url_frontier(id)
)


