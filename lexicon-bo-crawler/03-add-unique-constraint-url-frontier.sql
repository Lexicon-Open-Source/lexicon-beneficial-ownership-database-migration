-- POSTGRESQL
ALTER TABLE url_frontier ADD CONSTRAINT url_frontier_unique UNIQUE (url);

ALTER TABLE url_frontier ALTER COLUMN id TYPE VARCHAR(64) ;

alter table url_frontier drop column hash;

ALTER TABLE extraction ALTER COLUMN id TYPE VARCHAR(64) ;
ALTER TABLE extraction ALTER column "url_frontier_id" TYPE VARCHAR(64);

-- ADD Column metadata to extraction table
ALTER TABLE extraction ADD column metadata JSONB NULL;