create database OnlineCourses


CREATE TABLE Instructors (
InstructorID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
)

CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50)
)

CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
Title VARCHAR(100),
InstructorID INT,
CategoryID INT,
Price DECIMAL(6,2),
PublishDate DATE,
FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
)

CREATE TABLE Students (
StudentID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE
)

CREATE TABLE Enrollments (
EnrollmentID INT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollDate DATE,
CompletionPercent INT,
Rating INT CHECK (Rating BETWEEN 1 AND 5),
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
)



INSERT INTO Instructors VALUES
(1, 'Sarah Ahmed', 'sarah@learnhub.com', '2023-01-10'),
(2, 'Mohammed Al-Busaidi', 'mo@learnhub.com', '2023-05-21')

INSERT INTO Categories VALUES
(1, 'Web Development'),
(2, 'Data Science'),
(3, 'Business')

INSERT INTO Courses VALUES
(101, 'HTML & CSS Basics', 1, 1, 29.99, '2023-02-01'),
(102, 'Python for Data Analysis', 2, 2, 49.99, '2023-03-15'),
(103, 'Excel for Business', 2, 3, 19.99, '2023-04-10'),
(104, 'JavaScript Advanced', 1, 1, 39.99, '2023-05-01')

INSERT INTO Students VALUES
(201, 'Ali Salim', 'ali@student.com', '2023-04-01'),
(202, 'Layla Nasser', 'layla@student.com', '2023-04-05'),
(203, 'Ahmed Said', 'ahmed@student.com', '2023-04-10')

INSERT INTO Enrollments VALUES
(1, 201, 101, '2023-04-10', 100, 5),
(2, 202, 102, '2023-04-15', 80, 4),
(3, 203, 101, '2023-04-20', 90, 4),
(4, 201, 102, '2023-04-22', 50, 3),
(5, 202, 103, '2023-04-25', 70, 4),
(6, 203, 104, '2023-04-28', 30, 2),
(7, 201, 104, '2023-05-01', 60, 3)

--Part 1: Warm-Up
--1. Display all courses with prices.
SELECT Title AS Courses_Name,Price
from Courses

--2. Display all students with join dates.
select FullName as Student_Nmae,JoinDate
from Students

--3. Show all enrollments with completion percent and rating.
select e.*
from Enrollments e

--4. Count instructors who joined in 2023.

SELECT COUNT(*) AS InstructorCount
FROM Instructors
WHERE YEAR(JoinDate) = 2023

select * from Instructors

--5. Count students who joined in April 2023
SELECT COUNT(*) AS STUDENT_COUNTS
from Students
where YEAR(JoinDate) = 2023 AND 
 MONTH(JoinDate) =4

select * from Students

-- Part 2: Beginner Aggregation

-- 1. Count total number of students.
select count(*) As total_student_number
from Students

-- 2. Count total number of enrollments.
select count(*) As Total_NumberEnrollments
FROM Enrollments

-- 3. Find average rating per course.
select CourseID,AVG(Rating) AS Rating
FROM Enrollments
Group BY CourseID

SELECT * FROM Courses
SELECT * FROM Enrollments
-- 4. Count courses per instructor.
select count(*) as CoursesCount,InstructorID
FROM Courses
Group by InstructorID


-- 5. Count courses per category.
select count(*) AS Course_Count,CategoryID
FROM Courses
Group by CategoryID


SELECT * FROM Courses
SELECT * FROM Categories

-- 6. Count students enrolled in each course.
select count(*) As count_Student,courseID
FROM Enrollments
Group by courseID

SELECT * FROM Courses
SELECT * FROM Enrollments

-- 7. Find average course price per category.
select CategoryID,AVG(Price) as course_price
FROM Courses
Group by CategoryID

-- 8. Find maximum course price.
select max(Price)
from Courses 

-- 9. Find min, max, and average rating per course.
select CourseID, max(Rating) as MAX_rating,
                 AVG(Rating) as AVG_rating,
	             MIN(Rating) as MIN_rating
from Enrollments
Group by CourseID


-- 10. Count how many students gave rating = 5
select count(StudentID ) AS Student_Rating,Rating
from Enrollments
where Rating = 5
Group by Rating

-- 11. Count enrollments per month.
select  MONTH (EnrollDate) as month_enrollments,
        count(*) As Count_Enrollment
from Enrollments
Group by MONTH(EnrollDate)

select * from Enrollments

-- 12. Find average course price overall.
select count(*) AS AVG_Course,Price
from Courses 
Group by Price

-- 13. Count students per join month.
select count(*) AS Count_Student,month(JoinDate) as Join_Date
from Students
Group by month(JoinDate)

select * from Students

-- 14. Count ratings per value (1–5).
select Rating,count(*) As Count_ratings
from Enrollments
Group by Rating
order by Rating

select * from Enrollments

-- 15. Find courses that never received rating = 5.
select c.CourseID,c.Title
from Courses c
where c.CourseID not in (select CourseID from Enrollments
where Rating = 5)

select * from Courses
select * from Enrollments

-- 16. Count courses priced above 30.
select count(*) as Count_Courses,Price
from Courses
where Price > 30
Group by Price


-- 17. Find average completion percentage.
select count(*) as avg_completion
from Enrollments

-- 18. Find course with lowest average rating

SELECT TOP 1
       CourseID,
       AVG(Rating) AS AvgRating
FROM Enrollments
GROUP BY CourseID
ORDER BY AVG(Rating)


-----------------------------------------------------------------Qustions
--1.What was easiest?
-- Direct COUNT(*) calculations from the same table

--2.What was hardest?
-- Question 18 was the hardest for me because the idea and solution were new, and my approach was different from ChatGPT’s.

--6.What does GROUP BY do (in my own words)?
-- GROUP BY groups rows that have the same value and allows aggregate functions (like AVG and COUNT) to work on each group instead of the entire table


------------------------------------------------------------------

--Day 1 Mini Challenge Course Performance Snapshot
--Show:
--• Course title
--• Total enrollments
--• Average rating
--• Average completion %

select c.Title as Course_Title,
COUNT(e.EnrollmentID) AS TotalEnrollments,
AVG(e.Rating) AS AverageRating,
AVG(e.CompletionPercent) AS AverageCompletionPercent
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY c.Title

----------------------------------------------------------------
--Part 4: JOIN + Aggregation
-- 1. Course title + instructor name + enrollments.
select c.Title as Course_Title,I.FullName as Instructor_Name,COUNT(e.EnrollmentID)
FROM Courses c
JOIN Instructors I  on c.InstructorID = I.InstructorID
JOIN Enrollments e on c.CourseID =  e.CourseID
group by c.Title,I.FullName

-- 2. Category name + total courses + average price.
select ct.CategoryName as Category_Name,count(c.CourseID),AVG(Price)
from Categories ct
JOIN Courses c on ct.CategoryID = c.CategoryID 
GROUP BY ct.CategoryName

-- 3. Instructor name + average course rating.
SELECT I.FullName,avg(Rating) AS Rating
from Instructors I
JOIN Courses c ON I.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID =  e.CourseID
Group by I.FullName

-- 4. Student name + total courses enrolled.
select s.FullName as Student_Name, COUNT(CourseID) AS TotaL_Courses
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FullName 


-- 5. Category name + total enrollments.
select ct.CategoryName AS Category_Name,count(e.EnrollmentID) as total_enrollments
from Categories ct
JOIN Courses c on ct.CategoryID = c.CategoryID
JOIN Enrollments e ON c.CourseID =  e.CourseID
GROUP BY ct.CategoryName

-- 6. Instructor name + total revenue.
select I.FullName as Instructor_name,sum(c.Price) as total_revenue
from Instructors I
JOIN Courses c ON I.InstructorID = c.InstructorID
Group by I.FullName

-- 7. Course title + % of students completed 100%
select c.Title as Course_title,

CASE 
        WHEN COUNT(e.EnrollmentID) = 0 THEN 0
        ELSE 100.0 * SUM(CASE WHEN e.CompletionPercent = 100 THEN 1 ELSE 0 END) 
             / COUNT(e.EnrollmentID)
END AS PercentCompleted100

from Courses c
JOIN Enrollments E ON c.CourseID =  E.CourseID
Group by c.Title

-- Part 5: HAVING Practice   Use HAVING only.

-- 1. Courses with more than 1 enrollments.
select c.Title as Course_Title,COUNT(e.EnrollmentID) AS Total_Enrollment
FROM Courses c
JOIN Enrollments e on c.CourseID =  e.CourseID
group by c.Title
HAVING COUNT(e.EnrollmentID) > 1


-- 2. Instructors with average rating above 2.
SELECT i.FullName AS InstructorName,
       AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
HAVING AVG(e.Rating) > 2

-- 3. Courses with average completion below 60%.
select c.Title As Courses, avg(e.CompletionPercent) as average_completion_below60
from Courses c
JOIN Enrollments e on c.CourseID =  e.CourseID
Group by c.Title
Having avg(e.CompletionPercent) < 60

-- 4. Categories with more than 1 course.
select ct.CategoryName as Categories,count(c.CourseID) as total_courses
from Categories ct
JOIN Courses c ON ct.CategoryID = c.CategoryID
Group by ct.CategoryName
Having count(c.CourseID) > 1

-- 5. Students enrolled in at least 2 courses
 select s.FullName as Students,count(c.CourseID) as total_courses
 from Students s
 JOIN Enrollments c ON  s.StudentID =  c.StudentID
 Group by s.FullName
 Having count(c.CourseID) >= 2
 

-- Part 6: Analytical Thinking  Answer using SQL + short explanation:

-- 1. Best performing course.
select TOP 1
c.Title As Courses,AVG(e.Rating) AS AvgRating,count(e.EnrollmentID) as Best_performing_course
from Courses c
JOIN Enrollments e ON c.CourseID =  e.CourseID
Group by c.Title
ORDER BY avg(e.Rating) DESC, COUNT(e.EnrollmentID) DESC

-- 2. Instructor to promote.
SELECT TOP 1
       i.FullName,
       AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY AVG(e.Rating) DESC

-- 3. Highest revenue category.
SELECT TOP 1
       cat.CategoryName,
       SUM(c.Price) AS TotalRevenue
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName
ORDER BY SUM(c.Price) DESC

-- 4. Do expensive courses have better ratings?
SELECT
    c.Title,
    c.Price,
    AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title, c.Price
ORDER BY c.Price DESC
-- i compare each course’s price with its average rating. If higher-priced courses have higher average ratings,this suggests that expensive courses tend to offer better quality


-- 5. Do cheaper courses have higher completion?
SELECT
    c.Title,
    c.Price,
    AVG(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title, c.Price
ORDER BY c.Price
-- i compare each course’s price with its average completion percentage. If cheaper courses show higher completion rates, this indicates that lower prices encourage students to finish the course


-- Final Challenge – Mini Analytics Report

-- 1. Top 3 courses by revenue.
SELECT TOP 3 
c.Title,SUM(c.Price) AS TotalRevenue
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY TotalRevenue DESC


-- 2. Instructor with most enrollments.
SELECT Top 1 
i.FullName,COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY TotalEnrollments DESC

-- 3. Course with lowest completion rate.
SELECT Top 1
    c.Title,
    AVG(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY AvgCompletion ASC

-- 4. Category with highest average rating.
SELECT top 1
    cat.CategoryName,
    AVG(e.Rating) AS AvgRating
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName
ORDER BY AvgRating DESC

-- 5. Student enrolled in most courses.
SELECT top 1
    s.FullName,
    COUNT(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FullName
ORDER BY TotalCourses DESC