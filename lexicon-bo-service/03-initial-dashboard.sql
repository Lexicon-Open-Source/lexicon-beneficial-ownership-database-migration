-- PostgreSQL
-- Create User Table
CREATE TABLE users (
    "id" varchar(26) NOT NULL PRIMARY KEY,
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL UNIQUE,
    "email_verified_at" timestamp NULL DEFAULT NULL,
    "password" varchar(255) NOT NULL,
    "two_factor_secret" TEXT DEFAULT NULL,
    "two_factor_recovery_codes" TEXT DEFAULT NULL,
    "two_factor_confirmed_at" TIMESTAMP DEFAULT NULL,
    "remember_token" varchar(100) DEFAULT NULL,
    "created_at" timestamp NULL DEFAULT NULL,
    "updated_at" timestamp NULL DEFAULT NULL
);

-- Create Failed jobs

CREATE TABLE "failed_jobs" (
    "id" bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    "uuid" varchar(255) NOT NULL UNIQUE,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" longtext NOT NULL,
    "exception" longtext NOT NULL,
    "failed_at" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

);

-- Create Personal Access Token

CREATE TABLE "personal_access_tokens" (
    "id" SERIAL PRIMARY KEY,
    "tokenable_type" VARCHAR(255) NOT NULL,
    "tokenable_id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "token" VARCHAR(64) NOT NULL UNIQUE,
    "abilities" TEXT DEFAULT NULL,
    "last_used_at" TIMESTAMP NULL DEFAULT NULL,
    "expires_at" TIMESTAMP NULL DEFAULT NULL,
    "created_at" TIMESTAMP NULL DEFAULT NULL,
    "updated_at" TIMESTAMP NULL DEFAULT NULL
);

-- Create Session

CREATE TABLE "sessions" (
    "id" varchar(255) NOT NULL PRIMARY KEY,
    "user_id" varchar(26) DEFAULT NULL,
    "ip_address" varchar(45) DEFAULT NULL,
    "user_agent" text DEFAULT NULL,
    "payload" text NOT NULL,
    "last_activity" bigint NOT NULL,
    CONSTRAINT "sessions_user_id_foreign" FOREIGN KEY ("user_id") REFERENCES "users" ("id")
);

-- create index for user_id and last_activity
CREATE INDEX idx_sessions_user_id ON "sessions"("user_id");
CREATE INDEX idx_sessions_last_activity ON "sessions"("last_activity");
