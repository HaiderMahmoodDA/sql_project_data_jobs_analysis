/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Engineer jobs from the previous queries.
- Add the specific skills reuired for these roles.
- It provides a detailed look at which high-paying jobs demand certain skills,
  helping us to understand which skills to develop that align with top salaries 
*/


WITH top_paying_engineer_jobs AS 
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
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere'  AND
        salary_year_avg is NOT null
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)



SELECT 
    top_paying_engineer_jobs.*,
    skills_dim.skills
FROM
    top_paying_engineer_jobs
INNER JOIN
    skills_job_dim ON top_paying_engineer_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC
;


/*
Here's the breakdown of the most demanded skills for data Engineer in 2023, based on job postings:

- Python dominates the list for data engineering roles, appearing 7 times.

- Spark is the second most in-demand skill (5 times), showing the importance
  of big data processing.

- Distributed systems and streaming tools like Kafka, Hadoop, 
  and Scala are also in demand (each with 3 mentions).

- Familiarity with cloud platforms (AWS, GCP, Azure) is needed but not as dominant 
  compared to programming and big data tools.

- Interestingly, ML-related skills like PyTorch, Keras, TensorFlow also show up,
  suggesting some overlap with ML engineering tasks.

[
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "company_name": "Engtal",
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "company_name": "Durlston Partners",
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "company_name": "Durlston Partners",
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "company_name": "Twitch",
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "skills": "pytorch"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "company_name": "Signify Technology",
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "company_name": "AI Startup",
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "azure"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "company_name": "Signify Technology",
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "skills": "spark"
  },
  {
    "job_id": 151972,
    "company_name": "Movable Ink",
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "company_name": "Movable Ink",
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "company_name": "Movable Ink",
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "skills": "gcp"
  },
  {
    "job_id": 204320,
    "company_name": "Handshake",
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "245000.0",
    "skills": "go"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "company_name": "Meta",
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "skills": "perl"
  }
]
*/