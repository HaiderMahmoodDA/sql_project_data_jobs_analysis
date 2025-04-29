:بسم الله والحمد لله والصلاة والسلام على رسول الله وآله وصحبه ومن والاه؛ وبعد
# Introduction:
📊 Dive into the data job market! Focusing on the three major data roles: Analysis, Science, and Engineer, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in the mentioned data roles.

🔍 SQL queries? Check them out here: [sql_project_DataJobs_analyis folder](/sql_project_DataJobs_analyis/)

# Background:
Driven by a quest to navigate the three major data-roles job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs; depending on data from 2023, focusing on the remote job posts in linkdin.

Data hails from this fantastic  [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions I wanted to answer through my SQL queries were:

1. What are the top-paying jobs for the three major roles of data?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for thes top-paying jobs?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used:
For my deep dive into the data industry job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis:
Each query for this project aimed at investigating specific aspects of the data field job market. Here’s how I approached each question:
## 1. Top paying Data jobs:
To identify the highest-paying roles, I filtered for each data major positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in each field.

```sql
SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data ____'    -- Used with: Analyst, Scientist, Engineer.
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
### For Data Analyst:
Here's the breakdown of the top data analyst jobs in 2023:
- **Wide Salary Range:** Top 10 paying data analyst roles span from $184,000 to $650,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like SmartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety:** There's a high diversity in job titles, from Data Analyst to Director of Analytics, reflecting varied roles and specializations within data analytics.

![Top Paying Analyst's Roles](assets\1_top_paying_analyst_roles.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts; ChatGPT generated this graph from my SQL query results*

### For Data Scientist:
- Quantitative Finance Roles that are "Staff" level roles Dominate Top Salaries
which mean Mastering quantitative methods (statistics, econometrics, ML) and business analytics is extremely valuable if you want top-tier salaries.

- being that the top data scientsist jobs with such salarises and such high positions are remote: indicat global remote hiring is now normalized for high-paying data science roles, at least this was the trend in 2023.

- Industry Specialization Boosts Salary
Examples:
Head of Battery Data Science ($300K at Lawrence Harvey) — specialization in energy and battery technologies.

- High Salaries Aren't Just for Silicon Valley Anymore
Companies like Demandbase, Teramind, Storm5, and Storm4 are not household tech names like Google or Facebook,
Yet they offer $300K+ salaries.


![Top Paying scientist's Roles](assets\1_top_paying_scientist_roles.png)
*Bar graph visualizing the salary for the top 10 salaries for data scientist; ChatGPT generated this graph from my SQL query results*

### For Data Engineer:
 - there's no necessity to move into management to hit $300K as a Data Engineer — deep technical expertise can pay just as much.

- Consultancy Firms and Staffing Agencies Are Major Salary Channels
Engtal and Signify Technology (staffing/consulting firms) posted multiple top roles.


- Critical infrastructure teams (data platforms, pipelines, real-time systems) are now fully trusted to work remotely at high salary levels.

- $250K+ Threshold is the New Standard for Principal-Level Engineers
6 out of 10 jobs offer $245K–$325K for Principal, Staff, or Director Data Engineers.


- AI companies require massive, high-quality data pipelines to train their models, making Data Engineers critical hires.

![Top Paying engineer's Roles](assets\1_top_paying_engineer_roles.png)
*Bar graph visualizing the salary for the top 10 salaries for data engineer; ChatGPT generated this graph from my SQL query results*

## 2. Skills for Top Paying jobs:
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.
```sql
WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data _____' -- Used with Analyst, Scientist, Engineer.
        AND job_location = 'Anywhere' 
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

### For Data Analyst:
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
- SQL is leading with a bold count of 8.
- Python follows closely with a bold count of 7.
- Tableau is also highly sought after, with a bold count of 6.
- Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

![Top Paying Skills For Analyst](assets\2_top_paying_roles_skills_analyst.png)
*Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results*

### For Data Scientist:
Here's the breakdown of the most demanded skills for data scientist in 2023, based on job postings:

- SQL and Python are the most frequently required skills (both appear 4 times).
- Cloud platforms like AWS and GCP are popular, but Azure appears less often.
- Machine learning frameworks PyTorch and - TensorFlow are mentioned equally (2 each).
- Big data tools like Spark, Hadoop, and Cassandra are requested but less frequently.
- Other tools like Tableau, Kubernetes, and Scala are less common but still requested.

![Top Paying Skills For Scientist](assets\2_top_paying_roles_skills_scientist.png)*Bar graph visualizing the count of skills for the top 10 paying jobs for data scientist; this bar graph I genertated it using Excel*


### For Data Engineer:
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


![Top Paying Skills For Engineer](assets\2_top_paying_roles_skills_engineer.png)*Bar graph visualizing the count of skills for the top 10 paying jobs for data engineer; this bar graph I genertated it using Excel*

## 3. In-Demand Skills for Data Majors:

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data _____' -- Used with Data Analyst, Scientist, Engineer.
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

### For Data Analysis:
Here's the breakdown of the most demanded skills for data analysts in 2023
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- **Programming** and **Visualization Tools** like **Python**, **Tableau**, and **Power BI** are essential, pointing towards the increasing importance of technical skills in data storytelling and decision support.

| Skills   | Demand Count |
|----------|--------------|
| SQL      | 7291         |
| Excel    | 4611         |
| Python   | 4330         |
| Tableau  | 3745         |
| Power BI | 2609         |

*Table of the demand for the top 5 skills in data analyst job postings*

### For Data Science:

Here's the breakdown of the most demanded skills for data scientist in 2023:

- Python is by far the most demanded skill for data scientists almost 40% higher demand than SQL.
- SQL remains critical, highlighting the importance of data extraction and manipulation skills.
- R still holds significant demand, especially in traditional statistical and academic environments.
- AWS indicates the growing need for cloud skills in data science workflows.
- Tableau shows that data visualization is a valuable and expected skill, even for data scientists.

| Skills   | Demand Count |
|----------|--------------|
| Python   | 10390        |
|   SQL    | 7488         |
|    R     | 4674         |
|   aws    | 2593         |
| Tableau  | 2458         |
*Table of the demand for the top 5 skills in data scientist job postings*

### For Data Engineer:
Here's the breakdown of the most demanded skills for data engineer in 2023:
- SQL and Python dominate, and their demand is almost neck-and-neck — reflecting how essential both 
  data handling and scripting are in data engineering.
- AWS shows very strong demand, making cloud skills critical for modern data engineers.
- Azure isn’t too far behind, emphasizing the multi-cloud ecosystem companies now adopt.
- Spark confirms that big data processing remains a core part of data engineering responsibilities.

| Skills   | Demand Count |
|----------|--------------|
|   SQL    | 14213        |
|  Python  | 13893        |
|   aws    | 8570         |
|  Azure   | 6997         |
|  spark   | 6612         |
*Table of the demand for the top 5 skills in data engineer job postings*

## 4. Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data _____' -- Used for Analyst, Scientist, Engineer.
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
### For Data Analyst:
Here's a breakdown of the results for top paying skills for Data Analysts:
- **High Demand for Big Data & ML Skills:** Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- **Software Development & Deployment Proficiency:** Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- **Cloud Computing Expertise:** Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| pyspark       |            208,172 |
| bitbucket     |            189,155 |
| couchbase     |            160,515 |
| watson        |            160,515 |
| datarobot     |            155,486 |
| gitlab        |            154,500 |
| swift         |            153,750 |
| jupyter       |            152,777 |
| pandas        |            151,821 |
| elasticsearch |            145,000 |

*Table of the average salary for the top 10 paying skills for data analysts*

### For Data Scientist:
Here's a breakdown of the results for top paying skills for Data Scientist:

- Compliance expertise (GDPR) is the absolute highest-paying — niche and critical.

- Programming Languages (especially Go, Rust, Elixir) have huge salaries due to rarity in DS.

- Team Collaboration/Workflow tools like Atlassian, Slack surprisingly match the technical stacks in pay.

- Automation and ML pipeline tools (like Selenium, Airflow) are extremely valuable for productionalizing AI.

- Big Data and NoSQL skills (Neo4j, DynamoDB, Redis, Cassandra) are high-value for scaling AI systems.

- Visualization and BI Tools (MicroStrategy, Qlik, Looker) still earn strong salaries but slightly lower than
  core backend/data engineering skills.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| gdpr          |            217,738 |
| golang        |            208,750 |
| atlassian     |            189,700 |
| selenium      |            180,000 |
| opencv        |            172,500 |
| neo4j         |            171,655 |
| microstrategy |            171,147 |
| dynamodb      |            169,670 |
| php           |            168,125 |
| tidyvers      |            165,513 |

*Table of the average salary for the top 10 paying skills for data scinetist*

### For Date Engineer:
Here's a breakdown of the results for top paying skills for Data Engineer:

- Assembly language developers are the highest-paid — extremely rare for data engineers, thus commanding big salaries.

- Rust and Clojure again show that functional and high-efficiency languages are prized.

- Databases and real-time data streaming skills dominate.

- Cloud & API-first thinking (FastAPI, Kafka, Kubernetes) is the new normal for big salaries.

- Soft skills in tooling (e.g., Bitbucket, Zoom) still matter and even show up in top-paid categories.

| Skills        | Average Salary ($) |
|---------------|-------------------:|
| assembl       |            192,500 |
| mongo         |            182,223 |
| ggplot2       |            176,250 |
| rust          |            172,819 |
| clojure       |            170,867 |
| perl          |            169,000 |
| neo4j         |            166,559 |
| solidity      |            166,250 |
| graphql       |            162,547 |
| julia         |            160,500 |

*Table of the average salary for the top 10 paying skills for data engineer*

## 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data ________' -- Used for Analyst, Scientist, Engineer.
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;
```
### For Data Analysis:

| Skills       | Demand Count | Average Salary ($) |
|--------------|--------------|-------------------:|
| go           | 27           |            115,320 |
| confluence   | 11           |            114,210 |
| hadoop       | 22           |            113,193 |
| snowflake    | 37           |            112,948 |
| azure        | 34           |            111,225 |
| bigquery     | 13           |            109,654 |
| aws          | 32           |            108,317 |
| java         | 17           |            106,906 |
| ssis         | 12           |            106,683 |
| jira         | 20           |            104,918 |

*Table of the most optimal skills for data analyst sorted by salary*

Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
- **High-Demand Programming Languages:** Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
- **Cloud Tools and Technologies:** Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Business Intelligence and Visualization Tools:** Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
- **Database Technologies:** The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.


### For Data Scientist:

| Skills       | Demand Count | Average Salary ($) |
|--------------|--------------|-------------------:|
| c            | 48           |            164,865 |
| go           | 57           |            164,691 |
| qlik         | 15           |            164,485 |
| looker       | 57           |            158,715 |
| airflow      | 23           |            157,414 |
| bigquery     | 36           |            157,147 |
| scala        | 56           |            156,702 |
| gcp          | 59           |            155,811 |
| snowflake    | 72           |            152,687 |
| pytorch      | 115          |            152,603 |

*Table of the most optimal skills for data scientist sorted by salary*


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

  ### For Data Engingeer:

| Skills       | Demand Count | Average Salary ($) |
|--------------|--------------|-------------------:|
| kubernets    | 56           |            158,190 |
| numpy        | 14           |            157,592 |
| cassandra    | 19           |            151,282 |
| kafka        | 134          |            150,549 |
| golang       | 11           |            147,818 |
| terraform    | 44           |            146,057 |
| pandas       | 38           |            144,656 |
| elasticsearch| 21           |            144,102 |
| ruby         | 14           |            144,000 |
| aurora       | 11           |            142,887 |

*Table of the most optimal skills for data engineer sorted by salary*


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


