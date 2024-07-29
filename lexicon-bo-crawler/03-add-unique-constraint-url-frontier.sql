-- POSTGRESQL
ALTER TABLE url_frontier ADD CONSTRAINT url_frontier_unique UNIQUE (url);

ALTER TABLE url_frontier ALTER COLUMN id TYPE varchar(64) ;