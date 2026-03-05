
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name

    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_location = 'Anywhere' AND job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
This query identifies the top-paying remote jobs for Data Analysts and retrieves the associated skills for those jobs. It uses Common Table Expressions (CTEs) to first select the top-paying jobs and then joins with the skills tables to get the relevant skills for those jobs.

Insight Summary:

    SQL is the most demanded skill in top-paying roles.

    Python is nearly as important and appears in most of the jobs.

    Visualization tools like Tableau are highly valued.

    Excel still matters, even in high-salary analytics jobs.
*/