DROP DATABASE IF EXISTS data_transformer;
CREATE DATABASE data_transformer;
USE data_transformer;

-- Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

-- Data
INSERT INTO Customers VALUES
(1, 'John', 'Smith', 'john.smith@example.com'),
(2, 'Emma', 'Davis', '   emma.davis@example.com   '),
(3, 'Raj', 'Patel', 'raj.patel@example.com');

INSERT INTO Orders VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

INSERT INTO Employees VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

-- Queries

-- 1. INNER JOIN
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

-- 2. LEFT JOIN
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 4. FULL OUTER JOIN (LEFT + RIGHT with UNION)
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 5. Customers with orders above average amount
SELECT * FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID FROM Orders
    WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
);

-- 6. Employees with salary above average
SELECT * FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 7. Year and month from OrderDate
SELECT OrderID, YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month
FROM Orders;

-- 8. Difference in days between order date and current date
SELECT OrderID, DATEDIFF(CURDATE(), OrderDate) AS Days
FROM Orders;

-- 9. Format OrderDate as DD-MMM-YYYY
SELECT OrderID, DATE_FORMAT(OrderDate, '%d-%b-%Y') AS OrderDate
FROM Orders;

-- 10. Full name
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees;

-- 11. Replace 'John' with 'Jonathan'
SELECT REPLACE(FirstName, 'John', 'Jonathan') AS FirstName
FROM Customers;

-- 12. FirstName uppercase, LastName lowercase
SELECT UPPER(FirstName) AS FirstName, LOWER(LastName) AS LastName
FROM Employees;

-- 13. Trim spaces from Email
SELECT TRIM(Email) AS Email
FROM Customers;

-- 14. Running total of TotalAmount
SELECT OrderID, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderID) AS RunningTotal
FROM Orders;

-- 15. Rank orders by TotalAmount
SELECT OrderID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

-- 16. Discount based on TotalAmount
SELECT OrderID, TotalAmount,
       CASE
           WHEN TotalAmount > 1000 THEN '10% off'
           WHEN TotalAmount > 500 THEN '5% off'
           ELSE 'No discount'
       END AS Discount
FROM Orders;

-- 17. Salary category
SELECT FirstName, Salary,
       CASE
           WHEN Salary > 70000 THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS SalaryCategory
FROM Employees;