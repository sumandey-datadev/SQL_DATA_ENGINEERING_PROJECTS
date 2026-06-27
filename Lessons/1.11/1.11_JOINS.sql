SELECT *
FROM
    job_postings_fact
JOIN
    company_dim ON job_postings_fact.company_id=company_dim.company_id
LIMIT 10;

SELECT 
    company_dim.name As Companyname,
    COUNT(job_postings_fact.job_id) As totaljob
FROM
    job_postings_fact
JOIN
    company_dim ON job_postings_fact.company_id=company_dim.company_id
GROUP BY
    company_dim.name
ORDER BY
    totaljob DESC
LIMIT 10;