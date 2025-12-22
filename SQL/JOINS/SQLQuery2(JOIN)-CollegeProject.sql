---1. Display the department ID, name, and the full name of the faculty managing it.
select D.deptID,D.deptName,F.Fname
from Department D
JOIN faculity F On D.deptID = F.deptID 

---2. Display each program's name and the name of the department offering it.
select C.course_Name,D.deptName
from Department D
JOIN Course C ON C.deptID = D.deptID

---5. Display full data about courses whose titles start with "I" (e.g., "Introduction to...").
Select *
FROM Course
where Course_Name like 'D%'


---6. Retrieve student names in the Engineering program who earned grades ≥ 90 in the "Database" course.
select S.FName,S.LName,C.course_Name
from Student S
JOIN Course C ON C.deptID = S.deptID
WHERE course_Name = 'Database System'
select * from Student
select * from Course

---7. Retrieve each student's name and the titles of courses they are enrolled in, ordered by course title.
SELECT 
    s.FName + ' ' + s.LName as student_name,c.course_Name 
FROM Student s
JOIN Subject_Course sc ON s.StudentID = sc.StudentID
JOIN Course c ON sc.course_ID = c.course_ID
ORDER BY c.course_Name

---8. For each class in Building 'Main', retrieve class ID, course name, department name, and faculty name teaching the class.

select c.course_Name,d.deptName,f.Fname
from Course c
JOIN Department d ON d.deptID =  c.deptID
JOIN faculity f ON d.deptID =  f.deptID

---9. Display all faculty members who manage any department.
select f.Fname,d.deptName
from faculity f
JOIN Department d ON d.deptID =  f.deptID
 

---10. Display all students and their advisors' names, even if some students don’t have advisors yet.
 select s.FName + ' ' + s.LName as student_name,f.Fname as Advisors
 FROM Student s
left join faculity f ON s.deptID =  f.deptID 