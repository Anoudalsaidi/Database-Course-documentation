Create database Banks
use Banks

CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    address VARCHAR(100),
    phone_number VARCHAR(15)
)

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    position VARCHAR(30),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
)

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100),
    phone_number VARCHAR(15),
    date_of_birth DATE
)

CREATE TABLE Account (
    account_number INT PRIMARY KEY,
    balance DECIMAL(10,2),
    account_type VARCHAR(20),   -- Savings / Checking
    date_of_creation DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
)

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(20), -- Withdrawal / Deposit / Transfer
    account_number INT,
    FOREIGN KEY (account_number) REFERENCES Account(account_number)
)
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    issue_date DATE,
    amount DECIMAL(10,2),
    loan_type VARCHAR(30),
    customer_id INT,
    employee_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
)
CREATE TABLE Employee_Customer (
    employee_id INT,
    customer_id INT,
    PRIMARY KEY (employee_id, customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
)

INSERT INTO Branch VALUES
(1, 'Muscat', '24567890'),
(2, 'Sohar', '26789012')

select * from Branch

INSERT INTO Employee VALUES
(101, 'Ali Hassan', 'Manager', 1),
(102, 'Fatma Said', 'Clerk', 2)

select * from Employee

INSERT INTO Customer VALUES
(201, 'Ahmed Ali', 'Muscat', '91234567', '1999-05-10'),
(202, 'Sara Mohammed', 'Sohar', '92345678', '2000-08-15')

select * from Customer

INSERT INTO Account VALUES
(3001, 5000.00, 'Savings', '2024-01-01', 201),
(3002, 2500.00, 'Checking', '2024-02-01', 202)

select * from Account

INSERT INTO Transactions VALUES
(4001, '2024-03-01', 500.00, 'Deposit', 3001),
(4002, '2024-03-05', 200.00, 'Withdrawal', 3002)

select * from Transactions

INSERT INTO Loan VALUES
(5001, '2024-04-01', 10000.00, 'Personal', 201, 101),
(5002, '2024-04-10', 15000.00, 'Car', 202, 102)

select * from Loan

INSERT INTO Employee_Customer VALUES
(101, 201),
(102, 202)

select * from Employee_Customer



---2. Display customer full name, phone, and membership start date
SELECT name AS FullName, phone_number AS Phone, date_of_birth AS MembershipStartDate
FROM Customer

---3. Display each loan ID, amount, and type.
SELECT loan_id, amount, loan_type
FROM Loan

---4. Display account number and annual interest (5% of balance) as AnnualInterest.
SELECT account_number, balance * 0.05 AS AnnualInterest
FROM Account

---5. List customers with loan amounts greater than 10000 LE.
SELECT C.customer_id, C.name, L.amount
FROM Customer C
JOIN Loan L ON C.customer_id = L.customer_id
WHERE L.amount > 10000

---6. List accounts with balances above 2000.
SELECT account_number, balance
FROM Account
WHERE balance > 2000

---7. Display accounts opened in 2023.
SELECT account_number, balance, date_of_creation
FROM Account
WHERE YEAR(date_of_creation) = 2023

---8. Display accounts ordered by balance descending.
SELECT account_number, balance
FROM Account
ORDER BY balance DESC

---9. Display the maximum, minimum, and average account balance.
SELECT MAX(balance) AS MaxBalance,
       MIN(balance) AS MinBalance,
       AVG(balance) AS AvgBalance
FROM Account

---10. Display total number of customers.
SELECT COUNT(*) AS TotalCustomers
FROM Customer

---11. Display customers with NULL phone numbers.
SELECT *
FROM Customer
WHERE phone_number IS NULL

---13. Insert yourself as a new customer and open an account with balance 10000.
INSERT INTO Customer (customer_id, name, address, phone_number, date_of_birth)
VALUES (203, 'Your Name', 'Muscat', '91234567', '2005-01-01')

INSERT INTO Account (account_number, balance, account_type, date_of_creation, customer_id)
VALUES (3003, 10000, 'Savings', GETDATE(), 203)

---14. Insert another customer with NULL phone and address.
INSERT INTO Customer (customer_id, name, address, phone_number, date_of_birth)
VALUES (204, 'Friend Name', NULL, NULL, '2004-06-15')

---15. Increase your account balance by 20%.
UPDATE Account
SET balance = balance * 1.2
WHERE customer_id = 203

---16. Increase balance by 5% for accounts with balance less than 5000.
UPDATE Account
SET balance = balance * 1.05
WHERE balance < 5000

---17. Update phone number to 'Not Provided' where phone is NULL.
UPDATE Customer
SET phone_number = 'Not Provided'
WHERE phone_number IS NULL



