
select * from Employee                            ---Display all employee data

select Fname,Lname
from Employee                                     ---Display employee first name, last name, salary, and department number.



select Fname +' ' + Lname as [full name],         ---Display each employee’s full name and their annual commission (10% of annual salary) as ANNUAL_COMM
(Salary *12)*0.10 as ANNUAL_COMM
from Employee                        

select SSN,Fname+''+Lname as [full name]          ---Display employee ID and name for employees earning more than 1000 LE monthly
from Employee
where Salary>1000

select SSN,Fname+''+Lname as [full name]          ---Display employee ID and name for employees earning more than 10000 LE annually
from Employee
where (Salary*12)>10000

select Fname, Salary                              ---Display names and salaries of all female employees
from Employee 
where Sex='F' 

select Fname                                     ---Display employees whose salary is between 2000 and 5000 
from Employee 
where Salary >= 2000 and Salary <= 5000                                      
									   
select Fname                                     ---Display employee names ordered by salary descending                                     
from Employee
order by Salary desc 

select max(Salary) as max,                      ---Display the maximum, minimum, and average salary
 min(Salary) as min,
avg(Salary) as avg
from Employee	

select COUNT(*) as Total_Employees             ---Display the total number of employees
from Employee

select *                                      ---Display employees whose first name starts with 'A'
from Employee
where Fname like 'a%'    

SELECT *                                     ---Display employees who have no supervisor
FROM Employee
WHERE SuperSSN IS NULL;
                                             
INSERT INTO Employee                                              ---Insert your personal data into the employee table (Department = 30, SSN = 102672,Superssn = 112233, Salary = 3000)
(SSN, Fname, Lname, Dno, SuperSSN, Salary) 
VALUES(102672, 'Anoud', 'Ali', 30, 112233, 3000);


INSERT INTO Employee(SSN, Fname, Lname, Dno, Salary, SuperSSN)    ---Insert another employee (your friend) in department 30 with SSN = 102660, leaving salary and supervisor number NULL
VALUES(102660, 'Manar', 'Ahmed', 30, NULL, NULL);

UPDATE Employee                                                  ---Update your salary by 20%
SET Salary = Salary * 0.20
WHERE SSN = 102672

UPDATE Employee                                                ---Increase salaries by 5% for all employees in department 30
SET Salary = Salary * 1.05
WHERE Dno = 30

DELETE FROM Employee
WHERE Salary IS NULL;                                                              ----Delete employees with NULL salary





                                         