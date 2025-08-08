/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        company_dim.name AS company_name,
        yearly_salary
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
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    yearly_salary DESC;

/* results:
    [
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "sql"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "python"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "r"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "azure"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "databricks"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "aws"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "pandas"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "pyspark"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "jupyter"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "excel"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "tableau"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "power bi"
    },
    {
        "job_id": 552322,
        "job_title": "Associate Director- Data Insights",
        "company_name": "AT&T",
        "yearly_salary": "255829.5",
        "skills": "powerpoint"
    },
    {
        "job_id": 1151339,
        "job_title": "System Data Analyst - Full Time",
        "company_name": "Ghritachi",
        "yearly_salary": "249600.0",
        "skills": "sql"
    },
    {
        "job_id": 1151339,
        "job_title": "System Data Analyst - Full Time",
        "company_name": "Ghritachi",
        "yearly_salary": "249600.0",
        "skills": "python"
    },
    {
        "job_id": 1151339,
        "job_title": "System Data Analyst - Full Time",
        "company_name": "Ghritachi",
        "yearly_salary": "249600.0",
        "skills": "sheets"
    },
    {
        "job_id": 1151339,
        "job_title": "System Data Analyst - Full Time",
        "company_name": "Ghritachi",
        "yearly_salary": "249600.0",
        "skills": "flow"
    },
    {
        "job_id": 99305,
        "job_title": "Data Analyst, Marketing",
        "company_name": "Pinterest Job Advertisements",
        "yearly_salary": "232423.0",
        "skills": "sql"
    },
    {
        "job_id": 99305,
        "job_title": "Data Analyst, Marketing",
        "company_name": "Pinterest Job Advertisements",
        "yearly_salary": "232423.0",
        "skills": "python"
    },
    {
        "job_id": 99305,
        "job_title": "Data Analyst, Marketing",
        "company_name": "Pinterest Job Advertisements",
        "yearly_salary": "232423.0",
        "skills": "r"
    },
    {
        "job_id": 99305,
        "job_title": "Data Analyst, Marketing",
        "company_name": "Pinterest Job Advertisements",
        "yearly_salary": "232423.0",
        "skills": "hadoop"
    },
    {
        "job_id": 99305,
        "job_title": "Data Analyst, Marketing",
        "company_name": "Pinterest Job Advertisements",
        "yearly_salary": "232423.0",
        "skills": "tableau"
    },
    {
        "job_id": 1021647,
        "job_title": "Data Analyst (Hybrid/Remote)",
        "company_name": "Uclahealthcareers",
        "yearly_salary": "217000.0",
        "skills": "sql"
    },
    {
        "job_id": 1021647,
        "job_title": "Data Analyst (Hybrid/Remote)",
        "company_name": "Uclahealthcareers",
        "yearly_salary": "217000.0",
        "skills": "crystal"
    },
    {
        "job_id": 1021647,
        "job_title": "Data Analyst (Hybrid/Remote)",
        "company_name": "Uclahealthcareers",
        "yearly_salary": "217000.0",
        "skills": "oracle"
    },
    {
        "job_id": 1021647,
        "job_title": "Data Analyst (Hybrid/Remote)",
        "company_name": "Uclahealthcareers",
        "yearly_salary": "217000.0",
        "skills": "tableau"
    },
    {
        "job_id": 1021647,
        "job_title": "Data Analyst (Hybrid/Remote)",
        "company_name": "Uclahealthcareers",
        "yearly_salary": "217000.0",
        "skills": "flow"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "sql"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "python"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "go"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "snowflake"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "pandas"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "numpy"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "excel"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "tableau"
    },
    {
        "job_id": 168310,
        "job_title": "Principal Data Analyst (Remote)",
        "company_name": "SmartAsset",
        "yearly_salary": "205000.0",
        "skills": "gitlab"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "sql"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "python"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "azure"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "aws"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "oracle"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "snowflake"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "tableau"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "power bi"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "sap"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "jenkins"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "bitbucket"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "atlassian"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "jira"
    },
    {
        "job_id": 731368,
        "job_title": "Director, Data Analyst - HYBRID",
        "company_name": "Inclusively",
        "yearly_salary": "189309.0",
        "skills": "confluence"
    }
    ] 
    */