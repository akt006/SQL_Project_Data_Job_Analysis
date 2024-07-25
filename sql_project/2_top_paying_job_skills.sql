/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS(
        SELECT 
            job_id,
            job_title,
            job_location,
            salary_year_avg,
            name as company_name
        FROM  job_postings_fact j 
        left JOIN company_dim c on j.company_id=c.company_id
        WHERE 
            job_title_short='Data Analyst' AND
            job_location like '%India' AND
            salary_year_avg IS NOT NULL
        ORDER BY
            salary_year_avg DESC
        LIMIT 10)

SELECT t.*,sd.skill_id,sd.skills,sd.type
FROM top_paying_jobs t
JOIN skills_job_dim s
ON t.job_id=s.job_id
JOIN skills_dim sd 
ON sd.skill_id=s.skill_id
ORDER BY t.salary_year_avg DESC

/*
ANALYSIS -:
        TOP 5 SKILLS REQUIRED FOR TOP PAYING DATA JOBS INN INDIA :
            SQL (5 occurrences)
            Python (4 occurrences)
            Power BI (4 occurrences)
            Oracle (4 occurrences)
            MongoDB (4 occurrences)
        Other Insights:
            Number of Unique Jobs: 10
            Average Salary: $143,907 per year
        Detailed Insights:
            SQL is the most frequently required skill, indicating its critical importance in data-related roles.
            Power BI, Oracle, MongoDB, and Python follow closely, all being essential for data analysis, database management, and software development.
            The average salary for these top-paying jobs is quite high, reflecting the demand and value of these skills in the job market.

[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "177283.0",
    "company_name": "ServiceNow",
    "skill_id": null,
    "skills": null,
    "type": null
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 189,
    "skills": "sap",
    "type": "analyst_tools"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 2,
    "skills": "nosql",
    "type": "programming"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 3,
    "skills": "scala",
    "type": "programming"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 6,
    "skills": "shell",
    "type": "programming"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 75,
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 80,
    "skills": "snowflake",
    "type": "cloud"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 92,
    "skills": "spark",
    "type": "libraries"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 93,
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 95,
    "skills": "pyspark",
    "type": "libraries"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 96,
    "skills": "airflow",
    "type": "libraries"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 98,
    "skills": "kafka",
    "type": "libraries"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 168,
    "skills": "unix",
    "type": "os"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 169,
    "skills": "linux",
    "type": "os"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 211,
    "skills": "jenkins",
    "type": "other"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 215,
    "skills": "flow",
    "type": "other"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skill_id": 220,
    "skills": "gitlab",
    "type": "other"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 18,
    "skills": "mongodb",
    "type": "programming"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 24,
    "skills": "mongo",
    "type": "programming"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 56,
    "skills": "mysql",
    "type": "databases"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 57,
    "skills": "postgresql",
    "type": "databases"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 61,
    "skills": "sql server",
    "type": "databases"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 62,
    "skills": "mongodb",
    "type": "databases"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 78,
    "skills": "redshift",
    "type": "cloud"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 92,
    "skills": "spark",
    "type": "libraries"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 97,
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skill_id": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 1,
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 3,
    "skills": "scala",
    "type": "programming"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 8,
    "skills": "go",
    "type": "programming"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 18,
    "skills": "mongodb",
    "type": "programming"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 28,
    "skills": "no-sql",
    "type": "programming"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 58,
    "skills": "neo4j",
    "type": "databases"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 62,
    "skills": "mongodb",
    "type": "databases"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 75,
    "skills": "databricks",
    "type": "cloud"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 76,
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 79,
    "skills": "oracle",
    "type": "cloud"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 92,
    "skills": "spark",
    "type": "libraries"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 97,
    "skills": "hadoop",
    "type": "libraries"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 105,
    "skills": "gdpr",
    "type": "libraries"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skill_id": 105,
    "skills": "gdpr",
    "type": "libraries"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skill_id": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skill_id": 204,
    "skills": "visio",
    "type": "analyst_tools"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skill_id": 233,
    "skills": "jira",
    "type": "async"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skill_id": 234,
    "skills": "confluence",
    "type": "async"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skill_id": 0,
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skill_id": 74,
    "skills": "azure",
    "type": "cloud"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skill_id": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skill_id": 183,
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skill_id": 215,
    "skills": "flow",
    "type": "other"
  },
  {
    "job_id": 696697,
    "job_title": "Data Analyst/Senior Data Analyst - Customer Support and Services...",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skill_id": 123,
    "skills": "electron",
    "type": "libraries"
  },
  {
    "job_id": 696697,
    "job_title": "Data Analyst/Senior Data Analyst - Customer Support and Services...",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skill_id": 181,
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 696697,
    "job_title": "Data Analyst/Senior Data Analyst - Customer Support and Services...",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skill_id": 188,
    "skills": "word",
    "type": "analyst_tools"
  },
  {
    "job_id": 696697,
    "job_title": "Data Analyst/Senior Data Analyst - Customer Support and Services...",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skill_id": 196,
    "skills": "powerpoint",
    "type": "analyst_tools"
  },
  {
    "job_id": 475835,
    "job_title": "Manager - Data Analyst",
    "job_location": "Mumbai, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "company_name": "Upstox",
    "skill_id": null,
    "skills": null,
    "type": null
  }
]

*/
