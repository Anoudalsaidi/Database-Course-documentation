create database Hotal1


CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
)

CREATE TABLE Room (
    room_number INT PRIMARY KEY,
    type VARCHAR(50),
    nightly_rate DECIMAL(10,2),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
)


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
)

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
)


CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    job_title VARCHAR(50),
    salary DECIMAL(10,2)
)


CREATE TABLE Booking_Room (
    booking_id INT,
    room_number INT,
    PRIMARY KEY (booking_id, room_number),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id),
    FOREIGN KEY (room_number) REFERENCES Room(room_number)
)


CREATE TABLE Staff_Booking (
    staff_id INT,
    booking_id INT,
    PRIMARY KEY (staff_id, booking_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
)


INSERT INTO Branch VALUES
(1, 'Central Hotel', 'Muscat'),
(2, 'Sea View', 'Salalah'),
(3, 'Desert Inn', 'Nizwa'),
(4, 'Mountain Lodge', 'Jebel Akhdar'),
(5, 'City Stay', 'Sohar')
select * from Branch

INSERT INTO Room VALUES
(101, 'Single', 40.00, 1),
(102, 'Double', 60.00, 1),
(103, 'Suite', 120.00, 2),
(104, 'Single', 45.00, 3),
(105, 'Double', 70.00, 4)
select * from Room


INSERT INTO Customer VALUES
(201, 'Ahmed Ali', '91234567', 'ahmed@mail.com'),
(202, 'Mona Said', '92345678', 'mona@mail.com'),
(203, 'Salim Noor', '93456789', 'salim@mail.com'),
(204, 'Aisha Omar', '94567890', 'aisha@mail.com'),
(205, 'Yusuf Hassan', '95678901', 'yusuf@mail.com')
select * from Customer 

INSERT INTO Booking VALUES
(301, 201, '2025-01-10', '2025-01-12'),
(302, 202, '2025-01-15', '2025-01-18'),
(303, 203, '2025-02-01', '2025-02-05'),
(304, 204, '2025-02-10', '2025-02-12'),
(305, 205, '2025-03-01', '2025-03-04')
select * from Booking

INSERT INTO Staff VALUES
(401, 'Ali Ahmed', 'Manager', 1500),
(402, 'Sara Khalid', 'Receptionist', 800),
(403, 'Omar Said', 'Cleaner', 500),
(404, 'Fatma Noor', 'Supervisor', 1200),
(405, 'Hassan Ali', 'Receptionist', 750)
select * from Staff

INSERT INTO Booking_Room VALUES
(301, 101),
(302, 102),
(303, 103),
(304, 104),
(305, 105)
select * from Booking_Room

INSERT INTO Staff_Booking VALUES
(401, 301),
(402, 302),
(403, 303),
(404, 304),
(405, 305)
select * from Staff_Booking

----------------------------------------------------------------------------------DQL
--1. Display all guest records.
SELECT * FROM Customer

--2. Display each guest’s name, contact number, and proof ID type.
SELECT name, phone 
FROM Customer

--3. Display all bookings with booking date, status, and total cost.
SELECT booking_id, check_in, check_out
FROM Booking

--4. Display each room number and its price per night as NightlyRate.
SELECT room_number, nightly_rate AS NightlyRate
FROM Room

--5. List rooms priced above 1000 per night.
SELECT *
FROM Room
WHERE nightly_rate > 100

--6. Display staff members working as 'Receptionist'.
SELECT *
FROM Staff
WHERE job_title = 'Receptionist'

--7. Display bookings made in 2025.
SELECT *
FROM Booking
WHERE YEAR(check_in) = 2025

--8. Display bookings ordered by total cost descending.
SELECT *,
       DATEDIFF(day, check_in, check_out) AS stay_days
FROM Booking
ORDER BY stay_days DESC

--9. Display the maximum, minimum, and average room price.
SELECT 
    MAX(nightly_rate) AS MaxPrice,
    MIN(nightly_rate) AS MinPrice,
    AVG(nightly_rate) AS AvgPrice
FROM Room

--10. Display total number of rooms.
SELECT COUNT(*) AS TotalRooms
FROM Room

--11. Display guests whose names start with 'M'.
SELECT *
FROM Customer
WHERE name LIKE 'M%'


--12. Display rooms priced between 80 and 150
SELECT *
FROM Room
WHERE nightly_rate BETWEEN 80 AND 150


------------------------------------------------------------------------------------DML

-- 13. Insert yourself as a guest (Guest ID = 9011).
INSERT INTO Customer (customer_id, name, phone, email)
VALUES (901, 'Anoud', '99999999', 'yourname@email.com')
select * from Customer

-- 14. Create a booking for room 205.
INSERT INTO Booking (booking_id, customer_id, check_in, check_out)
VALUES (6001, 9011, '2025-06-01', '2025-06-05')

-- 15. Insert another guest with NULL contact and proof details.
INSERT INTO Customer (customer_id, name, phone, email)
VALUES (9012, 'Guest Unknown', NULL, NULL)

-- 16. Update your booking status to 'Confirmed'.
ALTER TABLE Booking
ADD booking_status VARCHAR(20)

UPDATE Booking
SET booking_status = 'Confirmed'
WHERE booking_id = 6001

-- 17. Increase room prices by 10% for luxury rooms.
UPDATE Room
SET nightly_rate = nightly_rate * 1.10
WHERE type = 'Suite'

-- 18. Update booking status to 'Completed' where checkout date is before today.

UPDATE Booking
SET booking_status = 'Completed'
WHERE check_out < GETDATE()

UPDATE Booking
SET booking_status = 'Completed'
WHERE check_out < CURRENT_DATE

-- 19. Delete bookings with status 'Cancelled'
DELETE FROM Booking
WHERE booking_status = 'Cancelled'

----------------------------------------------------------------------------------------------------------Join
-- 1. Display hotel ID, name, and the name of its manager.
SELECT b.branch_id, b.name AS hotel_name, s.name AS manager_name
FROM Branch b
JOIN Staff s ON s.staff_id IN (
    SELECT staff_id 
    FROM Staff_Booking sb
    JOIN Booking bk ON sb.booking_id = bk.booking_id
    WHERE s.job_title = 'Manager'
)

-- 2. Display hotel names and the rooms available under them.
SELECT b.name AS hotel_name, r.room_number, r.type, r.nightly_rate
FROM Branch b
JOIN Room r ON b.branch_id = r.branch_id
ORDER BY b.name, r.room_number

-- 3. Display guest data along with the bookings they made.
SELECT c.customer_id, c.name AS guest_name, c.phone, c.email,
       bk.booking_id, bk.check_in, bk.check_out
FROM Customer c
LEFT JOIN Booking bk ON c.customer_id = bk.customer_id
ORDER BY c.customer_id

-- 4. Display bookings for hotels in 'Jebel Akhdar' or 'Nizwa'.
SELECT bk.booking_id, c.name AS guest_name, b.name AS hotel_name, bk.check_in, bk.check_out
FROM Booking bk
JOIN Customer c ON bk.customer_id = c.customer_id
JOIN Booking_Room brm ON bk.booking_id = brm.booking_id
JOIN Room r ON brm.room_number = r.room_number
JOIN Branch b ON r.branch_id = b.branch_id
WHERE b.location IN ('Jebel Akhdar', 'Nizwa')

select * from Booking
select * from Branch

-- 5. Display all room records where room type starts with "S" (e.g., "Suite", "Single").
SELECT room_number, type, nightly_rate, branch_id
FROM Room
WHERE type LIKE 'S%'

select * from Room

-- 6. List guests who booked rooms priced between 1500 and 2500 LE.
SELECT  c.customer_id, c.name, c.phone, c.email
FROM Customer c
JOIN Booking bk ON c.customer_id = bk.customer_id
JOIN Booking_Room brm ON bk.booking_id = brm.booking_id
JOIN Room r ON brm.room_number = r.room_number
WHERE r.nightly_rate BETWEEN 1500 AND 2500

select * from Customer

-- 7. Retrieve guest names who have bookings marked as 'Completed' in hotel "Sea View".
SELECT c.name AS guest_name
FROM Customer c
JOIN Booking bk ON c.customer_id = bk.customer_id
JOIN Booking_Room brm ON bk.booking_id = brm.booking_id
JOIN Room r ON brm.room_number = r.room_number
JOIN Branch b ON r.branch_id = b.branch_id
WHERE bk.booking_status = 'Completed' AND b.name = 'Sea View'


-- 8. Find guests whose bookings were handled by staff member "Sara Khalid".
SELECT c.name AS guest_name
FROM Customer c
JOIN Booking bk ON c.customer_id = bk.customer_id
JOIN Staff_Booking sb ON bk.booking_id = sb.booking_id
JOIN Staff s ON sb.staff_id = s.staff_id
WHERE s.name = 'Sara Khalid'

select * from Staff
-- 9. Display each guest’s name and the rooms they booked, ordered by room type.
SELECT c.name AS guest_name, r.room_number, r.type
FROM Customer c
JOIN Booking bk ON c.customer_id = bk.customer_id
JOIN Booking_Room brm ON bk.booking_id = brm.booking_id
JOIN Room r ON brm.room_number = r.room_number
ORDER BY c.name, r.type


-- 10. For each hotel in 'Salalah', display hotel ID, name, manager name, and contact info.
SELECT b.branch_id,b.name AS hotel_name, s.name AS manager_name
FROM Branch b
JOIN Room r ON b.branch_id = r.branch_id
JOIN Booking_Room br ON r.room_number = br.room_number
JOIN Staff_Booking sb ON br.booking_id = sb.booking_id
JOIN Staff s ON sb.staff_id = s.staff_id
WHERE b.location = 'Muscat' AND s.job_title = 'Manager'

select * from Branch
select * from Staff

-- 11. Display all staff members who hold 'Manager' positions.

SELECT *
FROM Staff
WHERE job_title = 'Manager'


-- 12. Display all guests and their reviews, even if some guests haven't submitted any reviews

SELECT c.name,
       b.check_in,
	   b.check_out
FROM Customer c
LEFT JOIN Booking b ON c.customer_id = b.customer_id