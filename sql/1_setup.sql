-- Create database
CREATE DATABASE fulbito_db;
\connect fulbito_db;

-- Create schemas
DROP SCHEMA public;
CREATE SCHEMA fulbito_schema;
CREATE SCHEMA extensions;

-- Extensions
CREATE extension "uuid-ossp" SCHEMA extensions;

-- Permissions
CREATE USER fulbito_app WITH PASSWORD 'supernotsecure';
GRANT ALL PRIVILEGES ON DATABASE "fulbito_db" to fulbito_app;
ALTER SCHEMA fulbito_schema OWNER TO fulbito_app;
GRANT USAGE ON SCHEMA fulbito_schema TO fulbito_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA fulbito_schema GRANT UPDATE, INSERT, SELECT, DELETE ON TABLES TO fulbito_app;
GRANT USAGE ON SCHEMA extensions to fulbito_app;


