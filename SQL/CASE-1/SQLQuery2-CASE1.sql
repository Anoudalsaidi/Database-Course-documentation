create database company;
use company
create table employee(
 SSN int primary key identity(1,1),
 FName VARCHAR(50) NOT NULL,
 LName VARCHAR(50) NOT NULL,
 Gender bit default 0,
 Barthdate date,
 SupervisorNumber int,
 foreign key (SupervisorNumber) references employee(SSN)
)
 create table Dependen(
 Name VARCHAR(50) primary key,
 Gender VARCHAR(10),
 Barthdate date,
 SSN int,
 foreign key (SSN) references employee(SSN)
 )
 create table Dept(
 DNAME VARCHAR(50),
 DNum int primary key,
 Hiringdate date,
 SSN int,
 foreign key (SSN) references employee(SSN)
 )
  create table Location(
 Location VARCHAR(50),
 DNum int,
 primary key(Location,DNum),
 foreign key (DNum) references Dept(DNum)
 )
 create table Project(
 PNAME VARCHAR(50),
 PNumber int primary key,
 Location VARCHAR(50),
 City VARCHAR(50),
 DNum int,
 foreign key (DNum) references Dept(DNum)
 )
 create table Works(
 Workinghourses int,
 PNumber int,
 SSN int,
 primary key(PNumber,SSN),
 foreign key (SSN) references employee(SSN),
 foreign key (PNumber) references Project(PNumber)
 )
alter table employee 
add DNum int, 
foreign key (DNum) references Dept(DNum)

Insert into employee(FName,LName,Gender,Barthdate,SupervisorNumber)
values('Anoud','Alsaidi',1,'2020-1-11',1),
('Shima','ali',1,'2021-5-11',2),
('Manar','Ahmed',1,'2005-11-11',3),
('Ali','Ahmed',0,'1999-9-9',4),
('Salim','waleed',0,'1988-12-9',4);
select * from employee

Insert into Dependen(Name,Gender,Barthdate)
values('Anoud','F','2001'),
('shima','F','2010'),
('ali','M','2009'),
('Ahmed','M','2009'),
('Suliman','M','1980');

select * from Dependen

Insert into Dept(DNAME,DNum,Hiringdate)
values('Anoud',101,'1-1-2024'),
('Ali',011,'4-4-2024'),
('Shima',010,'3-3-2023'),
('Ahmed',09,'5-5-2025'),
('MANAR',102,'9-8-2025');

select * from Dept

INSERT INTO Location(Location,DNum)
VALUES('MUSCAT',101),
('SOHAR',201),
('SHAM',011),
('SALALH',111),
('BARKA',131);

select * from Location

INSERT INTO Project(PNAME,PNumber,Location,City)
VALUES ('PROJECT1',777,'SOHAR','ALTRIF'),
('PROJECT2',999,'MUSCAT','ALSEEB'),
('PROJECT3',555,'MUSCAT','RIWI'),
('PROJECT4',333,'SAHAM','SAHAM'),
('PROJECT3',888,'MUSCAT','ALMOBILA');

select * from Project

INSERT INTO Works(Workinghourses,PNumber,SSN)
VALUES (9,777),(8,999),(9,555),(9,333),(9,888);

select * from Works