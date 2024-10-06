-- POSTGRESQL



ALTER TABLE cases ADD COLUMN summary_en text null default NULL;
ALTER TABLE cases ADD COLUMN summary_formatted_en text null default NULL;

ALTER TABLE draft_cases ADD COLUMN summary_en text null default NULL;
ALTER TABLE draft_cases ADD COLUMN summary_formatted_en text null default NULL;