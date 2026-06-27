/*
Here is the text extracted from the image:

---

**Question: What are the most in-demand skills for data engineers?**

* Identify the top 10 in-demand skills for data engineers
* Focus on remote job postings
* **Why?**

  * Retrieves the top 10 skills with the highest demand in the remote job market, providing insights into the most valuable skills for data engineers seeking remote work.

---

*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS DemandCount
FROM 
    job_postings_fact
INNER JOIN
    skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN 
    skills_dim  ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short='Data Engineer' AND
    job_work_from_home=TRUE
GROUP BY 
    skills
ORDER BY
    DemandCount DESC
LIMIT 10;

/*
┌────────────┬─────────────┐
│   skills   │ DemandCount │
│  varchar   │    int64    │
├────────────┼─────────────┤
│ sql        │       29221 │
│ python     │       28776 │
│ aws        │       17823 │
│ azure      │       14143 │
│ spark      │       12799 │
│ airflow    │        9996 │
│ snowflake  │        8639 │
│ databricks │        8183 │
│ java       │        7267 │
│ gcp        │        6446 │
└────────────┴─────────────┘
*/