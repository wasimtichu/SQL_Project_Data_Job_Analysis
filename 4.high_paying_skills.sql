/* What are the top skills based on salary for my role?
-  check the average salary associated with each skills
-  focuses on roles with specified salaries regardless of location
*/

SELECT skills, round(avg(salary_year_avg), 0) as avg_salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where job_title = 'Data Analyst' and salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
limit 25