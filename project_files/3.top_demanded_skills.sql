/* What are the most in demand skills for data analyst?
- Join job postings to inner join table similar to query 2
- check the top 5 demanded skills for data analyst
- focus on all job postings
*/

SELECT skills,
COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where job_title = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
limit 5