-- Display branch ID, name, and the name of the employee who manages it.

SELECT b.branch_id,b.address AS BranchName,e.name AS ManagerName
FROM Branch b JOIN Employee e ON b.branch_id = e.branch_id
WHERE e.position = 'Manager'

-- Display branch names and the accounts opened under each.

SELECT b.address AS BranchName,a.account_number
FROM Branch b
JOIN Employee e ON b.branch_id = e.branch_id
JOIN Loan l ON e.employee_id = l.employee_id
JOIN Account a ON l.customer_id = a.customer_id

-- Display full customer details along with their loans.
SELECT c.*, l.loan_id, l.amount, l.loan_type
FROM Customer c
left JOIN Loan l ON c.customer_id = l.customer_id

-- Display loan records where the loan office is in 'Muscat' or 'Sohar'.

SELECT l.*
FROM Loan l
JOIN Employee e ON l.employee_id = e.employee_id
JOIN Branch b ON e.branch_id = b.branch_id
WHERE b.address IN ('Muscat', 'Sohar')

-- Display account data where the type starts with "S" (e.g., "Savings").
SELECT *
FROM Account
WHERE account_type LIKE 'S%'

-- List customers with accounts having balances between 20,000 and 50,000.

SELECT c.*
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
WHERE a.balance BETWEEN 2000 AND 5000

-- Retrieve customer names who borrowed more than 100,000 LE from 'Cairo Main Branch'.
SELECT c.name
FROM Customer c
JOIN Loan l ON c.customer_id = l.customer_id
JOIN Employee e ON l.employee_id = e.employee_id
JOIN Branch b ON e.branch_id = b.branch_id
WHERE l.amount > 1000
  AND b.address = 'Muscat'

-- Find all customers assisted by employee "Fatma Said".

SELECT c.*
FROM Customer c
JOIN Employee_Customer ec ON c.customer_id = ec.customer_id
JOIN Employee e ON ec.employee_id = e.employee_id
WHERE e.name = 'Fatma Said'

select * from Employee
select * from Customer

-- Display each customer’s name and the accounts they hold, sorted by account type.
SELECT c.name AS CustomerName,a.account_number,a.account_type
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id

-- For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name.
SELECT l.loan_id,c.name AS CustomerName,e.name AS EmployeeName,b.address AS BranchName
FROM Loan l
JOIN Customer c ON l.customer_id = c.customer_id
JOIN Employee e ON l.employee_id = e.employee_id
JOIN Branch b ON e.branch_id = b.branch_id
WHERE b.address = 'Muscat'

-- Display all employees who manage any branch.
SELECT DISTINCT e.*
FROM Employee e
WHERE e.position = 'Manager'

-- Display all customers and their transactions, even if some customers have no transactions yet

SELECT c.name AS CustomerName,t.transaction_id,t.transaction_date,t.amount,t.transaction_type
FROM Customer c
LEFT JOIN Account a ON c.customer_id = a.customer_id
LEFT JOIN Transactions t ON a.account_number = t.account_number
