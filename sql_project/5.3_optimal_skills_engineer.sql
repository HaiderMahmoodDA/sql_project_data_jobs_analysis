/*
Question What are the most optimal skills to learn (it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Engineer roles
- Concentrates on remote positions with specified salaries
- Targets skills that offer job security (high demand) and financial benefits (high salaries), 
  offering strategic insights for career development in data Engineer
*/



SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS avg_salary
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25
;

/*
Here's a breakdown of the most optimal skills for Data Engineer in 2023:

- Containerization is Premium:
  Kubernetes and Terraform knowledge can easily push a salary $150K+ 
  and give leverage across cloud providers (AWS, GCP, Azure).

- Streaming/Batch Hybrid is the New Normal:
  Engineers must be comfortable with both batch (Hadoop, Airflow) 
  and streaming (Kafka, Spark Streaming) setups.

- Low-Supply, High-Pay Skills Exist:
  Niche languages like Golang, Scala, and Rust (from earlier list) 
  continue to command high salaries, even if the job counts are smaller.

- Multi-Cloud Readiness:
  More companies expect multi-cloud competency — you need familiarity with
  both AWS databases (Aurora, DynamoDB) and Google tools if possible.

[
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "56",
    "avg_salary": "158189.73"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "14",
    "avg_salary": "157592.32"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "19",
    "avg_salary": "151282.18"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "134",
    "avg_salary": "150549.04"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "11",
    "avg_salary": "147818.18"
  },
  {
    "skill_id": 212,
    "skills": "terraform",
    "demand_count": "44",
    "avg_salary": "146057.28"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "38",
    "avg_salary": "144656.21"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demand_count": "21",
    "avg_salary": "144101.93"
  },
  {
    "skill_id": 144,
    "skills": "ruby",
    "demand_count": "14",
    "avg_salary": "144000.00"
  },
  {
    "skill_id": 30,
    "skills": "ruby",
    "demand_count": "14",
    "avg_salary": "144000.00"
  },
  {
    "skill_id": 83,
    "skills": "aurora",
    "demand_count": "14",
    "avg_salary": "142886.79"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "11",
    "avg_salary": "142253.86"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "113",
    "avg_salary": "141777.32"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "237",
    "avg_salary": "139837.61"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "64",
    "avg_salary": "139428.36"
  },
  {
    "skill_id": 64,
    "skills": "dynamodb",
    "demand_count": "27",
    "avg_salary": "138883.10"
  },
  {
    "skill_id": 18,
    "skills": "mongodb",
    "demand_count": "32",
    "avg_salary": "138568.83"
  },
  {
    "skill_id": 62,
    "skills": "mongodb",
    "demand_count": "32",
    "avg_salary": "138568.83"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "151",
    "avg_salary": "138518.31"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "139",
    "avg_salary": "138087.11"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "98",
    "avg_salary": "137707.03"
  },
  {
    "skill_id": 17,
    "skills": "typescript",
    "demand_count": "19",
    "avg_salary": "137206.58"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "93",
    "avg_salary": "136429.66"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "34",
    "avg_salary": "135499.07"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "30",
    "avg_salary": "134614.43"
  }
]
*/