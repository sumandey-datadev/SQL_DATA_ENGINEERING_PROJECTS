SELECT
    job_posted_date,
    job_title_short,
    salary_hour_avg,
    SUM(salary_hour_avg) OVER(PARTITION BY job_title_short ORDER BY job_posted_date) As Average_hourly_salary
FROM
    job_postings_fact
WHERE
    salary_hour_avg IS NOT NULL
ORDER BY
    job_title_short,job_posted_date
LIMIT 20;


SELECT
    job_id,
    job_title_short,
    salary_hour_avg,
    RANK() OVER(ORDER BY salary_hour_avg DESC) As rank_hourly_salary
FROM
    job_postings_fact
WHERE
    salary_hour_avg IS NOT NULL
ORDER BY
    salary_hour_avg DESC
LIMIT 20;

            SELECT
                job_posted_date,
                job_title_short,
                salary_hour_avg,
                AVG(salary_hour_avg) OVER(PARTITION BY job_title_short ORDER BY job_posted_date) As Running_Average_hourly_salary
            FROM
                job_postings_fact
            WHERE
                salary_hour_avg IS NOT NULL
            ORDER BY
                job_title_short,job_posted_date
            LIMIT 10;
    