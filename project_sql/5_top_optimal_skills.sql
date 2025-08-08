/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles.
- Concentration on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries).
    offering strategic insights for career development in data analysis.
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
HAVING
    COUNT(filtered_table.job_id) > 10
ORDER BY
    number_of_jobs DESC,
    AVG(yearly_salary) DESC
LIMIT 25;