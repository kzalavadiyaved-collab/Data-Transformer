-- ==========================================
--  SQL Assignment
--  Tables: Customers, Orders, Employees
-- ==========================================

CREATE DATABASE IF NOT EXISTS assignment_db;
USE assignment_db;

-- ------------------------------------------
-- Step 1: Create tables
-- ------------------------------------------
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Email      VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID     INT PRIMARY KEY,
    CustomerID  INT,
    OrderDate   DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName  VARCHAR(50),
    LastName   VARCHAR(50),
    Department VARCHAR(50),
    HireDate   DATE,
    Salary     DECIMAL(10,2)
);

-- ------------------------------------------
-- Step 2: Insert sample data
-- ------------------------------------------
INSERT INTO Customers VALUES
(1, 'John', 'Smith', 'john.smith@example.com'),
(2, 'Emma', 'Davis', '   emma.davis@example.com   '),
(3, 'Raj',  'Patel', 'raj.patel@example.com');

INSERT INTO Orders VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

INSERT INTO Employees VALUES
(1, 'Mark',  'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee',     'HR',    '2021-03-20', 55000.00);


-- ==========================================
--  JOIN QUERIES
-- ==========================================

-- 1. INNER JOIN
--    Orders with customer details (only matching records)
SELECT o.OrderID, o.OrderDate, o.TotalAmount,
       c.CustomerID, c.FirstName, c.LastName, c.Email
FROM Orders o
INNER JOIN Customers c
        ON o.CustomerID = c.CustomerID;

-- 2. LEFT JOIN
--    All customers and their orders (NULL if no order)
SELECT c.CustomerID, c.FirstName, c.LastName,
       o.OrderID, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
       ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN
--    All orders and their customers (if any)
SELECT o.OrderID, o.OrderDate, o.TotalAmount,
       c.CustomerID, c.FirstName, c.LastName
FROM Customers c
RIGHT JOIN Orders o
        ON c.CustomerID = o.CustomerID;

-- 4. FULL OUTER JOIN
--    MySQL does not support FULL JOIN directly,
--    so LEFT JOIN and RIGHT JOIN are combined using UNION
SELECT c.CustomerID, c.FirstName, o.OrderID, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, o.OrderID, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;


-- ==========================================
--  SUBQUERIES
-- ==========================================

-- 5. Customers who placed orders above the average order amount
SELECT CustomerID, FirstName, LastName
FROM Customers
WHERE CustomerID IN (
        SELECT CustomerID
        FROM Orders
        WHERE TotalAmount > (SELECT AVG(TotalAmount) FROM Orders)
      );

-- 6. Employees whose salary is above the average salary
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


-- ==========================================
--  DATE FUNCTIONS
-- ==========================================

-- 7. Year and month from OrderDate
SELECT OrderID, OrderDate,
       YEAR(OrderDate)  AS Order_Year,
       MONTH(OrderDate) AS Order_Month
FROM Orders;

-- 8. Difference in days between order date and today
SELECT OrderID, OrderDate,
       DATEDIFF(CURDATE(), OrderDate) AS Days_Difference
FROM Orders;

-- 9. OrderDate in DD-MMM-YYYY format
SELECT OrderID,
       DATE_FORMAT(OrderDate, '%d-%b-%Y') AS Formatted_Date
FROM Orders;


-- ==========================================
--  STRING FUNCTIONS
-- ==========================================

-- 10. Full name using CONCAT
SELECT EmployeeID,
       CONCAT(FirstName, ' ', LastName) AS Full_Name
FROM Employees;

-- 11. Replace 'John' with 'Jonathan'
SELECT CustomerID,
       REPLACE(FirstName, 'John', 'Jonathan') AS New_FirstName
FROM Customers;

-- 12. FirstName in uppercase, LastName in lowercase
SELECT EmployeeID,
       UPPER(FirstName) AS FirstName_Upper,
       LOWER(LastName)  AS LastName_Lower
FROM Employees;

-- 13. Remove extra spaces from Email
SELECT CustomerID,
       TRIM(Email) AS Trimmed_Email
FROM Customers;


-- ==========================================
--  WINDOW FUNCTIONS
-- ==========================================

-- 14. Running total of TotalAmount
SELECT OrderID, OrderDate, TotalAmount,
       SUM(TotalAmount) OVER (ORDER BY OrderDate, OrderID) AS Running_Total
FROM Orders;

-- 15. Rank orders by TotalAmount (highest amount = rank 1)
SELECT OrderID, TotalAmount,
       RANK() OVER (ORDER BY TotalAmount DESC) AS Order_Rank
FROM Orders;


-- ==========================================
--  CASE STATEMENTS
-- ==========================================

-- 16. Discount based on TotalAmount
--     > 1000 : 10% off, > 500 : 5% off, otherwise no discount
SELECT OrderID, TotalAmount,
       CASE
           WHEN TotalAmount > 1000 THEN '10% off'
           WHEN TotalAmount > 500  THEN '5% off'
           ELSE 'No discount'
       END AS Discount,
       CASE
           WHEN TotalAmount > 1000 THEN TotalAmount * 0.90
           WHEN TotalAmount > 500  THEN TotalAmount * 0.95
           ELSE TotalAmount
       END AS Final_Amount
FROM Orders;

-- 17. Salary category: High / Medium / Low
SELECT EmployeeID, FirstName, LastName, Salary,
       CASE
           WHEN Salary > 70000  THEN 'High'
           WHEN Salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Category
FROM Employees;
