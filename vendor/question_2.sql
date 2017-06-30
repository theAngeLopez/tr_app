1. All of the patients that their last_name contains the word “mit”

SELECT * FROM Patients WHERE last_name last_name LIKE '%mit%';

2. All of the patients have been discharged from the system. That is, all of the patient’s encounters have a value in the discharged_at column

SELECT * FROM Patients INNER JOIN Encounters ON patient.id = encounter.patient_id WHERE discharged_at IS NOT NULL;

3. All of the patient that have been admitted in between July 5th, 2014 and August 19, 2014

SELECT * FROM Patients INNER JOIN Encounters ON patient.id = encounter.patient_id WHERE admitted_at BETWEEN #07/05/2014# AND #08/19/2014#;
