/*
Queston: What are the top-paying Data Analyst jobs?
- Identify the top 10 highest-paying Data Analyst, Scientist, and Engineer roles that are avdailable remotely.
- Focuses on job postings wiht specifed salaries (remove nulls).
- Highlight the top-paying opportunities for Data Analysts, Scientist, and Engineer 
  offering insights into employnment options and location flexibility.
*/


-- for Data Analysts:

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN 
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere'  AND
    salary_year_avg is NOT null
ORDER BY
    salary_year_avg DESC
LIMIT 10;


-- for Data Scientsit:

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
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
LIMIT 10;


-- for Data Engineer:

SELECT
    job_id,
    name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
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
LIMIT 10;