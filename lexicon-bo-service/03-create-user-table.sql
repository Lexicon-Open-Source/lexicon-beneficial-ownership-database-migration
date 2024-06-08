-- PostgreSQL
-- Create User Table
CREATE TABLE users (
    "id" varchar(26) NOT NULL PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL UNIQUE,
    "password" varchar(255) NOT NULL,
    "status" smallint NOT NULL DEFAULT 1 ,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL,
    "deleted_at" timestamp NULL DEFAULT NULL,
    "group" varchar(50) DEFAULT 'user' NOT NULL
);
CREATE INDEX idx_users_group ON users ("group");
COMMENT ON COLUMN users.status IS '1 = Active, 0 = Inactive';