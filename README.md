# 📊 Data Engineer Skills Analysis using SQL

## 📌 Project Overview

This project explores the current **remote Data Engineer job market** by analyzing job postings to identify the most valuable technical skills.

The analysis answers three key business questions:

* What are the most in-demand skills for Data Engineers?
* Which skills command the highest salaries?
* Which skills offer the best balance between demand and salary?

Using SQL, the project demonstrates how business questions can be transformed into actionable insights through data analysis.

---

## 📂 Dataset

The dataset contains information about:

* Job postings
* Required technical skills
* Annual salaries
* Remote work availability

### Tables Used

| Table               | Description                                                                    |
| ------------------- | ------------------------------------------------------------------------------ |
| `job_postings_fact` | Stores job posting information including salary, job title, and work location. |
| `skills_job_dim`    | Maps job postings to required skills.                                          |
| `skills_dim`        | Contains the list of skills.                                                   |

---

# 📈 Analysis 1: Most In-Demand Skills

## Business Question

> **What are the most in-demand skills for Data Engineers?**

### Objectives

* Identify the top 10 in-demand skills.
* Focus only on remote Data Engineer positions.
* Understand which technologies employers request most frequently.

### SQL Techniques Used

* INNER JOIN
* COUNT()
* GROUP BY
* ORDER BY
* LIMIT

### Key Findings

| Rank | Skill      | Demand Count |
| ---- | ---------- | -----------: |
| 1    | SQL        |       29,221 |
| 2    | Python     |       28,776 |
| 3    | AWS        |       17,823 |
| 4    | Azure      |       14,143 |
| 5    | Spark      |       12,799 |
| 6    | Airflow    |        9,996 |
| 7    | Snowflake  |        8,639 |
| 8    | Databricks |        8,183 |
| 9    | Java       |        7,267 |
| 10   | GCP        |        6,446 |

### Insight

SQL and Python remain the two most requested skills for remote Data Engineer positions. Cloud technologies and big data tools such as AWS, Azure, Spark, and Snowflake continue to dominate the job market.

---

# 💰 Analysis 2: Highest-Paying Skills

## Business Question

> **What are the highest-paying skills for Data Engineers?**

### Objectives

* Calculate the median salary for each skill.
* Focus only on remote positions with specified salaries.
* Include skill frequency to eliminate outliers.

### SQL Techniques Used

* MEDIAN()
* COUNT()
* ROUND()
* GROUP BY
* HAVING
* ORDER BY

### Top Paying Skills

| Skill      | Median Salary ($) |
| ---------- | ----------------: |
| Rust       |           210,000 |
| Golang     |           184,000 |
| Terraform  |           184,000 |
| Spring     |           175,500 |
| Neo4j      |           170,000 |
| GraphQL    |           167,500 |
| Kubernetes |           150,500 |
| Airflow    |           150,000 |

### Why Median Instead of Average?

Median salary is used instead of average because it minimizes the impact of extremely high or low salaries, providing a more reliable measure of typical compensation.

### Insight

Emerging technologies such as Terraform, Rust, and Golang command some of the highest salaries, although they appear less frequently than foundational technologies.

---

# 🚀 Analysis 3: Optimal Skills (Demand + Salary)

## Business Question

> **What are the most valuable skills by balancing both demand and salary?**

### Objectives

* Combine market demand with median salary.
* Rank skills based on their overall market value.
* Focus only on remote jobs with salary information.

### Scoring Formula

```sql
Market Value Score = Median Salary × ln(Demand Count)
```

Using the natural logarithm (`LN`) prevents highly demanded skills from dominating the ranking while still rewarding popularity.

### SQL Techniques Used

* MEDIAN()
* COUNT()
* LN()
* ROUND()
* GROUP BY
* HAVING

### Top Ranked Skills

| Rank | Skill     | Market Value Score |
| ---- | --------- | -----------------: |
| 1    | Terraform |               0.97 |
| 2    | Python    |               0.95 |
| 3    | SQL       |               0.91 |
| 4    | AWS       |               0.91 |
| 5    | Airflow   |               0.89 |
| 6    | Spark     |               0.87 |
| 7    | Snowflake |               0.82 |
| 8    | Kafka     |               0.82 |
| 9    | Azure     |               0.79 |
| 10   | Java      |               0.77 |

### Insight

While SQL and Python remain essential due to their high demand, Terraform stands out as the most valuable skill because it combines excellent salary potential with strong market demand.

---

# 🛠 SQL Concepts Demonstrated

* INNER JOIN
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* LIMIT
* COUNT()
* MEDIAN()
* ROUND()
* LN()
* Aggregate Functions
* Mathematical Functions

---

# 📊 Key Takeaways

* SQL remains the most requested skill for Data Engineers.
* Python is essential for modern data engineering workflows.
* Cloud platforms (AWS, Azure, and GCP) continue to dominate hiring.
* Spark, Airflow, Snowflake, and Databricks are core technologies for big data processing.
* Terraform provides one of the strongest combinations of salary and market demand.
* Combining salary with demand offers a more meaningful way to prioritize skill development.

---

# 💡 What I Learned

Through this project, I gained hands-on experience with:

* Writing complex SQL queries
* Joining multiple tables
* Performing statistical analysis using SQL
* Using aggregate and mathematical functions
* Building business-oriented metrics
* Transforming raw data into meaningful insights

---

# ⚙️ Technologies Used

* SQL
* DuckDB
* Git
* GitHub
* Visual Studio Code

---



---

# 📌 Conclusion

This project demonstrates how SQL can be used beyond querying data to solve real business problems.

By analyzing market demand, salary trends, and combining both into a custom Market Value Score,the project identifies the technologies that provide the greatest career value for Data Engineers.

These insights can help professionals prioritize learning based on both employability and earning potential.
