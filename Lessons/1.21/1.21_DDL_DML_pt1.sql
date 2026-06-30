
--.read Lessons\1.21\1.21_DDL_DML_pt1.sql
USE jobs_mart;
--CREATE DATABASE jobs_mart;
CREATE DATABASE  IF NOT EXISTS jobs_mart;
--DROP DATABASE IF EXISTS jobs_mart;
SHOW DATABASES;

SELECT * FROM information_schema.schemata;


CREATE SCHEMA IF NOT EXISTS staging;

--DROP SCHEMA IF EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.Preferred_roles(
    role_id INT PRIMARY KEY,
    role_name VARCHAR
);

SELECT *
FROM information_schema.tables
WHERE table_catalog='jobs_mart';

--DROP TABLE IF EXISTS staging.Preferred_roles;
INSERT INTO staging.Preferred_roles (role_id,role_name)
VALUES 
    (1,'Data Engineer'),
    (2,'Senior Data Engineer'),
    (3,'Software Engineer');
SELECT * FROM staging.Preferred_roles;

ALTER TABLE staging.Preferred_roles 
ADD COLUMN Preferred_role BOOLEAN;

UPDATE staging.Preferred_roles
SET Preferred_role = TRUE
WHERE role_id IN (1,2);

UPDATE staging.Preferred_roles
SET Preferred_role = FALSE
WHERE role_id=3;


ALTER TABLE staging.Preferred_roles 
DROP COLUMN Preferred_role BOOLEAN;

ALTER TABLE staging.Preferred_roles 
RENAME TO priority_roles;

ALTER TABLE staging.priority_roles 
RENAME COLUMN Preferred_role TO priority_lvl;

SELECT * FROM staging.priority_roles;

ALTER TABLE staging.priority_roles
ALTER COLUMN priority_lvl TYPE INT;

UPDATE staging.priority_roles
SET priority_lvl=3
WHERE role_id=3;

SELECT * FROM staging.priority_roles;