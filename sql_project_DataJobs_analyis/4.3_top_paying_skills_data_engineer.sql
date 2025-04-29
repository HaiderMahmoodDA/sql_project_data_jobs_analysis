/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Engineer positions
- Focuses on roles with specified salaries, for remote jobs.
- It reveals how different skills impact salary levels for Data Engineer and 
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
    job_title_short = 'Data Engineer' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    salary_avg DESC
LIMIT 25;


/*
Here's a breakdown of the results for top paying skills for Data Engineer:

- Assembly language developers are the highest-paid — extremely rare for data engineers, thus commanding big salaries.

- Rust and Clojure again show that functional and high-efficiency languages are prized.

- Databases and real-time data streaming skills dominate.

- Cloud & API-first thinking (FastAPI, Kafka, Kubernetes) is the new normal for big salaries.

- Soft skills in tooling (e.g., Bitbucket, Zoom) still matter and even show up in top-paid categories.


[
  {
    "skills": "assembly",
    "salary_avg": "192500"
  },
  {
    "skills": "mongo",
    "salary_avg": "182223"
  },
  {
    "skills": "ggplot2",
    "salary_avg": "176250"
  },
  {
    "skills": "rust",
    "salary_avg": "172819"
  },
  {
    "skills": "clojure",
    "salary_avg": "170867"
  },
  {
    "skills": "perl",
    "salary_avg": "169000"
  },
  {
    "skills": "neo4j",
    "salary_avg": "166559"
  },
  {
    "skills": "solidity",
    "salary_avg": "166250"
  },
  {
    "skills": "graphql",
    "salary_avg": "162547"
  },
  {
    "skills": "julia",
    "salary_avg": "160500"
  },
  {
    "skills": "splunk",
    "salary_avg": "160397"
  },
  {
    "skills": "bitbucket",
    "salary_avg": "160333"
  },
  {
    "skills": "zoom",
    "salary_avg": "159000"
  },
  {
    "skills": "kubernetes",
    "salary_avg": "158190"
  },
  {
    "skills": "numpy",
    "salary_avg": "157592"
  },
  {
    "skills": "mxnet",
    "salary_avg": "157500"
  },
  {
    "skills": "fastapi",
    "salary_avg": "157500"
  },
  {
    "skills": "redis",
    "salary_avg": "157000"
  },
  {
    "skills": "trello",
    "salary_avg": "155000"
  },
  {
    "skills": "jquery",
    "salary_avg": "151667"
  },
  {
    "skills": "express",
    "salary_avg": "151636"
  },
  {
    "skills": "cassandra",
    "salary_avg": "151282"
  },
  {
    "skills": "unify",
    "salary_avg": "151000"
  },
  {
    "skills": "kafka",
    "salary_avg": "150549"
  },
  {
    "skills": "vmware",
    "salary_avg": "150000"
  }
]
*/