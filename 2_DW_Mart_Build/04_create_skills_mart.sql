-- Step 3: Mart -  Create Skills demand mart 

DROP SCHEMA IF EXISTS skills_mart CASCADE;
CREATE SCHEMA skills_mart;

CREATE OR REPLACE TABLE skills_mart.dim_skills
    (
        skill_id    INT      PRIMARY KEY,
        skillS      VARCHAR,
        type        VARCHAR
    );


INSERT INTO skills_mart.dim_skills
(
    skill_id,
    skillS,
    type
)
SELECT 
    skill_id,
    skillS,
    type
FROM
    skills_dim;

CREATE OR REPLACE TABLE skills_mart.dim_date_month 
(
    month_start_date DATE PRIMARY KEY,
    year             INT,
    month            INT,
    quarter          INT,
    quarter_name     VARCHAR,
    year_quarter     VARCHAR
);

INSERT INTO skills_mart.dim_date_month
(
    month_start_date,
    year,
    month,
    quarter,
    quarter_name,
    year_quarter
)

SELECT DISTINCT
    DATE_TRUNC('MONTH',job_posted_date)::DATE AS month_start_date,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(QUARTER FROM job_posted_date) AS QUARTER,
    'Q-'|| EXTRACT(QUARTER FROM job_posted_date)::VARCHAR AS quarter_name,
    EXTRACT(YEAR FROM job_posted_date):: VARCHAR||'-Q'||EXTRACT(QUARTER FROM job_posted_date)::VARCHAR AS year_quarter
FROM job_postings_fact
ORDER BY month_start_date;

CREATE OR REPLACE TABLE skills_mart.fact_skill_demand_monthly
(
    skill_id INT,
    month_start_date DATE,
    job_title_short VARCHAR,
    postings_count INT,
    remote_postings_count INT,
    health_insurance_postings_count INT,
    no_degree_mention_postings_count INT,
    PRIMARY KEY(skill_id,month_start_date,job_title_short),
    FOREIGN KEY(skill_id) REFERENCES skills_mart.dim_skills(skill_id),
    FOREIGN KEY(month_start_date) REFERENCES skills_mart.dim_date_month(month_start_date)
);


INSERT INTO skills_mart.fact_skill_demand_monthly
(
    skill_id,
    month_start_date,
    job_title_short,
    postings_count,
    remote_postings_count,
    health_insurance_postings_count,
    no_degree_mention_postings_count
)
WITH job_postings_prep AS 
(
    SELECT
        sjd.skill_id,
        DATE_TRUNC('month',jpf.job_posted_date) AS month_start_date,
        jpf.job_title_short,
        CASE WHEN jpf.job_work_from_home =TRUE THEN 1 ELSE 0 END AS is_remote,
        CASE WHEN jpf.job_health_insurance=TRUE THEN 1 ELSE 0 END AS has_health_insurance,
        CASE WHEN jpf.job_no_degree_mention=TRUE THEN 1 ELSE 0 END AS no_degree_mentioned
    FROM
        job_postings_fact jpf
    INNER JOIN 
        skills_job_dim sjd ON jpf.job_id = sjd.job_id
)
SELECT 
    skill_id,
    month_start_date,
    job_title_short,
    COUNT(*) AS postings_count,
    SUM(is_remote) AS remote_postings_count,
    SUM(has_health_insurance) AS health_insurance_postings_count,
    SUM(no_degree_mentioned) AS no_degree_mention_postings_count
FROM
    job_postings_prep
GROUP BY
    skill_id,
    month_start_date,
    job_title_short
ORDER BY 
    skill_id,
    month_start_date,
    job_title_short;


