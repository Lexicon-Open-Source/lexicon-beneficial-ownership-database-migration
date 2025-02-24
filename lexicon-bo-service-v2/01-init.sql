
CREATE TABLE cases (
    id VARCHAR(26) PRIMARY KEY,
    "subject" VARCHAR(255) NOT NULL,
    subject_type SMALLINT NOT NULL,
    person_in_charge VARCHAR(255),
    beneficial_ownership TEXT,
    case_date DATE,
    decision_number VARCHAR(255),
    source VARCHAR(255),
    link VARCHAR(255),
    nation VARCHAR(255),
    punishment_start DATE,
    punishment_end DATE,
    case_type SMALLINT,
    year VARCHAR(4),
    summary TEXT NULL DEFAULT NULL,
    summary_formatted TEXT NULL DEFAULT NULL,
    summary_en TEXT NULL DEFAULT NULL,
    summary_formatted_en TEXT NULL DEFAULT NULL,
    status SMALLINT DEFAULT 2,
    slug VARCHAR(255),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(26),
    updated_by VARCHAR(26),
    deleted_by VARCHAR(26),
    deleted_at TIMESTAMPTZ
);

-- create new one
CREATE INDEX idx_search_filter ON cases (subject_type, year, case_type, nation, "status");


-- alter table to add search index column for fast full text search
ALTER TABLE cases ADD COLUMN fulltext_search_index tsvector GENERATED ALWAYS AS (to_tsvector('english', subject || ' ' || summary)) STORED;

-- create fulltext search index on Subject and Summary Postgresql
CREATE INDEX idx_search_fulltext ON cases USING GIN (fulltext_search_index);
