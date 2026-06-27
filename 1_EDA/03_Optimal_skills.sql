/*
Question: What are the most optimal skills for data engineers balancing both demand and salary?

- Create a ranking column that combines demand count and median salary to identify the most valuable skills.

- Focus only on remote Data Engineer positions with specified annual salaries.

- Why?
    - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately.
*/

SELECT
    a.skills,
    ROUND(MEDIAN(c.salary_year_avg),0) As Average_salary,
    COUNT(c.job_id) As DemandCount,
    ROUND(LN(COUNT(c.job_id)),1) As ln_DemandCount,
    ROUND((MEDIAN(c.salary_year_avg)*LN(COUNT(C.job_id)))/1000000,2) As Optimal_score
FROM
    skills_dim a
INNER JOIN 
    skills_job_dim b ON a.skill_id = b.skill_id
INNER JOIN
    job_postings_fact c ON b.job_id = c.job_id
WHERE
    c.job_title_short='Data Engineer'
    AND c.job_work_from_home = TRUE
    AND C.salary_year_avg IS NOT NULL 
 GROUP BY
    a.skills
HAVING
    COUNT(c.job_id)>100
ORDER BY
    Optimal_score DESC
LIMIT 25;

/*
┌────────────┬────────────────┬─────────────┬────────────────┬───────────────┐
│   skills   │ Average_salary │ DemandCount │ ln_DemandCount │ Optimal_score │
│  varchar   │     double     │    int64    │     double     │    double     │
├────────────┼────────────────┼─────────────┼────────────────┼───────────────┤
│ terraform  │       184000.0 │         193 │            5.3 │          0.97 │
│ python     │       135000.0 │        1133 │            7.0 │          0.95 │
│ sql        │       130000.0 │        1128 │            7.0 │          0.91 │
│ aws        │       137320.0 │         783 │            6.7 │          0.91 │
│ airflow    │       150000.0 │         386 │            6.0 │          0.89 │
│ spark      │       140000.0 │         503 │            6.2 │          0.87 │
│ snowflake  │       135500.0 │         438 │            6.1 │          0.82 │
│ kafka      │       145000.0 │         292 │            5.7 │          0.82 │
│ azure      │       128000.0 │         475 │            6.2 │          0.79 │
│ java       │       135000.0 │         303 │            5.7 │          0.77 │
│ scala      │       137290.0 │         247 │            5.5 │          0.76 │
│ git        │       140000.0 │         208 │            5.3 │          0.75 │
│ kubernetes │       150500.0 │         147 │            5.0 │          0.75 │
│ databricks │       132750.0 │         266 │            5.6 │          0.74 │
│ redshift   │       130000.0 │         274 │            5.6 │          0.73 │
│ gcp        │       136000.0 │         196 │            5.3 │          0.72 │
│ nosql      │       134415.0 │         193 │            5.3 │          0.71 │
│ hadoop     │       135000.0 │         198 │            5.3 │          0.71 │
│ pyspark    │       140000.0 │         152 │            5.0 │           0.7 │
│ docker     │       135000.0 │         144 │            5.0 │          0.67 │
│ mongodb    │       135750.0 │         136 │            4.9 │          0.67 │
│ go         │       140000.0 │         113 │            4.7 │          0.66 │
│ r          │       134775.0 │         133 │            4.9 │          0.66 │
│ github     │       135000.0 │         127 │            4.8 │          0.65 │
│ bigquery   │       135000.0 │         123 │            4.8 │          0.65 │
└────────────┴────────────────┴─────────────┴────────────────┴───────────────┘
*/