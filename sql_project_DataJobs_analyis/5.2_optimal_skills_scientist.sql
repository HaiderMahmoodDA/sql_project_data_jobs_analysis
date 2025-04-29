/*
Question What are the most optimal skills to learn (it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data scientist roles
- Concentrates on remote positions with specified salaries
- Targets skills that offer job security (high demand) and financial benefits (high salaries), 
  offering strategic insights for career development in data scientist
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
    job_title_short = 'Data Scientist'
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
Here's a breakdown of the most optimal skills for Data Scientist in 2023:

- BI Skills Pay More, but Programming and ML Libraries Have More Jobs:
  Business intelligence tools command slightly higher salaries because they’re closer 
  to decision-making layers in companies, but if you're chasing volume of job opportunities,
  Python + ML stack skills are the safer bet.

- Cloud & Big Data Skills Are Critical:
  AWS, Snowflake, GCP — every serious data team is building 
  scalable infrastructure. Not just local models anymore.

- Workflow Tools Matter:
  Even knowing Airflow and Jira can boost your positioning 
  as teams value engineering practices in data work.

[
  {
    "skill_id": 26,
    "skills": "c",
    "demand_count": "48",
    "avg_salary": "164864.98"
  },
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "57",
    "avg_salary": "164691.09"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "15",
    "avg_salary": "164484.64"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "57",
    "avg_salary": "158714.91"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "23",
    "avg_salary": "157414.13"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "36",
    "avg_salary": "157142.36"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "56",
    "avg_salary": "156701.92"
  },
  {
    "skill_id": 81,
    "skills": "gcp",
    "demand_count": "59",
    "avg_salary": "155810.57"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "72",
    "avg_salary": "152686.88"
  },
  {
    "skill_id": 101,
    "skills": "pytorch",
    "demand_count": "115",
    "avg_salary": "152602.70"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "36",
    "avg_salary": "151708.14"
  },
  {
    "skill_id": 99,
    "skills": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536.49"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "22",
    "avg_salary": "151164.55"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "149",
    "avg_salary": "150188.49"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "217",
    "avg_salary": "149629.96"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "73",
    "avg_salary": "149089.24"
  },
  {
    "skill_id": 106,
    "skills": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148963.95"
  },
  {
    "skill_id": 95,
    "skills": "pyspark",
    "demand_count": "34",
    "avg_salary": "147544.45"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "219",
    "avg_salary": "146970.05"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "31",
    "avg_salary": "146110.28"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "64",
    "avg_salary": "145706.30"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "23",
    "avg_salary": "145139.04"
  },
  {
    "skill_id": 93,
    "skills": "pandas",
    "demand_count": "113",
    "avg_salary": "144815.95"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "25",
    "avg_salary": "144497.96"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "763",
    "avg_salary": "143827.93"
  }
]
*/