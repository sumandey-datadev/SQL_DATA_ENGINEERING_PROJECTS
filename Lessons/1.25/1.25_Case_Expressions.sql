SELECT
    CASE WHEN salary_year_avg<75000 THEN 'Low'
         WHEN salary_year_avg BETWEEN 75000 AND 150000 THEN 'Medium'
         WHEN salary_year_avg>150000 THEN 'High'
         END AS SalaryType
    ,ROUND((SUM(salary_year_avg)/SUM(salary_hour_avg)),0) AS hoursworkedperyear
FROM
    job_postings_fact
WHERE   
    salary_year_avg IS NOT NULL
GROUP BY
    SalaryType
ORDER BY
    hoursworkedperyear DESC
LIMIT 10;

SELECT 
    job_posted_date,
    EXTRACT(MONTH FROM job_posted_date) as job_posting_day,
    DATE_TRUNC('MONTH',job_posted_date) as job_posting_month_day1
FROM
    job_postings_fact
LIMIT 10;



