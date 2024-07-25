/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles in India 
- Concentrates on Locations in India with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

-- Identifies skills in high demand for Data Analyst roles
-- Use Query #3
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL
        AND  job_location LIKE '%India'
    GROUP BY
        skills_dim.skill_id
), 
-- Skills with high average salaries for Data Analyst roles
-- Use Query #4
average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND  job_location LIKE '%India' 
    GROUP BY
        skills_job_dim.skill_id
)
-- Return high demand and high salaries for 10 skills 
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN  average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE  
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
General insights :
        This data indicate that a combination of foundational programming and data manipulation skills, along with specialized tools for big data, cloud computing, and business intelligence, are key to success in the data analysis field in India.

Discriptive Analysis:
        Versatility and Flexibility: Skills like Python, SQL, and Excel are versatile and form the foundation of data analysis across various industries. These skills are crucial for manipulating, analyzing, and visualizing data.

        Cloud and Big Data: Skills such as Spark, AWS, and Azure are in high demand for roles that deal with large-scale data processing and cloud-based solutions. These skills are essential for industries that require scalable and efficient data infrastructure.

        Business Intelligence and Visualization: Tools like Power BI and Tableau are critical for creating interactive reports and dashboards that drive business decisions. These skills are highly valued in industries that rely on data-driven insights, such as finance, healthcare, and marketing.

        Specialized Databases and Compliance: Oracle and other database management systems are important for handling enterprise-level data needs. These skills are crucial for industries that require robust data storage, security, and compliance, such as banking and telecommunications.

        Statistical Analysis and Machine Learning: Languages like R and tools like Python's data science libraries are essential for statistical analysis and machine learning. These skills are important for roles in research, healthcare, and any industry that leverages predictive analytics and data modeling.

        Integration and Automation: Skills in GitLab and other DevOps tools are important for integrating and automating data workflows, ensuring efficiency and consistency in data processing pipelines. These skills are valuable in tech, finance, and other sectors that require continuous integration and deployment of data solutions.

[
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "11",
    "avg_salary": "118332"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "17",
    "avg_salary": "109832"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "11",
    "avg_salary": "104260"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "15",
    "avg_salary": "98570"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "36",
    "avg_salary": "95933"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "12",
    "avg_salary": "95333"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "20",
    "avg_salary": "95103"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "46",
    "avg_salary": "92984"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "39",
    "avg_salary": "88519"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "18",
    "avg_salary": "86609"
  }
]
*/
