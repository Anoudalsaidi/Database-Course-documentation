create database Library_project
use Library_project
----------------------------------------------------------------------------------------Creation Table
Create table Libraries(                                               
Library_ID INT PRIMARY KEY IDENTITY(1,1),
Library_Name VARCHAR(50) NOT NULL UNIQUE,
Library_Location VARCHAR(50) NOT NULL,
ContactNumber VARCHAR(20) NOT NULL
)
Create table Members(
 Member_ID INT PRIMARY KEY IDENTITY(1,1),
 Member_FullName VARCHAR(50),
 Member_Email VARCHAR(50) NOT NULL UNIQUE,
 Membership_StartDate DATE NOT NULL
 )
Create table Books (
Book_ID INT PRIMARY KEY IDENTITY(1,1),
ISBN VARCHAR(20) NOT NULL UNIQUE,
Book_Title VARCHAR(50) NOT NULL,
Book_Genre VARCHAR(20) NOT NULL,
CONSTRAINT CK_Book_Genre CHECK (Book_Genre IN ('Fiction', 'Non-fiction', 'Reference', 'Children') ),
Book_IsAvailable BIT NOT NULL DEFAULT 1,
ShelfLocation VARCHAR(50) NOT NULL,
Book_Price DECIMAL(10,2) CHECK (Book_Price > 0),
Library_ID INT NOT NULL,
CONSTRAINT FK_Book_Library FOREIGN KEY (Library_ID) REFERENCES Libraries(Library_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)
Create table Loan (
Loan_ID INT PRIMARY KEY IDENTITY(1,1),
LoanDate DATE NOT NULL,
DueDate DATE NOT NULL,
ReturnDate DATE,
CONSTRAINT CK_Loan_ReturnDate CHECK (ReturnDate IS NULL OR ReturnDate >= LoanDate),
Loan_Status VARCHAR(20) NOT NULL DEFAULT 'Issued',
CONSTRAINT CK_Loan_Status CHECK (Loan_Status IN ('Issued', 'Returned', 'Overdue')),
Book_ID INT NOT NULL,
Member_ID INT NOT NULL,
CONSTRAINT FK_Book_ID FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_Member_ID FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)
Create table staff_library(
staff_ID INT PRIMARY KEY IDENTITY(1,1),
staff_fullName VARCHAR(50) NOT NULL,
Position VARCHAR(50),
ContactNumber VARCHAR(20) NOT NULL,
Library_ID INT NOT NULL,
CONSTRAINT FK_Books_Library FOREIGN KEY (Library_ID) REFERENCES Libraries(Library_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)
Create table Payment (
Payment_ID INT PRIMARY KEY IDENTITY(1,1),
Payment_Date DATE NOT NULL,
payment_Methed VARCHAR(20),
Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
Loan_ID INT NOT NULL,
CONSTRAINT FK_Loan_ID FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)
Create table Reviews (
Review_ID INT PRIMARY KEY IDENTITY(1,1),
Rating INT NOT NULL,
CONSTRAINT CK_Review_Rating CHECK (Rating BETWEEN 1 AND 5),
Comments VARCHAR(255) NOT NULL DEFAULT 'No comments',
ReviewDate DATE NOT NULL,
Book_ID INT NOT NULL,
Member_ID INT NOT NULL,
CONSTRAINT FK_BookID_R FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_Member_R FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
ON DELETE CASCADE
ON UPDATE CASCADE
)

ALTER TABLE Libraries 
ADD Establish_year int

ALTER TABLE Members
ADD PhoneNumber VARCHAR(20)
---------------------------------------------------------------------------------------Insertion Records
insert into Libraries (Library_Name,Library_Location,ContactNumber,Establish_year)
VALUES('Central Library','Muscat','9111111',2025),('City Library','Sohar','9222222',2024),('Uni Library','Salalah','9333333',2020)

Select * from Libraries

INSERT INTO Members (Member_FullName, Member_Email, Membership_StartDate, PhoneNumber)
VALUES 
('Ali Ahmed', 'al7i@email.com', '2024-01-15', '911111111'),
('Sara Mohammed', 's7ara@email.com', '2024-02-01', '922222222'),
('Omar Khaled', 'om7ar@email.com', '2024-03-10', '933333333'),
('Hassan Ali', 'hassa1@email.com', '2024-01-01', '944444444'),
('Mona Said', 'mon2@email.com', '2024-01-05', '955555555'),
('Yousef Nasser', 'yusef3@email.com', '2024-01-10', '966666666'),
('Aisha Salem', 'aisa4@email.com', '2024-01-15', '977777777'),
('Khalid Omar', 'khlid5@email.com', '2024-02-01', '988888888'),
('Fatma Ahmed', 'fama6@email.com', '2024-02-10', '999999999'),
('Nasser Hamed', 'naser7@email.com', '2024-02-20', '900000000'),
('Noor Rashid', 'nor8@email.com', '2024-03-01', '911111112'),
('Majed Ibrahim', 'mjed9@email.com', '2024-03-05', '922222223'),
('Laila Fares', 'laia10@email.com', '2024-03-10', '933333334')


Select * from Members

INSERT INTO Books (ISBN, Book_Title, Book_Genre, Book_IsAvailable, ShelfLocation, Book_Price, Library_ID)
VALUES
('1303', 'SQL Basics', 'Reference', 1, 'A-01', 10.00, 1),
('1002', 'Advanced SQL', 'Reference', 1, 'A-02', 15.00, 1),
('1003', 'Cyber Security 101', 'Non-fiction', 1, 'B-01', 18.00, 1),
('1004', 'Networking Basics', 'Non-fiction', 1, 'B-02', 14.50, 1),
('1005', 'Data Analysis', 'Non-fiction', 1, 'B-03', 20.00, 1),
('1006', 'Fairy Tales', 'Children', 1, 'C-02', 8.00, 2),
('1007', 'Short Stories', 'Fiction', 1, 'D-01', 9.50, 2),
('1008', 'Mystery Night', 'Fiction', 1, 'D-02', 11.00, 2),
('1009', 'Science for Kids', 'Children', 1, 'C-03', 7.75, 2),
('1010', 'History of Oman', 'Non-fiction', 1, 'B-04', 16.00, 2),
('1011', 'Python Programming', 'Reference', 1, 'A-03', 19.00, 1),
('1012', 'Java Basics', 'Reference', 1, 'A-04', 17.00, 1),
('1013', 'Cloud Computing', 'Non-fiction', 1, 'B-06', 21.00, 1),
('1014', 'AI Fundamentals', 'Non-fiction', 1, 'B-07', 22.50, 1),
('1015', 'Digital Logic', 'Reference', 1, 'A-05', 13.00, 1),
('1016', 'Kids Mathematics', 'Children', 1, 'C-04', 6.50, 2),
('1017', 'Fantasy World', 'Fiction', 1, 'D-03', 12.00, 2),
('1018', 'Modern Physics', 'Non-fiction', 1, 'B-08', 23.00, 3),
('1019', 'Chemistry Basics', 'Reference', 1, 'A-06', 14.00, 3),
('1020', 'English Grammar', 'Reference', 1, 'A-07', 11.50, 3)

Select * from Books

INSERT INTO Loan (LoanDate, DueDate, ReturnDate, Loan_Status, Book_ID, Member_ID)
VALUES
('2024-03-01','2024-04-15',NULL,'Issued',1,1),
('2024-01-01','2024-08-10','2024-03-09','Returned',2,2),
('2024-04-10','2024-05-20','2024-04-22','Overdue',3,3),
('2024-05-01','2024-05-10',NULL,'Issued',1011,405),
('2024-05-02','2024-05-12','2024-05-12','Returned',1013,413),
('2024-05-03','2024-05-13',NULL,'Issued',1014,414),
('2024-05-04','2024-05-14','2024-05-15','Overdue',1015,415),
('2024-05-05','2024-05-15','2024-05-14','Returned',1016,416),
('2024-05-06','2024-05-16',NULL,'Issued',1017,417),
('2024-05-07','2024-05-17','2024-05-18','Overdue',1018,418),
('2024-05-08','2024-05-18',NULL,'Issued',1019,419),
('2024-05-09','2024-05-19','2024-05-19','Returned',1020,420),
('2024-05-10','2024-05-20',NULL,'Issued',1021,421),
('2024-05-11','2024-05-21','2024-05-22','Overdue',1022,422),
('2024-05-12','2024-05-22',NULL,'Issued',1023,423)


Select * from Loan


SELECT Member_ID, Member_FullName
FROM Members

insert into staff_library (staff_fullName,Position,ContactNumber,Library_ID)
VALUES ('Saleh', 'Librarian', '999999', 1),('Anoud', 'Assistant Librarian', '4444444', 1),('Mohammed', 'Manager', '6666666', 2)

Select * from staff_library


insert into Payment (Payment_Date,payment_Methed,Amount,Loan_ID)
VALUES ('2025-12-01', 'Cash', 12.50, 57),
       ('2025-12-05', 'Credit Card', 9.00, 60),
       ('2025-12-10', 'Bank Transfer', 45.75, 64)

Select * from Payment

insert into Reviews (Rating,Comments,ReviewDate,Book_ID,Member_ID)
VALUES (5, 'Excellent book, highly recommend!', '2025-12-01', 1, 1),(4, 'Good read, but a bit lengthy.', '2025-12-05', 2, 2),(3, 'Average content, could be better.', '2025-12-10', 3, 3)

Select * from Reviews 


UPDATE Books
SET Published_Year = 2020
WHERE Published_Year IS NULL




-------------------------------------------------------------------------------------++PART-2
-----SECTION 1:------

---1. Library Book Inventory Report

select l.Library_Name,count(b.Book_ID) AS TotalBooks,
SUM(CASE WHEN B.Book_IsAvailable = 1 THEN 1 ELSE 0 END) AS Available_Books,
SUM(CASE WHEN o.Loan_Status = 'Issued'  THEN 1 ELSE 0 END) AS Books_On_Loan
from  Books b
Join  Libraries l on b.Library_ID = l.Library_ID
JOIN  Loan o on b.Book_ID = o.Book_ID
Group by l.Library_Name

Select * from Books
Select * from Libraries
Select * from Loan

---2. Active Borrowers Analysis

select m.Member_FullName,m.Member_Email,b.Book_Title,o.LoanDate,o.DueDate,o.Loan_Status
from Loan o
Join Members m on m.Member_ID = o.Member_ID
Join Books b on b.Book_ID = o.Book_ID
where o.Loan_Status in ('Issued','Overdue')

---3. Overdue Loans with Member Details
select m.Member_FullName,b.Book_Title,Lb.Library_Name,
Datediff(day,L.LoanDate,L.DueDate) AS Days_Overdue,
ISNULL(P.Amount,0) AS Fines_Paid

 FROM Loan L
JOIN Members M ON L.Member_ID = M.Member_ID
JOIN Books B ON L.Book_ID = B.Book_ID
JOIN Libraries Lb ON B.Library_ID = Lb.Library_ID
JOIN Payment P ON L.Loan_ID = P.Loan_ID
WHERE L.Loan_Status = 'Overdue'

Select * from Payment

---4. Staff Performance Overview
select l.Library_Name,ss.staff_fullName,ss.Position,
count (b.Book_ID) AS Books_Managed
from staff_library ss
JOIN Libraries l ON ss.Library_ID = l.Library_ID
JOIN Books B ON l.Library_ID = b.Library_ID
GROUP BY l.Library_Name, ss.staff_fullName, ss.Position


select * from staff_library
select * from Books
select * from Libraries

---5. Book Popularity Report -----comment(Because I do not have books which were loaned more than 1, 
---   I changed the question from 3 to at least 1 to see the result)

select b.Book_Title,b.ISBN,b.Book_Genre,
count(l.Loan_ID) AS Total_Loaned,AVG(R.Rating) as Avg_Review_Rating
from Books b
Join Reviews R ON b.Book_ID = R.Book_ID
Join Loan l ON b.Book_ID = l.Book_ID
Group by b.Book_Title,b.ISBN,b.Book_Genre
Having count(l.Loan_ID) >= 3


--- 6. Member Reading History
select m.Member_FullName,b.Book_Title,l.LoanDate,l.ReturnDate,r.Rating,r.Comments
from Members m
JOIN Loan l ON m.Member_ID = l.Member_ID
JOIN Books b ON l.Book_ID = b.Book_ID
left JOIN Reviews r ON m.Member_ID = r.Member_ID
AND B.Book_ID = R.Book_ID

----7. Revenue Analysis by Genre
select b.Book_Genre,count(l.Loan_ID) AS Total_Loans,SUM(isnull(P.Amount,0)) as Total_Amounts,
avg(isnull(P.Amount,0)) as Avg_Fine_Per_Loan
from Books b
Join Loan l on b.Book_ID = l.Book_ID
Join Payment p on l.Loan_ID = p.Loan_ID
GROUP BY B.Book_Genre


-----SECTION 2:------

--- 8. Monthly Loan Statistics






