EXPLAIN ANALYZE
SELECT 
    company_dim.name As Companyname,
    COUNT(job_postings_fact.job_id) As totaljob
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id=company_dim.company_id
WHERE
    job_postings_fact.job_country='United States'
GROUP BY
    Companyname
HAVING
    totaljob>3000
ORDER BY
    totaljob DESC
LIMIT 10;