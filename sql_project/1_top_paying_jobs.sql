/*
Question: What are top paying data analytics jobs?
-- Identify the top 10 higest paying data analytics roles that are available in india 
-- Focuseed on Job postings with specified salaries 
-- Why ? Highlight the top paying job apportunities for data analytics
*/

SELECT 
      job_id,
      job_title,
      job_location,
      job_schedule_type,
      salary_year_avg,
      job_posted_date,
      name as company_name
FROM  job_postings_fact j 
left JOIN company_dim c on j.company_id=c.company_id
WHERE 
       job_title_short='Data Analyst' AND
       job_location like '%India' AND
       salary_year_avg IS NOT NULL
ORDER BY
       salary_year_avg DESC
LIMIT 10;

/*
[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28 18:35:45",
    "company_name": "ServiceNow"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-06 20:30:35",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-06 21:12:14",
    "company_name": "Eagle Genomics Ltd"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group"
  },
  {
    "job_id": 601909,
    "job_title": "Process and Data Analyst",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-06-27 09:34:23",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 135517,
    "job_title": "Data Analyst",
    "job_location": "Chennai, Tamil Nadu, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-03-13 12:19:54",
    "company_name": "Poshmark"
  }
]
*/
