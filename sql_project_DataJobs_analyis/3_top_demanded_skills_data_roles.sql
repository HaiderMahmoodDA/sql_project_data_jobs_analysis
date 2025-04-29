/*
Question: What are the most in-demand skills for data analysts, scientist, and engineer?
- Join job postings to inner join table similar to queries 2
- Identify the top 5 in-demand skills for each data role.
- Focus on remote job postings.
- Retrieves the top 5 skills with the highest demand in the job market, 
  providing insights into the most valuable skills.
*/


-- For Data Analyist

SELECT
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/




-- For Data scientist

SELECT
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;



/*
Here's the breakdown of the most demanded skills for data scientist in 2023:

- Python is by far the most demanded skill for data scientists — almost 40% higher demand than SQL.
- SQL remains critical, highlighting the importance of data extraction and manipulation skills.
- R still holds significant demand, especially in traditional statistical and academic environments.
- AWS indicates the growing need for cloud skills in data science workflows.
- Tableau shows that data visualization is a valuable and expected skill, even for data scientists.

[
  {
    "skills": "python",
    "demand_count": "10390"
  },
  {
    "skills": "sql",
    "demand_count": "7488"
  },
  {
    "skills": "r",
    "demand_count": "4674"
  },
  {
    "skills": "aws",
    "demand_count": "2593"
  },
  {
    "skills": "tableau",
    "demand_count": "2458"
  }
]
*/



-- For Data Engineer:

SELECT
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer' AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;


/*
Here's the breakdown of the most demanded skills for data engineer in 2023:
- SQL and Python dominate, and their demand is almost neck-and-neck — reflecting how essential both 
  data handling and scripting are in data engineering.
- AWS shows very strong demand, making cloud skills critical for modern data engineers.
- Azure isn’t too far behind, emphasizing the multi-cloud ecosystem companies now adopt.
- Spark confirms that big data processing remains a core part of data engineering responsibilities.


[
  {
    "skills": "sql",
    "demand_count": "14213"
  },
  {
    "skills": "python",
    "demand_count": "13893"
  },
  {
    "skills": "aws",
    "demand_count": "8570"
  },
  {
    "skills": "azure",
    "demand_count": "6997"
  },
  {
    "skills": "spark",
    "demand_count": "6612"
  }
]
*/