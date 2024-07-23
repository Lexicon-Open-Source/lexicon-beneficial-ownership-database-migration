-- POSTGRESQL

-- Add Language Column
ALTER TABLE extraction ADD COLUMN "language" varchar(10) NOT NULL DEFAULT 'en';
