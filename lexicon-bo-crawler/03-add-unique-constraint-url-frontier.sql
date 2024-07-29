-- POSTGRESQL
ALTER TABLE url_frontier ADD CONSTRAINT url_frontier_unique UNIQUE (url);

ALTER TABLE url_frontier ALTER COLUMN id TYPE varchar(64) ;

alter table url_frontier drop column hash;

ALTER TABLE extraction ALTER COLUMN id TYPE varchar(64) ;
alter table extraction alter column "url_frontier_id" type varchar(64);