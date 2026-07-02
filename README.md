# 🛒 E-Commerce Management System (MySQL)

A comprehensive **E-Commerce Management System** built using **MySQL**. This project demonstrates database design, SQL programming, and advanced database concepts such as stored procedures, triggers, events, transactions, window functions, and views.

---

## 📌 Project Overview

The E-Commerce Management System simulates a real-world online shopping platform. It manages users, products, categories, shopping carts, orders, payments, and customer reviews while showcasing a wide range of SQL concepts.

This project is designed for learning, practice, and portfolio purposes.

---

## 🚀 Features

* User Management
* Product & Category Management
* Shopping Cart
* Order Management
* Payment Tracking
* Customer Reviews
* Inventory Management
* Business Reports
* Sample Data for Testing

---

## 🗂️ Database Tables

| Table       | Description                     |
| ----------- | ------------------------------- |
| Users       | Stores customer information     |
| Categories  | Stores product categories       |
| Products    | Stores product details          |
| Cart        | Shopping cart items             |
| Orders      | Customer orders                 |
| Order_Items | Products included in each order |
| Payments    | Payment details                 |
| Reviews     | Product reviews and ratings     |

---

## 🛠 Technologies Used

* MySQL 8+
* SQL
* MySQL Workbench

---

## 📚 SQL Concepts Covered

### Database Operations

* CREATE DATABASE
* CREATE TABLE
* ALTER TABLE
* DROP TABLE

### Constraints

* Primary Key
* Foreign Key
* Unique
* Check
* Not Null
* Auto Increment

### DML Commands

* INSERT
* UPDATE
* DELETE

### Query Operations

* SELECT
* WHERE
* ORDER BY
* LIMIT
* DISTINCT
* LIKE
* BETWEEN
* IN
* IS NULL

### Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

### Grouping

* GROUP BY
* HAVING

### Joins

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* Multi-Table JOIN

### Advanced SQL

* Subqueries
* Correlated Subqueries
* CASE Statements
* String Functions
* Date Functions
* Window Functions
* UNION

### Database Objects

* Views
* Indexes
* Stored Procedures
* Triggers
* Events

### Transactions

* START TRANSACTION
* COMMIT
* ROLLBACK

---

## 📊 Project Structure

```
E-Commerce-Management-System/
│
├── schema.sql
├── sample_data.sql
├── queries.sql
├── README.md
└── ER_Diagram.png
```

---

## 🧩 Entity Relationship

The database consists of the following relationships:

* One User can place multiple Orders.
* One Category contains multiple Products.
* One Order contains multiple Order Items.
* One Product can receive multiple Reviews.
* One Order has one Payment.
* Users can add multiple Products to their Cart.

---

## 📈 Sample Reports Included

* Total Revenue
* Total Users
* Total Products
* Total Orders
* Product Price Ranking
* Payment Method Analysis
* Category-wise Product Count
* Delivered Orders Report
* Running Total of Orders

---

## ▶️ How to Run

1. Open MySQL Workbench.
2. Create a new SQL tab.
3. Open the SQL script.
4. Execute the script.
5. The database and sample data will be created automatically.
6. Run the SQL queries to explore the database.

---

## 📷 Future Improvements

* Add Employee & Admin Modules
* Product Discounts
* Coupons & Offers
* Wishlist Feature
* Shipping Details
* Inventory Alerts
* Return & Refund Management
* Sales Dashboard
* Role-Based Access Control

---

## ⚠️ Note

This project is created for educational and portfolio purposes.

Passwords in the sample data are stored as plain text for demonstration only. In real-world applications, passwords should always be securely hashed and encrypted.

---

## 👨‍💻 Author

**Sundarraj C**

Computer Science & Engineering Graduate

### Skills

* MySQL
* SQL
* JavaScript
* HTML
* CSS
* React
* Python
* Django

---

## ⭐ If you found this project useful, please consider giving it a Star on GitHub!

