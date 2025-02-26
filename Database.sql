-- Remove the database.

REVOKE CONNECT ON DATABASE FinanceApp FROM PUBLIC;
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'FinanceApp'
AND pid <> pg_backend_pid();

-- Must be run separately
DROP DATABASE FinanceApp;

-- Remove users

REVOKE ALL PRIVILEGES ON SCHEMA public FROM FinanceApp_all_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE ALL ON TABLES FROM FinanceApp_all_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE ALL ON SEQUENCES FROM FinanceApp_all_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA public REVOKE ALL ON FUNCTIONS FROM FinanceApp_all_access;

DROP USER FinanceApp_all_access;

-- Create database.

CREATE DATABASE FinanceApp;

CREATE USER FinanceApp_all_access WITH PASSWORD 'strong_password';

GRANT ALL PRIVILEGES ON DATABASE FinanceApp TO FinanceApp_all_access;

-- Connect to the new database.

-- Grant privileges for schema to all_access_user.
GRANT ALL PRIVILEGES ON SCHEMA public TO FinanceApp_all_access;

-- grant privileges on future tables, sequences and funktions.
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO FinanceApp_all_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO FinanceApp_all_access;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO FinanceApp_all_access;

-- Grant specific rights on all current tables, sequences and functions.
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO FinanceApp_all_access;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO FinanceApp_all_access;
GRANT ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public TO FinanceApp_all_access;
