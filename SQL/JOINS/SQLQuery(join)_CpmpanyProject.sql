select * from Departments
---1. Display the department ID, department name, manager ID, and the full name of the manager
select Dname,Dnum,MGRSSN,
Fname + ' ' + Lname AS Manager_FullName
FROM Departments  JOIN Employee 
ON MGRSSN = SSN

---2. Display the names of departments and the names of the projects they control.
select Dname,Pname
FROM Departments D  JOIN Project P
ON D.Dnum = P.Dnum

---3. Display full data of all dependents, along with the full name of the employee they depend on
select DT.*,
Fname+' ' + Lname AS Employee_FullName
from Dependent DT full JOIN Employee E
ON DT.ESSN = E.SSN

---4.Display the project ID, name, and location of all projects located in Cairo or Alex
select * from Project

select Pnumber,Pname,Plocation,City
from Project 
where City IN ('Cairo','Alex')

---5. Display all project data where the project name starts with the letter 'A'
select Pname,Pnumber,Plocation,City,Dnum
from Project
where Pname like 'A%'

---6. Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE
select * from Employee
select SSN,Fname,Lname,Salary
from Employee
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000

---7. Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project
select Fname,Lname
from Employee E JOIN Works_for W
ON E.SSN = W.ESSn 
JOIN Project P 
ON W.Pno = P.Pnumber
where Dno = 10 AND HOURS >= 10 AND P.Pname = 'AL Rabwah'

---8. Find the names of employees who are directly supervised by "Kamel Mohamed"
SELECT E.Fname,E.Lname
FROM Employee E
JOIN Employee S ON E.Superssn = S.SSN
WHERE S.Fname = 'Kamel' AND S.Lname = 'Mohamed'


---9. Retrieve the names of employees and the names of the projects they work on, sorted by project name
select E.Fname,E.Lname,Pname
FROM Employee E
JOIN Works_for W ON E.SSN = W.ESSn
JOIN Project P ON P.Pnumber = W.Pno
ORDER BY P.Pname

---10. For each project located in Cairo, display the project number, controlling department name, manager's last name,address, and birthdate
select P.Pnumber,P.City,D.Dname,E.Address,E.Bdate
from Project P
JOIN Departments D ON P.Dnum = D.Dnum
JOIN Employee E ON D.MGRSSN = E.SSN
WHERE P.City in ('Cairo')


---11. Display all employees and their dependents, even if some employees have no dependents
SELECT E.Fname,E.Lname,D.Dependent_name
FROM Employee E
LEFT JOIN Dependent D
    ON E.SSN = D.ESSN