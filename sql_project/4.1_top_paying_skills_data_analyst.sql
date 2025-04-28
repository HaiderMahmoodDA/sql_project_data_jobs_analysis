/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, for remote jobs.
- It reveals how different skills impact salary levels for Data Analysts and 
  helps identify the most financially rewarding skills to acquire or improve
*/


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS salary_avg
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    salary_avg DESC
LIMIT 25;



/*
Here's a breakdown of the results for top paying skills for Data Analysts:
- High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy),
  reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, 
  with a premium on skills that facilitate automation and efficient data pipeline management.
- Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments,
  suggesting that cloud proficiency significantly boosts earning potential in data analytics.

[
  {
    "skills": "pyspark",
    "salary_avg": "208172"
  },
  {
    "skills": "bitbucket",
    "salary_avg": "189155"
  },
  {
    "skills": "couchbase",
    "salary_avg": "160515"
  },
  {
    "skills": "watson",
    "salary_avg": "160515"
  },
  {
    "skills": "datarobot",
    "salary_avg": "155486"
  },
  {
    "skills": "gitlab",
    "salary_avg": "154500"
  },
  {
    "skills": "swift",
    "salary_avg": "153750"
  },
  {
    "skills": "jupyter",
    "salary_avg": "152777"
  },
  {
    "skills": "pandas",
    "salary_avg": "151821"
  },
  {
    "skills": "elasticsearch",
    "salary_avg": "145000"
  },
  {
    "skills": "golang",
    "salary_avg": "145000"
  },
  {
    "skills": "numpy",
    "salary_avg": "143513"
  },
  {
    "skills": "databricks",
    "salary_avg": "141907"
  },
  {
    "skills": "linux",
    "salary_avg": "136508"
  },
  {
    "skills": "kubernetes",
    "salary_avg": "132500"
  },
  {
    "skills": "atlassian",
    "salary_avg": "131162"
  },
  {
    "skills": "twilio",
    "salary_avg": "127000"
  },
  {
    "skills": "airflow",
    "salary_avg": "126103"
  },
  {
    "skills": "scikit-learn",
    "salary_avg": "125781"
  },
  {
    "skills": "jenkins",
    "salary_avg": "125436"
  },
  {
    "skills": "notion",
    "salary_avg": "125000"
  },
  {
    "skills": "scala",
    "salary_avg": "124903"
  },
  {
    "skills": "postgresql",
    "salary_avg": "123879"
  },
  {
    "skills": "gcp",
    "salary_avg": "122500"
  },
  {
    "skills": "microstrategy",
    "salary_avg": "121619"
  }
]
*/