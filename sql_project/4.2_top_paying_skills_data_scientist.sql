/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- Focuses on roles with specified salaries, for remote jobs.
- It reveals how different skills impact salary levels for Data scientist and 
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
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    salary_avg DESC
LIMIT 25;


/*
Here's a breakdown of the results for top paying skills for Data Scientist:

- Compliance expertise (GDPR) is the absolute highest-paying — niche and critical.

- Programming Languages (especially Go, Rust, Elixir) have huge salaries due to rarity in DS.

- Team Collaboration/Workflow tools like Atlassian, Slack surprisingly match the technical stacks in pay — collaboration
  skills pay off!

- Automation and ML pipeline tools (like Selenium, Airflow) are extremely valuable for productionalizing AI.

- Big Data and NoSQL skills (Neo4j, DynamoDB, Redis, Cassandra) are high-value for scaling AI systems.

- Visualization and BI Tools (MicroStrategy, Qlik, Looker) still earn strong salaries but slightly lower than
  core backend/data engineering skills.

[
  {
    "skills": "gdpr",
    "salary_avg": "217738"
  },
  {
    "skills": "golang",
    "salary_avg": "208750"
  },
  {
    "skills": "atlassian",
    "salary_avg": "189700"
  },
  {
    "skills": "selenium",
    "salary_avg": "180000"
  },
  {
    "skills": "opencv",
    "salary_avg": "172500"
  },
  {
    "skills": "neo4j",
    "salary_avg": "171655"
  },
  {
    "skills": "microstrategy",
    "salary_avg": "171147"
  },
  {
    "skills": "dynamodb",
    "salary_avg": "169670"
  },
  {
    "skills": "php",
    "salary_avg": "168125"
  },
  {
    "skills": "tidyverse",
    "salary_avg": "165513"
  },
  {
    "skills": "solidity",
    "salary_avg": "165000"
  },
  {
    "skills": "c",
    "salary_avg": "164865"
  },
  {
    "skills": "go",
    "salary_avg": "164691"
  },
  {
    "skills": "datarobot",
    "salary_avg": "164500"
  },
  {
    "skills": "qlik",
    "salary_avg": "164485"
  },
  {
    "skills": "redis",
    "salary_avg": "162500"
  },
  {
    "skills": "watson",
    "salary_avg": "161710"
  },
  {
    "skills": "rust",
    "salary_avg": "161250"
  },
  {
    "skills": "elixir",
    "salary_avg": "161250"
  },
  {
    "skills": "cassandra",
    "salary_avg": "160850"
  },
  {
    "skills": "looker",
    "salary_avg": "158715"
  },
  {
    "skills": "slack",
    "salary_avg": "158333"
  },
  {
    "skills": "terminal",
    "salary_avg": "157500"
  },
  {
    "skills": "airflow",
    "salary_avg": "157414"
  },
  {
    "skills": "julia",
    "salary_avg": "157244"
  }
]
*/