/* What are the most optimal skills to learn? (High Demand & High Paying)
-  Identify skills in high demand & high salary
*/

with skills_demand as (
    SELECT skills_dim.skill_id, skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    where job_title = 'Data Analyst' and salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
), average_salary as (
    SELECT skills_job_dim.skill_id, round(avg(salary_year_avg), 0) as avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
    where job_title = 'Data Analyst' and salary_year_avg IS NOT NULL
    GROUP BY skills_job_dim.skill_id
)

SELECT skills_demand.skill_id,
skills_demand.skills, 
demand_count, avg_salary
FROM skills_demand
INNER JOIN average_salary on skills_demand.skill_id = average_salary.skill_id
where demand_count >= 10
ORDER BY demand_count DESC, avg_salary DESC
LIMIT 25