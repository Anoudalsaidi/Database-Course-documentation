create database college
use college
--------------------------------------------------------------------------------------------------creation Tables
create table Department(
deptID int PRIMARY KEY NOT NULL,
deptName nvarchar(20)

)
create table faculity(
FID INT PRIMARY KEY NOT NULL,
Fname nvarchar(20) NOT NULL,
Mobile varchar(15),
salary DECIMAL(8,2),
deptID int,
FOREIGN KEY (deptID) REFERENCES Department(deptID)
)
create table Hostel(
HostelID INT PRIMARY KEY identity(1,1 ),
HostelName nvarchar(20),
city varchar(20),
Hoststate varchar(20),
HostAddress varchar(20),
seatsNO int
)

create table Student(
StudentID INT PRIMARY KEY identity(1,1 ),
FName nvarchar(20) NOT NULL,
LName nvarchar(20) NOT NULL,
PhoneNO varchar(15),
DOB date,
deptID int,
HostelID INT,
FOREIGN KEY (deptID) REFERENCES Department(deptID),
FOREIGN KEY (HostelID) REFERENCES Hostel(HostelID)
)

create table Exam(
exam_code VARCHAR PRIMARY KEY  NOT NULL,
exam_date DATE,
exam_time TIME,
deptID int,
FOREIGN KEY (deptID) REFERENCES Department(deptID)
)

create table Subject(
Sub_ID VARCHAR PRIMARY KEY  NOT NULL,
Sub_Name nvarchar(20) NOT NULL,
FID INT,
FOREIGN KEY (FID) REFERENCES faculity(FID)
)

create table Subject_Student(
StudentID INT,
Sub_ID VARCHAR,
PRIMARY KEY(StudentID,Sub_ID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (Sub_ID) REFERENCES Subject(Sub_ID)
)

create table Course(
course_ID VARCHAR PRIMARY KEY  NOT NULL,
course_Name nvarchar(20),
course_Duration VARCHAR,
deptID int,
FOREIGN KEY (deptID) REFERENCES Department(deptID)
)

create table Subject_Course(
course_ID VARCHAR,
StudentID INT,
PRIMARY KEY(StudentID,course_ID),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (course_ID) REFERENCES Course(course_ID)
)

create table Sudent_Exam(
StudentID INT,
exam_code VARCHAR,
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (exam_code) REFERENCES Exam(exam_code)
)

alter table Exam
add Room VARCHAR(15) 

ALTER TABLE Sudent_Exam
DROP constraint FK__Sudent_Ex__exam___3F466844

ALTER TABLE Exam
DROP constraint PK__Exam__45DD589B31E03ADA

ALTER TABLE Exam
add exam_codeE VARCHAR(20) PRIMARY KEY NOT NULL

ALTER TABLE Exam
DROP COLUMN exam_code

ALTER TABLE Sudent_Exam
add exam_codeE VARCHAR(20),
FOREIGN KEY (exam_codeE) REFERENCES Exam(exam_codeE)

ALTER TABLE Sudent_Exam
DROP COLUMN exam_code
--------------------------------------------------------------------------------------------------Insertion Records

Insert into Department(deptID,deptName)
values (01,'IT'),(02,'Mathematics'),(03,'Business'),(04,'Science')

Insert into faculity(FID,Fname,Mobile,salary,deptID)
values (101,'SALIM','9999999',750,1),(102,'ALI','9888888',600,2),(103,'SARA','9777779',1000,3),(104,'REEM','9666669',850.50,4)

Insert into Hostel(HostelName,city,Hoststate,HostAddress,seatsNO)
values ('Hostel_1','Muscat','ALSEEB','STREET_1',21),('Hostel_2','SOHAR','ALTREEF','STREET_2',50),('Hostel_3','SAHAM','ALHWEEL','STREET_3',100),('Hostel_4','SALALH','TAQAH','STREET_4',80)

Insert into Student(FName,LName,PhoneNO,DOB,deptID,HostelID)
values('Manar','waleed','99966669','2020',01,1),('shima','Ahmed','99888888','2022',02,2),('Anoud','suliman','9997777','2025',03,3),('Sami','Ali','9997777','2024',04,4)

Insert into Exam(exam_date,exam_time,deptID,Room,exam_codeE)
values('2026-01-25', '01:50:00', 01,10,'C_10'),('2025-12-25', '02:00:00', 02,20,'C_20'),('2025-12-30', '01:30:00', 03,30,'C_30'),('2026-01-05', '02:30:00', 04,40,'C_40')

Insert into Subject(Sub_ID,Sub_Name,FID)
values(9,'assigment',101),(7,'MID',102),(5,'CLASSEXAM',103),(3,'PROJECT',104)

Insert into Subject_Student(StudentID,Sub_ID)
values(1,3),(2,5),(3,7),(4,9)

Insert into Course(course_ID,course_Name,course_Duration,deptID)
values(7, 'Database Systems', 6,1),(8, 'Operating Systems', 5,2),(6, 'Computer Networks', 7,3),(2, 'Discrete Mathematics', 3,4)

Insert into Subject_Course(course_ID,StudentID)
values(2,1),(6,2),(7,3),(8,4)

Insert into Sudent_Exam(StudentID,exam_codeE)
values(1,'C-A'),(2,'C-B'),(3,'C-E'),(4,'C-F')

select * from Department
select * from faculity
select * from Hostel
select * from Student
select * from Exam
select * from Subject
select * from Course
select * from Subject_Course
select * from Sudent_Exam
select * from Subject_Student 

----------------------------------------------------------------------------------DQL&DML
--1)
SELECT * FROM faculity
select Fname,salary
FROM faculity
WHERE salary>700
--2)
select * from Student
SELECT *
FROM Student
where Fname like 'a%'
--3)
select * from faculity
SELECT MAX(salary) as MAX_salary,
MIN(salary) as MIN_salary,
AVG(salary) as AVG_salary
FROM faculity
--4)
select * from Hostel
SELECT city
FROM Hostel
order by seatsNO desc 
--5)
select * from Student
INSERT INTO Student(FName,LName,PhoneNO,DOB,deptID,HostelID)
values('Mistaz','obaid','9111111','2021',01,1)
--6)
select * from Course
update Course
set course_Name = 'Networking'
where course_ID = 8
