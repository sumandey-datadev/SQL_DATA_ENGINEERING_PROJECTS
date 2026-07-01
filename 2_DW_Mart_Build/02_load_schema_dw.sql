--Step 2: DW -Load data from CSV files to tables

INSERT INTO company_dim(
    
    company_id,name
    
    )
SELECT company_id,name
FROM read_csv ('https://storage.googleapis.com/sql_de/company_dim.csv',
AUTO_DETECT=true);

INSERT INTO skills_dim(
        
        skill_id,skillS,type
        
        )
SELECT skill_id,skillS,type
FROM read_csv ('https://storage.googleapis.com/sql_de/skills_dim.csv',
AUTO_DETECT=true);

INSERT INTO job_postings_fact(

            job_id,company_id,job_title_short,job_title,job_location,
            job_via,job_schedule_type,job_work_from_home,search_location,
            job_posted_date,job_no_degree_mention,job_health_insurance,
            job_country,salary_rate,salary_year_avg,salary_hour_avg
            
            )

SELECT      job_id,company_id,job_title_short,job_title,job_location,
            job_via,job_schedule_type,job_work_from_home,search_location,
            job_posted_date,job_no_degree_mention,job_health_insurance,
            job_country,salary_rate,salary_year_avg,salary_hour_avg
FROM read_csv ('https://storage.googleapis.com/sql_de/job_postings_fact.csv',
AUTO_DETECT=true);

INSERT INTO skills_job_dim(
        
        skill_id,job_id
)
SELECT skill_id,job_id
FROM read_csv ('https://storage.googleapis.com/sql_de/skills_job_dim.csv',
AUTO_DETECT=true);

SELECT COUNT(*) FROM company_dim;
SELECT COUNT(*) FROM skills_dim;
SELECT COUNT(*) FROM job_postings_fact;
SELECT COUNT(*) FROM skills_job_dim;