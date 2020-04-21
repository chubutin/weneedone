-- SCHEMA FOR ALL FULBITO NEEDS
CREATE SCHEMA IF NOT EXISTS fulbito_schema;

SELECT 'CREATE DATABASE fulbito_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'fulbito_db')\gexec

SET TIME ZONE 'UTC';

create schema extensions;
-- make sure everybody can use everything in the extensions schema
grant usage on schema extensions to public;
grant execute on all functions in schema extensions to public;

-- include future extensions
alter default privileges in schema extensions
   grant execute on functions to public;

alter default privileges in schema extensions
   grant usage on types to public;

create extension "uuid-ossp" schema extensions;

DO  
$body$
BEGIN
    CREATE ROLE fulbito_app LOGIN PASSWORD 'fulbito_app_pwd';
    GRANT CONNECT ON DATABASE fulbito_db TO fulbito_app;
    GRANT ALL PRIVILEGES ON DATABASE fulbito_db TO fulbito_app;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA fulbito_schema TO fulbito_app;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA fulbito_schema TO fulbito_app;
EXCEPTION WHEN others THEN
    RAISE NOTICE 'fulbito_app role exists, not re-creating';
END
$body$




