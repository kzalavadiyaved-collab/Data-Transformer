# 📊 Data Transformer — SQL Data Analysis & Transformation

<p align="center">

<img src="https://img.shields.io/badge/SQL-Data%20Transformation-336791?style=for-the-badge&logo=mysql&logoColor=white" />
<img src="https://img.shields.io/badge/Project-Completed-success?style=for-the-badge" />
<img src="https://img.shields.io/badge/Domain-Data%20Analysis-blueviolet?style=for-the-badge" />

</p>

<p align="center">
<b>A practical SQL project focused on data transformation, analysis, joins, functions, subqueries and window functions.</b>
</p>

---

[![Play Video](https://img.shields.io/badge/▶%20Play-Video-success?style=for-the-badge)](https://drive.google.com/file/d/1mPUE70_Cb3owrwopoarjEoWyw2g9wBrK/view?usp=sharing)

---
## 🚀 About The Project

**Data Transformer** is a practical SQL-based data analysis project created to demonstrate how raw relational data can be transformed into meaningful information.

The project works with business-oriented data such as:

- 👥 Customer information
- 🛒 Order information
- 👨‍💼 Employee information

It demonstrates how SQL can be used to **retrieve, combine, transform, calculate, classify and analyze data**.

The project is designed to move from basic SQL concepts to more advanced analytical operations.

---

## 🎯 Project Objective

The main objective of this project is to develop practical knowledge of SQL and understand how SQL is used in real-world data analysis.

### Major objectives:

- Understand relational database structure
- Retrieve information using SQL
- Combine multiple tables using JOINs
- Perform calculations using aggregate functions
- Use subqueries for advanced filtering
- Transform dates and text
- Apply business logic using CASE
- Generate running totals
- Rank records using window functions
- Prepare clean and meaningful analytical results

---

## 🏢 Business Scenario

This project represents a simplified company database where different types of business information are stored separately.

The company wants to analyze:

**Customers → Orders → Employees → Business Data**

The SQL queries help transform this raw information into useful analytical results.

---

## 🗂️ Database Architecture

Customers  
↓  
CustomerID  
↓  
Orders

Employees  
↓  
EmployeeID  
↓  
Employee Information

The main relationship between customer and order data is:

**Customers.CustomerID = Orders.CustomerID**

---

# 📋 Database Tables

## 👥 1. Customers

The `Customers` table stores customer registration and contact information.

| Column | Description |
|---|---|
| CustomerID | Unique customer identifier |
| FirstName | Customer first name |
| LastName | Customer last name |
| Email | Customer email address |
| RegistrationDate | Customer registration date |

---

## 🛒 2. Orders

The `Orders` table stores customer transaction information.

| Column | Description |
|---|---|
| OrderID | Unique order identifier |
| CustomerID | Related customer identifier |
| OrderDate | Date of order |
| TotalAmount | Total order amount |

---

## 👨‍💼 3. Employees

The `Employees` table stores employee information.

| Column | Description |
|---|---|
| EmployeeID | Unique employee identifier |
| FirstName | Employee first name |
| LastName | Employee last name |
| Department | Employee department |
| HireDate | Employee joining date |
| Salary | Employee salary |

---

# 🧠 SQL Concepts Used

| Category | Concepts |
|---|---|
| 🔗 Joins | INNER JOIN |
| 🔗 Joins | LEFT JOIN |
| 🔗 Joins | RIGHT JOIN |
| 🔗 Joins | FULL OUTER JOIN |
| 🔍 Subqueries | Average-based comparison |
| 📅 Date Functions | YEAR(), MONTH(), DATEDIFF(), DATE_FORMAT() |
| 🔤 String Functions | CONCAT(), REPLACE(), UPPER(), LOWER(), TRIM() |
| 📊 Aggregate Functions | SUM(), AVG() |
| 📈 Window Functions | RANK(), Running Total |
| 🧠 Conditional Logic | CASE |

---

# 📝 Project Tasks

The project contains **17 practical SQL tasks** covering data retrieval, transformation and analysis.

### 🔗 JOIN Operations

**01. INNER JOIN**  
Retrieve customer and order information where matching records exist.

**02. LEFT JOIN**  
Retrieve all customers and their orders, including customers without orders.

**03. RIGHT JOIN**  
Retrieve all orders and their related customer information.

**04. FULL OUTER JOIN**  
Retrieve all customers and all orders, including unmatched records.

### 🔍 Subqueries

**05. Above Average Orders**  
Find customers whose order amount is greater than the average order amount.

**06. Above Average Salary**  
Find employees whose salary is greater than the average employee salary.

### 📅 Date Transformation

**07. Extract Year and Month**  
Extract year and month information from the order date.

**08. Date Difference**  
Calculate the number of days between the order date and the current date.

**09. Date Formatting**  
Convert the order date into a readable date format.

### 🔤 String Transformation

**10. Full Name**  
Combine first name and last name into a single full name.

**11. String Replacement**  
Replace a specific part of a text value.

**12. Case Conversion**  
Convert names into uppercase and lowercase formats.

**13. Data Cleaning**  
Remove unnecessary spaces from email values.

### 📊 Advanced Analysis

**14. Running Total**  
Calculate the cumulative order amount.

**15. Ranking**  
Rank orders according to their total amount using `RANK()`.

**16. Discount Calculation**  
Calculate discounts using conditional SQL logic.

**17. Salary Classification**  
Classify employees into High, Medium and Low salary categories.

---

# 💰 Business Logic

## Discount Classification

The project uses SQL `CASE` logic to classify orders according to their amount.

| Order Amount | Discount |
|---|---|
| More than 1000 | 10% |
| More than 500 | 5% |
| 500 or less | No Discount |

This demonstrates how SQL can implement real-world business rules.

---

# 📈 Running Total

A running total shows the cumulative order amount over time.

Example concept:

Order 1 → 150  
Order 2 → 200  
Order 3 → 300

Running total:

150 → 350 → 650

This is implemented using SQL window functions.

---

# 🏆 Ranking

The `RANK()` window function is used to rank orders according to their total amount.

This allows the company to identify high-value transactions.

---

# 🧹 Data Transformation

The project demonstrates multiple ways of transforming raw data.

### Date Transformation

- Extract year
- Extract month
- Calculate date difference
- Format dates

### String Transformation

- Combine names
- Convert uppercase/lowercase
- Replace text
- Remove extra spaces

### Numerical Transformation

- Calculate average
- Calculate total
- Calculate running total
- Compare values
- Rank records

---

# 🔄 Data Processing Workflow

**RAW DATA**

↓

**JOIN**

↓

**FILTER**

↓

**TRANSFORM**

↓

**CALCULATE**

↓

**ANALYZE**

↓

**RANK**

↓

**CLASSIFY**

↓

**FINAL RESULT**

This workflow represents the complete data transformation process used in the project.

---

# 📁 Project Structure

Data-Transformer/

├── README.md  
├── sql/  
│   ├── database_setup.sql  
│   ├── table_creation.sql  
│   ├── sample_data.sql  
│   ├── join_queries.sql  
│   ├── subqueries.sql  
│   ├── date_functions.sql  
│   ├── string_functions.sql  
│   ├── window_functions.sql  
│   └── case_expressions.sql  
├── screenshots/  
│   └── query-results.png  
└── docs/  
    └── project-notes.md

---

# ⚙️ How To Run

### Step 1 — Create Database

Create a database in your SQL environment.

### Step 2 — Select Database

Select the created database using the `USE` command.

### Step 3 — Create Tables

Create:

- Customers
- Orders
- Employees

### Step 4 — Insert Data

Insert the required sample records.

### Step 5 — Run Queries

Execute the SQL queries for:

- JOINs
- Subqueries
- Date Functions
- String Functions
- Aggregate Functions
- Window Functions
- CASE Expressions

---

# 🧪 Testing Checklist

- [ ] Database created
- [ ] Customers table created
- [ ] Orders table created
- [ ] Employees table created
- [ ] Sample data inserted
- [ ] INNER JOIN tested
- [ ] LEFT JOIN tested
- [ ] RIGHT JOIN tested
- [ ] FULL OUTER JOIN tested
- [ ] Subqueries tested
- [ ] Date functions tested
- [ ] String functions tested
- [ ] Aggregate functions tested
- [ ] Running total tested
- [ ] RANK() tested
- [ ] CASE expression tested
- [ ] Salary classification tested
- [ ] Final results verified
- [ ] README.md added

---

# 📚 Key Learning Outcomes

After completing this project, the following practical skills are demonstrated:

### SQL

- SQL query writing
- Database relationships
- JOIN operations
- Subqueries
- Aggregate functions
- Window functions
- CASE expressions

### Data Transformation

- Date transformation
- String transformation
- Numerical calculations
- Data cleaning
- Data classification

### Data Analysis

- Average-based analysis
- Running totals
- Ranking
- Business-rule analysis
- Report-oriented querying

---

# 🚀 Future Enhancements

The project can be extended into a complete business analytics system by adding:

- 📦 Product Management
- 💳 Payment Management
- 🚚 Delivery Tracking
- 🏷️ Product Categories
- 🌍 Customer Location
- 📊 Sales Dashboard
- 📈 Monthly Revenue Analysis
- 👥 Customer Segmentation
- 📉 Sales Trend Analysis
- 👨‍💼 Department Performance Analysis

---

# 🛡️ Project Assumptions

1. CustomerID uniquely identifies each customer.
2. OrderID uniquely identifies each order.
3. EmployeeID uniquely identifies each employee.
4. Orders are associated with customers using CustomerID.
5. TotalAmount represents the total order value.
6. Discount rules are based on order amount.
7. Salary classification thresholds can be modified according to requirements.
8. SQL function syntax may vary depending on the database system.

---

# 💻 Technologies Used

| Technology | Purpose |
|---|---|
| SQL | Data querying and transformation |
| MySQL / SQL Database | Database management |
| GitHub | Project version control |
| Markdown | Project documentation |

---

# 🎓 Project Type

**Academic + Practical SQL Project**

This project is suitable for demonstrating practical knowledge of SQL, data transformation and data analysis.

---

# 👨‍💻 Author

## Ved K Zalavadiya

**Data Analysis & SQL Project**

| Information | Details |
|---|---|
| Project | Data Transformer |
| Technology | SQL |
| Domain | Data Analysis |
| Type | Practical Project |
| Focus | Data Transformation & Analytics |

---

# ⭐ Project Summary

**Data Transformer** demonstrates how SQL can convert raw relational business data into structured and meaningful analytical information.

The project follows a simple but powerful process:

**Retrieve → Combine → Transform → Calculate → Analyze → Rank → Classify → Report**

It provides practical experience with SQL JOINs, Subqueries, Date Functions, String Functions, Aggregate Functions, Window Functions, Running Totals, Ranking and CASE Expressions.

---

# 🔖 Topics

`SQL` `MySQL` `Data Analysis` `Data Transformation` `SQL Joins` `Subqueries` `Window Functions` `RANK` `CASE` `Date Functions` `String Functions` `Aggregate Functions` `Business Analytics` `Database`

---

<p align="center">
<b>⭐ Data Transformer — Turning Data Into Meaningful Information ⭐</b>
</p>
