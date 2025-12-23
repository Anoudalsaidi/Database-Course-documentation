-- Display library ID, name, and the name of the manager.
SELECT l.Library_ID,l.Library_Name,s.staff_fullName AS ManagerName
FROM Libraries l
JOIN staff_library s ON l.Library_ID = s.Library_ID
WHERE s.Position = 'Manager'

-- Display library names and the books available in each one.
SELECT l.Library_Name,b.Book_Title
FROM Libraries l
JOIN Books b ON l.Library_ID = b.Library_ID
WHERE b.Book_IsAvailable = 1

-- Display all member data along with their loan history.
SELECT m.*,lo.Loan_ID,lo.LoanDate,lo.DueDate,lo.ReturnDate,lo.Loan_Status
FROM Members m
LEFT JOIN Loan lo ON m.Member_ID = lo.Member_ID

-- Display all books located in 'Salalah' or 'Sohar'.
SELECT b.*
FROM Books b
JOIN Libraries l ON b.Library_ID = l.Library_ID
WHERE l.Library_Location IN ('Salalah', 'Sohar')

select * from Books
-- Display all books whose titles start with 'I'.
SELECT *
FROM Books
WHERE Book_Title LIKE 'I%'

-- List members who borrowed books priced between 100 and 300 LE.
SELECT Member_FullName,b.Book_Price
FROM Members m
JOIN Loan lo ON m.Member_ID = lo.Member_ID
JOIN Books b ON lo.Book_ID = b.Book_ID
WHERE b.Book_Price BETWEEN 10 AND 90
SELECT * FROM Books

-- Retrieve members who borrowed and returned books titled 'Database Systems'.

SELECT m.Member_ID,m.Member_FullName,b.Book_Title,lo.Loan_Status
FROM Members m
JOIN Loan lo
  ON m.Member_ID = lo.Member_ID
JOIN Books b
  ON lo.Book_ID = b.Book_ID
WHERE b.Book_Title = 'Database Systems' AND lo.Loan_Status = 'Returned'

select * from loan
select * from books

-- Find all members assisted by librarian "Saleh".
SELECT m.Member_ID,m.Member_FullName
FROM Members m
JOIN Loan lo
  ON m.Member_ID = lo.Member_ID
JOIN Books b
  ON lo.Book_ID = b.Book_ID
JOIN staff_library s
  ON b.Library_ID = s.Library_ID
WHERE s.staff_fullName = 'Saleh'
  AND s.Position = 'Librarian'

  select * from staff_library

-- Display each member’s name and the books they borrowed, ordered by book title.
SELECT m.Member_FullName,b.Book_Title
FROM Members m
JOIN Loan lo
  ON m.Member_ID = lo.Member_ID
JOIN Books b
  ON lo.Book_ID = b.Book_ID
ORDER BY b.Book_Title

-- For each book located in 'Sohar Branch', show title, library name, manager, and shelf info.

SELECT b.Book_Title,l.Library_Name,s.staff_fullName AS Manager_Name,b.ShelfLocation
FROM Libraries l
JOIN staff_library s
  ON s.Library_ID = l.Library_ID
JOIN Books b
  ON b.Library_ID = l.Library_ID
WHERE l.Library_Location = 'Muscat'
  AND s.Position = 'Manager'

  select * from staff_library
  select * from Libraries
  select * from books

-- Display all staff members who manage libraries.
SELECT staff_ID,staff_fullName,Library_ID
FROM staff_library
WHERE Position = 'Manager'

-- Display all members and their reviews, even if some didn’t submit any review yet
SELECT m.Member_FullName,r.Rating,r.Comments,r.ReviewDate
FROM Members m
LEFT JOIN Reviews r
  ON m.Member_ID = r.Member_ID

  select * from Members