CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE ,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

insert into job_applied
values (1,'2024-07-24',True,'Akash Tewari Resume',True,'Cover Letter Max Life Insuarance','submitted'),
       (2, '2024-07-25', False, 'John Doe Resume', False, 'Cover Letter ABC Corp', 'pending'),
(3, '2024-07-26', True, 'Jane Smith Resume', True, 'Cover Letter XYZ Ltd', 'reviewed'),
(4, '2024-07-27', False, 'Emily Davis Resume', False, 'Cover Letter DEF Inc', 'rejected'),
(5, '2024-07-28', True, 'Michael Brown Resume', True, 'Cover Letter GHI Holdings', 'submitted'),
(6, '2024-07-29', False, 'Chris Wilson Resume', False, 'Cover Letter JKL Enterprises', 'pending'),
(7, '2024-07-30', True, 'Jessica Taylor Resume', True, 'Cover Letter MNO Corporation', 'reviewed'),
(8, '2024-07-31', False, 'David Anderson Resume', False, 'Cover Letter PQR Solutions', 'rejected'),
(9, '2024-08-01', True, 'Sophia Martinez Resume', True, 'Cover Letter STU Group', 'submitted'),
(10, '2024-08-02', False, 'Daniel Hernandez Resume', False, 'Cover Letter VWX Systems', 'pending');

ALTER TABLE job_applied
ADD COLUMN contact VARCHAR(50)

UPDATE job_applied
set contact='Maharaj Pratap'
where job_id=1;


UPDATE job_applied
SET contact = 'Rani Laxmi'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Shivaji Rao'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Rani Durgavati'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Tipu Sultan'
WHERE job_id = 5;

UPDATE job_applied
SET contact = 'Bhagat Singh'
WHERE job_id = 6;

UPDATE job_applied
SET contact = 'Subhash Chandra Bose'
WHERE job_id = 7;

UPDATE job_applied
SET contact = 'Mangal Pandey'
WHERE job_id = 8;

UPDATE job_applied
SET contact = 'Bal Gangadhar Tilak'
WHERE job_id = 9;

UPDATE job_applied
SET contact = 'Lala Lajpat Rai'
WHERE job_id = 10;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name 

DROP TABLE job_applied;