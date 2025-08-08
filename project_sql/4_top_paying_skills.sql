/*
Answer: What are the top skills based on salary?
- Look at the average salary associate with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/
SELECT
    skills,
    COUNT(filtered_table.job_id) AS number_of_jobs,
    TO_CHAR(AVG(yearly_salary),'FM999,999,999,990.00') AS avg_salary
FROM (
    SELECT
            *,
            CASE 
                WHEN salary_rate = 'year' THEN salary_year_avg
                WHEN salary_rate = 'hour' THEN (salary_hour_avg*40*4*12)
                ELSE NULL
            END AS yearly_salary
        FROM
            job_postings_fact
    ) AS filtered_table
INNER JOIN skills_job_dim ON filtered_table.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND yearly_salary IS NOT NULL
GROUP BY
    skills
ORDER BY
    AVG(yearly_salary) DESC

/*
Key Insights:
1. Top-paying skills (avg > $120K) include Snowflake, Go, and Scala, each with < 50 job postings.
2. High-demand but lower-paying skills (job count > 500, avg < $90K) include SQL and Excel.
3. Data engineering/cloud skills dominate the top 10 salaries.
4. Skills with small market presence (< 20 postings) tend to show extreme salary variations.
*/