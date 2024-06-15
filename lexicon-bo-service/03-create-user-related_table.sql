-- PostgreSQL
-- Create User Table
CREATE TABLE "users" (
    "id" bpchar(26) NOT NULL PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL UNIQUE,
    "password" varchar(255) NOT NULL,
    "email_verified_at" timestamp NULL ,
    "remember_token" varchar(100) NULL,
    "profile_photo_path" varchar(2048) NULL,
    "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp NULL,
    "two_factor_secret" text NULL,
    "two_factor_recovery_codes" text NULL,
    "two_factor_confirmed_at" timestamp NULL,
);

-- Create Password Reset Token Table
CREATE TABLE "password_reset_tokens" (
    "email" varchar(255) NOT NULL PRIMARY KEY,
    "token" varchar(255) NOT NULL,
    "created_at" timestamp NULL
);

-- Create Personal Access Token Table
CREATE TABLE "personal_access_tokens" (
    "id" integer NOT NULL PRIMARY KEY,
    "tokenable_type" varchar(255) NOT NULL,
    "tokenable_id" bpchar(26) NOT NULL,
    "name" varchar(255) NOT NULL,
    "token" varchar(64) NOT NULL UNIQUE,
    "abilities" text NULL,
    "last_used_at" timestamp NULL,
    "expires_at" timestamp NULL,
    "created_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" timestamp NULL
);

-- add index to tokenable_id
CREATE INDEX idx_tokenable_id ON "personal_access_tokens"(tokenable_id)

