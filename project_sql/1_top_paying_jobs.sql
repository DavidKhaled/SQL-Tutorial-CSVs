/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities 
*/

SELECT 
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    yearly_salary,
    job_posted_date
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
LEFT JOIN company_dim
    ON company_dim.company_id = filtered_table.company_id
WHERE
    yearly_salary IS NOT NULL
    AND job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
ORDER BY
    yearly_salary DESC
LIMIT 10;