/* What are the top paying data analyst jobs?
- Identify the top 10 that are available remotely
-Focus on jobs with specific salary(remove nulls)
*/

SELECT
job_id, job_title, job_location, job_schedule_type, salary_year_avg, job_posted_date,
name AS company_name
FROM
job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id
where
job_title = 'Data Analyst'AND
job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;