create database AirPort
use AirPort
-----------------------------------------------------------------------------------Creation Tables
create table Airport(
Aorport_code CHAR(8) primary Key NOT NULL,
Air_Name VARCHAR(50),
Air_City VARCHAR(50),
Air_State VARCHAR(50)
)

create table Airplane_Type(
AirType_name VARCHAR(30) primary Key Not Null,
Company  VARCHAR(50),
Max_seat  INT
)
create table Airplane(
Airplane_id INT primary Key identity(1,1),
AirType_name VARCHAR(30),
foreign key (AirType_name) references Airplane_Type(AirType_name)
)
create table Flight(
Flight_id INT primary Key identity(1,1),
Airline VARCHAR(50),
Weekdays VARCHAR(15),
Restriction VARCHAR(50)
)
create table Flight_Leg(
Leg_no INT primary Key Not Null,
Flight_id INT,
Aorport_code CHAR(8),
foreign key (Flight_id) references Flight(Flight_id)
)
create table Leg_Instance(
Leg_Date date primary Key Not Null,
Arrival_time time,
Departure_time time,
Available_seats INT,
Airplane_id INT,
Leg_no INT,
foreign key (Airplane_id) references Airplane(Airplane_id),
foreign key (Leg_no) references Flight_Leg(Leg_no)
)
create table Customer(
Customer_id int primary Key Not Null,
Customer_name VARCHAR(50),
Phone VARCHAR(15)
)
create table Reservation(
Reservation_id int primary Key Not Null,
Reser_Date date,
Seat_no VARCHAR(5),
Customer_id int,
foreign key (Customer_id) references Customer(Customer_id)
)
create table Fare(
Code VARCHAR(10) primary Key Not Null,
Amount DECIMAL(8,2),
Flight_id INT,
foreign key (Flight_id) references Flight(Flight_id)
)
-------------------------------------------------------------------------------------------Insertion Recods

INSERT INTO Airport VALUES
('MCT001', 'Muscat Intl Airport', 'Muscat', 'Oman'),
('DXB001', 'Dubai Intl Airport', 'Dubai', 'UAE'),
('DOH001', 'Hamad Intl Airport', 'Doha', 'Qatar')

Select * from Airport

INSERT INTO Airplane_Type VALUES
('A320', 'Airbus', 180),
('B737', 'Boeing', 160)

Select * from Airplane_Type

INSERT INTO Airplane (AirType_name) VALUES
('A320'),
('B737')

Select * from Airplane

INSERT INTO Flight (Airline, Weekdays, Restriction) VALUES
('Oman Air', 'Sun-Mon', 'None'),
('Emirates', 'Daily', 'No pets')

Select * from Flight

INSERT INTO Flight_Leg (Leg_no, Aorport_code, Flight_id) VALUES
(1, 'MCT001', 1),
(2, 'DXB001', 1),
(3, 'DXB001', 2),
(4, 'DOH001', 2)

SELECT * FROM Flight_Leg

INSERT INTO Leg_Instance (Leg_Date, Arrival_time, Departure_time, Available_seats, Airplane_id, Leg_no)
VALUES
('2025-11-20', '10:00', '08:00', 150, 1, 1),
('2025-12-21', '14:00', '12:00', 120, 2, 2)

SELECT * FROM Leg_Instance

INSERT INTO Customer (Customer_id, Customer_name, Phone)
VALUES
(201, 'Ahmed Ali', '91234567'),
(202, 'Sara Mohammed', '92345678')

SELECT * FROM  Customer

INSERT INTO Reservation (Reservation_id, Reser_Date, Seat_no, Customer_id)
VALUES
(301, '2025-12-18', 'A1', 201),
(302, '2025-12-18', 'B2', 202)

SELECT * FROM Reservation

INSERT INTO Fare (Code, Amount, Flight_id)
VALUES
('F001', 500.00, 1),
('F002', 750.00, 2)

SELECT * FROM Fare

-------------------------------------------------------------DML&DQL

---1)1. Display all flight leg records
SELECT * 
FROM Flight_Leg

---2. Display each flight leg ID, scheduled departure time, and arrival time
SELECT Leg_no, Departure_time, Arrival_time
FROM Leg_Instance

---4 Display each flight leg’s ID and available seats as AvailableSeats
SELECT Leg_no, Available_seats AS AvailableSeats
FROM Leg_Instance

---5. List flight leg IDs with available seats greater than 100
SELECT Leg_no
FROM Leg_Instance
WHERE Available_seats > 100

---6 Display airport codes and names where city = 'Cairo'

SELECT Aorport_code, Air_Name
FROM Airport
WHERE Air_City = 'Cairo'

---8. Display flight legs scheduled on 2025-06-10

SELECT *
FROM Leg_Instance
WHERE Leg_Date = '2025-06-10'

---9. Display flight legs ordered by departure time

SELECT *
FROM Leg_Instance
ORDER BY Departure_time

---10. Display the maximum, minimum, and average available seats

SELECT MAX(Available_seats) AS MaxSeats,
       MIN(Available_seats) AS MinSeats,
       AVG(Available_seats) AS AvgSeats
FROM Leg_Instance

---11. Display total number of flight legs
SELECT COUNT(*) AS TotalFlightLegs
FROM Leg_Instance

---12. Display airplanes whose type contains 'Boeing'

SELECT *
FROM Airplane 
WHERE AirType_name LIKE '%Boeing%'

---13. Insert a new flight leg departing from 'CAI' to 'DXB' on 2025-06-10
INSERT INTO Flight_Leg (Leg_no, Aorport_code, Flight_id)
VALUES (5, 'CAI', 1)

INSERT INTO Leg_Instance (Leg_Date, Departure_time, Arrival_time, Available_seats, Airplane_id, Leg_no)
VALUES ('2025-06-10', '09:00', '13:00', 180, 1, 5)

---14. Insert a customer with NULL contact number
INSERT INTO Customer (Customer_id, Customer_name, Phone)
VALUES (203, 'New Customer', NULL)

---15. Reduce available seats of your inserted flight leg by 5
UPDATE Leg_Instance
SET Available_seats = Available_seats - 5
WHERE Leg_Date = '2025-06-10' AND Leg_no = 5 

---16. Delete canceled Airport
DELETE FROM Airport
WHERE Air_State = 'Canceled'







