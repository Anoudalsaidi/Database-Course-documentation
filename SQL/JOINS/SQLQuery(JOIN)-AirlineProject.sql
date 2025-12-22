-- Display each flight leg's ID, schedule, and the name of the airplane assigned to it.
SELECT fl.Leg_no AS FlightLegID,li.Leg_Date   AS ScheduleDate,li.Departure_time,li.Arrival_time,a.AirType_name   AS AirplaneName
FROM Flight_Leg fl
JOIN Leg_Instance li
 ON fl.Leg_no = li.Leg_no
JOIN Airplane a
ON li.Airplane_id = a.Airplane_id

-- Display all flight numbers and the names of the departure and arrival airports.
SELECT f.Flight_id  AS FlightNumber,dep.Air_name   AS DepartureAirport,arr.Air_name   AS ArrivalAirport
FROM Flight f
JOIN Flight_Leg fl
ON f.Flight_id = fl.Flight_id
JOIN Airport dep
ON fl.Aorport_code = dep.Aorport_code
JOIN Airport arr
ON fl.Aorport_code = arr.Aorport_code

-- Display all reservation data with the name and phone of the customer who made each booking.
select R.Reser_Date AS [reservation data] ,c.Customer_name,c.Phone
from Customer c
JOIN Reservation R ON c.Customer_id = R.Customer_id


-- Display IDs and locations of flights departing from 'CAI' or 'DXB'.
SELECT FL.Flight_id,A.Air_Name AS Departure_Airport,A.Air_City AS Departure_City
FROM Flight_Leg FL
JOIN Airport A ON FL.Aorport_code = A.Aorport_code
WHERE FL.Aorport_code IN ('CAI', 'DXB')

-- Display full data of flights whose Airline start with 'E'.
SELECT *
FROM Flight
WHERE Airline LIKE 'E%'

-- Find names of passengers whose booking was handled by agent "Ahmed Ali".
select c.Customer_name,r.Reservation_id,r.Reser_Date
from Customer c
JOIN Reservation r ON c.Customer_id = r.Customer_id
where c.Customer_name = 'Ahmed Ali'


-- For each flight departing from 'Cairo', display the flight number, departure time, and airline name.
SELECT f.Flight_id,li.Departure_time,f.Airline
FROM Flight_Leg fl
JOIN Leg_Instance li ON fl.Leg_no = li.Leg_no  
JOIN Flight f ON fl.Flight_id = f.Flight_id
JOIN Airport a ON fl.Aorport_code = a.Aorport_code
WHERE a.Air_City = 'Doha'

-- Display all staff members who are assigned as supervisors for flights.
SELECT r.Reservation_id,r.Seat_no,r.Reser_Date,c.Customer_id,c.Customer_name,c.Phone
FROM Reservation r
LEFT JOIN Customer c ON r.Customer_id = c.Customer_id
ORDER BY r.Reser_Date, r.Reservation_id
