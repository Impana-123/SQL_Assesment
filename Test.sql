--1
Create table Patient (patient_id INT PRIMARY KEY,
name VARCHAR(100),
gender VARCHAR(10),
date_of_birth  DATE,
contact_number VARCHAR(15));

CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_name VARCHAR(100),
    appointment_date DATE,
    department VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);
--2
Alter table Appointment add column status varchar(20);

select * from Appointment;

--3

INSERT INTO Patient (patient_id, name, gender, date_of_birth, contact_number) VALUES
(1, 'John Doe', 'Male', '1985-05-15', '1234567890'),
(2, 'Jane Smith', 'Female', '1990-07-20', '9876543210'),
(3, 'Alice Johnson', 'Female', '1988-03-10', '5556667777'),
(4, 'Robert Brown', 'Male', '1975-11-25', '4445556666'),
(5, 'Emily Davis', 'Female', '1995-09-30', '3334445555');


INSERT INTO Appointment (appointment_id, patient_id, doctor_name, appointment_date, department, status) VALUES
(1, 1, 'Dr. Smith', '2023-10-10', 'Cardiology', 'Scheduled'),
(2, 2, 'Dr. Johnson', '2023-10-11', 'Dermatology', 'Completed'),
(3, 3, 'Dr. Brown', '2023-10-12', 'Neurology', 'Cancelled'),
(4, 4, 'Dr. Davis', '2023-10-13', 'Orthopedics', 'Scheduled'),
(5, 5, 'Dr. Wilson', '2023-10-14', 'Pediatrics', 'Rescheduled');

--4
update Appointment set 
department ='Neurology' where appointment_id=2;

--5
delete FROM patient where name='Jhon Doe';

--6
select P.name,A.appointment_date,A.doctor_name
From Patient P left join Appointment A
on P.patient_id=A.patient_id;

--7
select P.*,A.department
From Patient P left join Appointment A
on P.patient_id=A.patient_id
where A.department='Cardiology';

--8
select P.*,A.doctor_name
From Patient P join Appointment A
on P.patient_id=A.patient_id
where A.doctor_name='Dr. Smith';

select * from Appointment;
select * from patient;

--9

select * from patient
where date_of_birth < '1965-04-15';

--10

select A.Patient_id,count(A.patient_id)
From Patient P join Appointment A
on P.patient_id=A.patient_id
group by A.patient_id
having count(A.patient_id)>1;

select * from appointment;

--11
select A.Patient_id,count(A.patient_id) as No_of_appoinment
From Patient P join Appointment A
on P.patient_id=A.patient_id
group by A.patient_id
order by No_of_appoinment DESC limit 1;

--12
select patient_id,name  from patient where patient_id not in
(select patient_id from appointment);

--13
SELECT name,(SELECT DATE_PART('year', CURRENT_DATE) - DATE_PART('year', p.date_of_birth)) 
AS age FROM patient p;

--14
select * from appointment
where appointment_date>='2025-03-15' 
and appointment_date<='2025-04-15';

select * from appointment;

--15

select department ,count(appointment_id) no_of_appointment
from appointment
group by department;

--1
SELECT P.name
FROM Patient P JOIN  Appointment A
ON P.patient_id = A.patient_id
GROUP BY P.name
HAVING COUNT(DISTINCT A.department)
= (SELECT COUNT(DISTINCT department) FROM Appointment);

--2
select p.name as patient_name,a.doctor_name,count(*)
as appointment_count from Patient p JOIN Appointment a
on p.patient_id = a.patient_id where a.doctor_name='Dr. Smith'
group by p.name,a.doctor_name having count(*)=1;

select * from Appointment;


--3
select A.doctor_name,count(appointment_id) as No_of_appointment
From  Appointment A
group by Doctor_name 
having count( appointment_id)>=3 and count( distinct department) >1;
 

--4

SELECT name 
FROM Patient p join Appointment a on p.patient_id = a.patient_id 
WHERE
    a.appointment_date >= DATEADD(month, -3, GETDATE())
    AND a.appointment_date <= GETDATE()
    AND DAY(EOMONTH(a.appointment_date)) - DAY(a.appointment_date) <= 7
GROUP BY p.patient_id, p.name
HAVING COUNT(DISTINCT EOMONTH(a.appointment_date)) >= 3;

--5
select P.*,count(appointment_id) as No_of_appointment
From Patient P join Appointment A
on P.patient_id=A.patient_id
group by P.patient_id
order by No_of_appointment DESC limit 3;

--6



