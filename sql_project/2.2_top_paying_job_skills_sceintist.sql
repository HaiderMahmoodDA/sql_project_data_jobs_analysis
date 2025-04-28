/*
Question: What skills are required for the top-paying data scientist jobs?
- Use the top 10 highest-paying Data Scientist jobs from previous queries.
- Add the specific skills reuired for these roles.
- It provides a detailed look at which high-paying jobs demand certain skills,
  helping us to understand which skills to develop that align with top salaries 
*/


WITH top_paying_scientist_jobs AS 
(
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        job_location = 'Anywhere'  AND
        salary_year_avg is NOT null
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)



SELECT 
    top_paying_scientist_jobs.*,
    skills_dim.skills
FROM
    top_paying_scientist_jobs
INNER JOIN
    skills_job_dim ON top_paying_scientist_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
;



/*
Here's the breakdown of the most demanded skills for data scientist in 2023, based on job postings:
SQL and Python are the most frequently required skills (both appear 4 times).
Cloud platforms like AWS and GCP are popular, but Azure appears less often.
Machine learning frameworks PyTorch and TensorFlow are mentioned equally (2 each).
Big data tools like Spark, Hadoop, and Cassandra are requested but less frequently.
Other tools like Tableau, Kubernetes, and Scala are less common but still requested.

[
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "skills": "sql"
  },
  {
    "job_id": 40145,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist/Quant Researcher",
    "salary_year_avg": "550000.0",
    "skills": "python"
  },
  {
    "job_id": 1714768,
    "company_name": "Selby Jennings",
    "job_title": "Staff Data Scientist - Business Analytics",
    "salary_year_avg": "525000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "sql"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "python"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "java"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "cassandra"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "spark"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1131472,
    "company_name": "Algo Capital Group",
    "job_title": "Data Scientist",
    "salary_year_avg": "375000.0",
    "skills": "tableau"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "azure"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "aws"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "keras"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 126218,
    "company_name": "Teramind",
    "job_title": "Director Level - Product Management - Data Science",
    "salary_year_avg": "320000.0",
    "skills": "datarobot"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "scala"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "spark"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 226011,
    "company_name": "Walmart",
    "job_title": "Distinguished Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "java"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "c"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 38905,
    "company_name": "Storm5",
    "job_title": "Principal Data Scientist",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "skills": "aws"
  },
  {
    "job_id": 457991,
    "company_name": "Lawrence Harvey",
    "job_title": "Head of Battery Data Science",
    "salary_year_avg": "300000.0",
    "skills": "gcp"
  }
]
*/