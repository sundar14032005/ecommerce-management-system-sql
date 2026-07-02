/**************************************************************************
                    E-COMMERCE MANAGEMENT SYSTEM
---------------------------------------------------------------------------*/

-- Create Database

CREATE DATABASE ecommerce_db;

USE ecommerce_db;

-- 1. Users Table

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(30) UNIQUE,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Categories Table

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    description VARCHAR(300)
);

-- 3. Products Table

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

-- 4. Cart Table

CREATE TABLE cart (
    cart_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id)
    REFERENCES users(user_id),
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- 5. Orders Table

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

-- 6. Order_Items Table

CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

-- 7. Payments Table

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),
    payment_date DATE,
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

-- 8. Reviews Table

CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text VARCHAR(500),
    review_date DATE,
    FOREIGN KEY (user_id)
    REFERENCES users(user_id),
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);
------------------------------------------------------------------------------------------
-- 1 user table

INSERT INTO users (name, email, phone, password) VALUES
('Arun Kumar', 'arun@gmail.com', '9876543201', 'Arun@123'),
('Bala Murugan', 'bala@gmail.com', '9876543202', 'Bala@123'),
('Charan Raj', 'charan@gmail.com', '9876543203', 'Charan@123'),
('Deepak Kumar', 'deepak@gmail.com', '9876543204', 'Deepak@123'),
('Eswar', 'eswar@gmail.com', '9876543205', 'Eswar@123'),
('Farooq Ali', 'farooq@gmail.com', '9876543206', 'Farooq@123'),
('Gokul', 'gokul@gmail.com', '9876543207', 'Gokul@123'),
('Hari Prasad', 'hari@gmail.com', '9876543208', 'Hari@123'),
('Irfan Khan', 'irfan@gmail.com', '9876543209', 'Irfan@123'),
('Jeeva', 'jeeva@gmail.com', '9876543210', 'Jeeva@123'),
('Karthik', 'karthik@gmail.com', '9876543211', 'Karthik@123'),
('Lokesh', 'lokesh@gmail.com', '9876543212', 'Lokesh@123'),
('Manoj Kumar', 'manoj@gmail.com', '9876543213', 'Manoj@123'),
('Naveen', 'naveen@gmail.com', '9876543214', 'Naveen@123'),
('Praveen', 'praveen@gmail.com', '9876543215', 'Praveen@123'),
('Rahul', 'rahul@gmail.com', '9876543216', 'Rahul@123'),
('Sanjay', 'sanjay@gmail.com', '9876543217', 'Sanjay@123'),
('Sundarraj', 'sundarraj@gmail.com', '9876543218', 'Sundar@123'),
('Vignesh', 'vignesh@gmail.com', '9876543219', 'Vignesh@123'),
('Yogesh', 'yogesh@gmail.com', '9876543220', 'Yogesh@123');

-- 2 categories

INSERT INTO categories (category_name, description)
VALUES
('Electronics', 'Electronic gadgets and accessories'),
('Clothing', 'Men and Women fashion wear'),
('Footwear', 'Shoes, sandals and slippers'),
('Books', 'Educational and story books'),
('Home & Kitchen', 'Home appliances and kitchen essentials'),
('Beauty & Personal Care', 'Cosmetics and personal care products'),
('Sports & Fitness', 'Sports equipment and fitness accessories'),
('Toys & Games', 'Toys for kids and board games'),
('Groceries', 'Daily grocery and food items'),
('Furniture', 'Home and office furniture');

-- 3 products

INSERT INTO products (product_name, description, price, stock, category_id) VALUES
('iPhone 16', 'Apple Smartphone', 79999, 25, 1),
('Samsung Galaxy S25', 'Samsung Smartphone', 74999, 20, 1),
('Dell Inspiron Laptop', '15.6 inch Laptop', 62999, 15, 1),
('HP Pavilion Laptop', 'Windows Laptop', 58999, 18, 1),
('Sony Headphones', 'Wireless Bluetooth Headphones', 6999, 40, 1),
('Men Cotton T-Shirt', 'Round Neck T-Shirt', 799, 100, 2),
('Women Kurti', 'Printed Cotton Kurti', 1299, 80, 2),
('Men Jeans', 'Slim Fit Jeans', 1799, 60, 2),
('Womens Jacket', 'Winter Jacket', 2499, 35, 2),
('Kids T-Shirt', 'Kids Casual Wear', 599, 70, 2),
('Nike Running Shoes', 'Running Shoes', 4999, 45, 3),
('Adidas Sneakers', 'Casual Sneakers', 4599, 30, 3),
('Puma Sandals', 'Comfort Sandals', 1999, 55, 3),
('Java Programming', 'Programming Book', 650, 90, 4),
('SQL Complete Guide', 'Learn SQL from Scratch', 550, 120, 4),
('Python for Beginners', 'Python Programming Book', 720, 75, 4),
('Rice Cooker', 'Electric Rice Cooker', 3499, 20, 5),
('Mixer Grinder', '750W Mixer Grinder', 4299, 15, 5),
('Non-Stick Pan', 'Kitchen Cookware', 999, 50, 5),
('Face Wash', 'Skin Care Product', 299, 100, 6),
('Shampoo', 'Hair Care Shampoo', 450, 90, 6),
('Body Lotion', 'Moisturizing Lotion', 399, 80, 6),
('Cricket Bat', 'English Willow Bat', 3999, 20, 7),
('Football', 'Professional Football', 999, 45, 7),
('Yoga Mat', 'Fitness Exercise Mat', 799, 60, 7),
('Remote Control Car', 'Toy Car for Kids', 1499, 35, 8),
('Building Blocks', 'Educational Toy Set', 999, 40, 8),
('Basmati Rice 5kg', 'Premium Rice', 799, 100, 9),
('Office Chair', 'Ergonomic Office Chair', 6999, 15, 10),
('Wooden Study Table', 'Study Table', 8999, 10, 10);

-- 4 carts

INSERT INTO cart (user_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 6, 2),
(2, 3, 1),
(2, 11, 1),
(3, 2, 1),
(3, 15, 2),
(4, 7, 1),
(4, 18, 1),
(5, 5, 2),
(5, 20, 3),
(6, 8, 1),
(6, 23, 1),
(7, 4, 1),
(7, 26, 2),
(8, 12, 1),
(8, 29, 1),
(9, 13, 2),
(9, 30, 1),
(10, 9, 1),
(10, 24, 2),
(11, 10, 1),
(12, 14, 1),
(13, 16, 2),
(14, 17, 1),
(15, 19, 1),
(16, 21, 2),
(17, 22, 1),
(18, 25, 2),
(19, 27, 1),
(20, 28, 3);

-- 5 orders

INSERT INTO orders (user_id, order_date, total_amount, order_status) VALUES
(1, '2026-06-01', 80798, 'Delivered'),
(2, '2026-06-02', 67998, 'Delivered'),
(3, '2026-06-03', 75549, 'Shipped'),
(4, '2026-06-04', 14298, 'Delivered'),
(5, '2026-06-05', 7597, 'Delivered'),
(6, '2026-06-06', 4998, 'Processing'),
(7, '2026-06-07', 60498, 'Delivered'),
(8, '2026-06-08', 11598, 'Cancelled'),
(9, '2026-06-09', 5998, 'Delivered'),
(10, '2026-06-10', 3497, 'Shipped'),
(11, '2026-06-11', 799, 'Delivered'),
(12, '2026-06-12', 650, 'Delivered'),
(13, '2026-06-13', 1440, 'Processing'),
(14, '2026-06-14', 3499, 'Delivered'),
(15, '2026-06-15', 999, 'Delivered'),
(16, '2026-06-16', 450, 'Delivered'),
(17, '2026-06-17', 399, 'Shipped'),
(18, '2026-06-18', 1598, 'Delivered'),
(19, '2026-06-19', 799, 'Delivered'),
(20, '2026-06-20', 6999, 'Processing');

-- 6 order_items

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1,1,1,79999),
(1,5,1,6999),

(2,3,1,62999),
(2,11,1,4999),

(3,2,1,74999),
(3,15,1,550),

(4,7,2,1299),
(4,18,1,4299),

(5,6,2,799),
(5,20,2,299),

(6,8,1,1799),
(6,23,1,3999),

(7,4,1,58999),
(7,26,1,1499),

(8,12,2,4599),
(8,29,1,6999),

(9,13,2,1999),
(9,30,1,8999),

(10,9,1,2499),
(10,24,1,999),

(11,10,1,599),
(11,14,1,650),

(12,16,2,720),
(12,17,1,3499),

(13,19,1,999),
(13,21,1,450),

(14,22,2,399),
(14,25,1,799),

(15,27,1,999),
(15,28,2,799),

(16,5,1,6999),
(16,6,1,799),

(17,2,1,74999),
(17,20,1,299),

(18,23,1,3999),
(18,24,2,999),

(19,11,1,4999),
(19,15,2,550),

(20,1,1,79999),
(20,30,1,8999);

-- 7 payments

INSERT INTO payments (order_id, payment_method, payment_status, payment_date) VALUES
(1, 'UPI', 'Success', '2026-06-01'),
(2, 'Credit Card', 'Success', '2026-06-02'),
(3, 'Debit Card', 'Success', '2026-06-03'),
(4, 'Cash on Delivery', 'Success', '2026-06-04'),
(5, 'Net Banking', 'Success', '2026-06-05'),
(6, 'UPI', 'Pending', '2026-06-06'),
(7, 'Credit Card', 'Success', '2026-06-07'),
(8, 'Debit Card', 'Failed', '2026-06-08'),
(9, 'Cash on Delivery', 'Success', '2026-06-09'),
(10, 'UPI', 'Success', '2026-06-10'),
(11, 'Net Banking', 'Success', '2026-06-11'),
(12, 'Credit Card', 'Success', '2026-06-12'),
(13, 'UPI', 'Pending', '2026-06-13'),
(14, 'Debit Card', 'Success', '2026-06-14'),
(15, 'Cash on Delivery', 'Success', '2026-06-15'),
(16, 'UPI', 'Success', '2026-06-16'),
(17, 'Net Banking', 'Success', '2026-06-17'),
(18, 'Credit Card', 'Success', '2026-06-18'),
(19, 'Debit Card', 'Success', '2026-06-19'),
(20, 'UPI', 'Pending', '2026-06-20');

-- 8 reviews

 INSERT INTO reviews (user_id, product_id, rating, review_text, review_date) VALUES
(1, 1, 5, 'Excellent product and fast delivery.', '2026-06-05'),
(2, 3, 4, 'Very good laptop for daily use.', '2026-06-06'),
(3, 2, 5, 'Amazing mobile phone.', '2026-06-07'),
(4, 7, 4, 'Comfortable dress and good quality.', '2026-06-08'),
(5, 6, 3, 'Good product for the price.', '2026-06-09'),
(6, 23, 5, 'Perfect cricket bat.', '2026-06-10'),
(7, 4, 4, 'Laptop performance is excellent.', '2026-06-11'),
(8, 12, 5, 'Stylish and comfortable shoes.', '2026-06-12'),
(9, 13, 4, 'Very comfortable sandals.', '2026-06-13'),
(10, 24, 5, 'Excellent football quality.', '2026-06-14'),
(11, 10, 4, 'Nice T-shirt and fits well.', '2026-06-15'),
(12, 14, 5, 'Best Java book for beginners.', '2026-06-16'),
(13, 16, 4, 'Python book explained clearly.', '2026-06-17'),
(14, 17, 5, 'Rice cooker works perfectly.', '2026-06-18'),
(15, 19, 4, 'Good non-stick pan.', '2026-06-19'),
(16, 21, 5, 'Shampoo smells great.', '2026-06-20'),
(17, 22, 4, 'Body lotion is very effective.', '2026-06-21'),
(18, 25, 5, 'Yoga mat has excellent grip.', '2026-06-22'),
(19, 28, 4, 'Rice quality is very good.', '2026-06-23'),
(20, 30, 5, 'Study table is strong and spacious.', '2026-06-24');

-----------------------------------------------------------------------------

USE ecommerce_db;

-- ==========================================================
-- 1. SELECT
-- ==========================================================

-- Get every column for every user
SELECT * FROM users;

-- Get only product name and price for all products
SELECT product_name, price
FROM products;

-- ==========================================================
-- 2. WHERE
-- ==========================================================

-- Find products priced above 5000
SELECT *
FROM products
WHERE price > 5000;

-- Find all orders that are Delivered
SELECT *
FROM orders
WHERE order_status = 'Delivered';

-- ==========================================================
-- 3. ORDER BY
-- ==========================================================

-- List products from cheapest to costliest
SELECT *
FROM products
ORDER BY price ASC;

-- List users alphabetically in reverse (Z to A)
SELECT *
FROM users
ORDER BY name DESC;

-- ==========================================================
-- 4. LIMIT
-- ==========================================================

-- Get only the first 5 products
SELECT *
FROM products
LIMIT 5;

-- Get only the first 10 users
SELECT *
FROM users
LIMIT 10;

-- ==========================================================
-- 5. DISTINCT
-- ==========================================================

-- List each payment method only once
SELECT DISTINCT payment_method
FROM payments;

-- List each unique order status
SELECT DISTINCT order_status
FROM orders;

-- ==========================================================
-- 6. LIKE
-- ==========================================================

-- Find users whose name starts with 'A'
SELECT *
FROM users
WHERE name LIKE 'A%';

-- Find products with "Laptop" anywhere in the name
SELECT *
FROM products
WHERE product_name LIKE '%Laptop%';

-- ==========================================================
-- 7. BETWEEN
-- ==========================================================

-- Find products priced between 1000 and 5000
SELECT *
FROM products
WHERE price BETWEEN 1000 AND 5000;

-- Find reviews rated between 4 and 5 stars
SELECT *
FROM reviews
WHERE rating BETWEEN 4 AND 5;

-- ==========================================================
-- 8. IN
-- ==========================================================

-- Find orders that are Delivered or Shipped
SELECT *
FROM orders
WHERE order_status IN ('Delivered', 'Shipped');

-- Find payments made by UPI or Credit Card
SELECT *
FROM payments
WHERE payment_method IN ('UPI', 'Credit Card');

-- ==========================================================
-- 9. NULL HANDLING
-- ==========================================================

-- Find users who have not provided a phone number
SELECT *
FROM users
WHERE phone IS NULL;

-- Find products that do have a description
SELECT *
FROM products
WHERE description IS NOT NULL;

-- ==========================================================
-- 10. AGGREGATE FUNCTIONS
-- ==========================================================

-- Count the total number of registered users
SELECT COUNT(*) AS total_users
FROM users;

-- Find the average price of all products
SELECT AVG(price) AS average_price
FROM products;

-- Find the highest priced product
SELECT MAX(price) AS highest_price
FROM products;

-- Find the lowest priced product
SELECT MIN(price) AS lowest_price
FROM products;

-- Find the total revenue from all orders
SELECT SUM(total_amount) AS total_revenue
FROM orders;

-- ==========================================================
-- 11. GROUP BY
-- ==========================================================

-- Count how many products exist in each category
SELECT category_id, COUNT(*) AS product_count
FROM products
GROUP BY category_id;

-- Count how many payments were made by each payment method
SELECT payment_method, COUNT(*) AS payment_count
FROM payments
GROUP BY payment_method;

-- ==========================================================
-- 12. HAVING
-- ==========================================================

-- Show payment methods used more than 2 times
SELECT payment_method, COUNT(*) AS payment_count
FROM payments
GROUP BY payment_method
HAVING COUNT(*) > 2;

-- Show categories whose average product price is above 5000
SELECT category_id, AVG(price) AS avg_price
FROM products
GROUP BY category_id
HAVING AVG(price) > 5000;

-- ==========================================================
-- 13. INNER JOIN
-- ==========================================================

-- Match each order with the user who placed it
SELECT u.name, o.order_id, o.total_amount
FROM users u
INNER JOIN orders o
ON u.user_id = o.user_id;

-- Match each product with its category name
SELECT p.product_name, c.category_name
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id;

-- ==========================================================
-- 14. LEFT JOIN
-- ==========================================================

-- Show every user, including those who never placed an order
SELECT u.name, o.order_id
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id;

-- Show every product, including those with no reviews yet
SELECT p.product_name, r.rating
FROM products p
LEFT JOIN reviews r
ON p.product_id = r.product_id;

-- ==========================================================
-- 15. RIGHT JOIN
-- ==========================================================

-- Show every order along with its user, from the orders side
SELECT u.name, o.order_id
FROM users u
RIGHT JOIN orders o
ON u.user_id = o.user_id;

-- Show every product along with its category, from the products side
SELECT c.category_name, p.product_name
FROM categories c
RIGHT JOIN products p
ON c.category_id = p.category_id;

-- ==========================================================
-- 16. MULTI-TABLE JOIN
-- ==========================================================

-- Combine users, orders and payments into one readable report
SELECT
    u.name,
    o.order_id,
    o.total_amount,
    p.payment_method,
    p.payment_status
FROM users u
INNER JOIN orders o
ON u.user_id = o.user_id
INNER JOIN payments p
ON o.order_id = p.order_id;

-- Combine orders and order_items to see what was bought in each order
SELECT
    o.order_id,
    pr.product_name,
    oi.quantity,
    oi.price
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products pr
ON oi.product_id = pr.product_id;

-- ==========================================================
-- 17. SUBQUERY
-- ==========================================================

-- Find products priced above the overall average price
SELECT *
FROM products
WHERE price >
(
    SELECT AVG(price)
    FROM products
);

-- Find the review(s) with the highest rating given
SELECT *
FROM reviews
WHERE rating =
(
    SELECT MAX(rating)
    FROM reviews
);

-- ==========================================================
-- 18. CORRELATED SUBQUERY
-- ==========================================================

-- Find users who have placed at least one order
SELECT name
FROM users u
WHERE EXISTS
(
    SELECT 1
    FROM orders o
    WHERE o.user_id = u.user_id
);

-- ==========================================================
-- 19. CASE WHEN
-- ==========================================================

-- Label each product as Expensive, Mid-Range or Budget
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 50000 THEN 'Expensive'
        WHEN price >= 5000 THEN 'Mid-Range'
        ELSE 'Budget'
    END AS price_category
FROM products;

-- ==========================================================
-- 20. STRING FUNCTIONS
-- ==========================================================

-- Show user names in uppercase
SELECT UPPER(name) AS name_upper
FROM users;

-- Show the first 3 characters of each product name
SELECT LEFT(product_name, 3) AS short_name
FROM products;

-- ==========================================================
-- 21. DATE FUNCTIONS
-- ==========================================================

-- Show orders placed in June 2026
SELECT *
FROM orders
WHERE MONTH(order_date) = 6
AND YEAR(order_date) = 2026;

-- Show how many days ago each order was placed
SELECT order_id, DATEDIFF(CURDATE(), order_date) AS days_ago
FROM orders;

-- ==========================================================
-- 22. INSERT
-- ==========================================================

-- Add a new category to the categories table
INSERT INTO categories (category_name, description)
VALUES ('Stationery', 'Pens, notebooks and office supplies');

-- Add a new product under the Electronics category
INSERT INTO products (product_name, description, price, stock, category_id)
VALUES ('Wireless Mouse', 'Ergonomic wireless mouse', 899, 60, 1);

-- ==========================================================
-- 23. UPDATE
-- ==========================================================

-- Increase stock of product_id 1 by 10 units
UPDATE products
SET stock = stock + 10
WHERE product_id = 1;

-- Mark order_id 20 as Delivered
UPDATE orders
SET order_status = 'Delivered'
WHERE order_id = 20;

-- ==========================================================
-- 24. DELETE
-- ==========================================================

-- Remove a specific review by its ID
DELETE FROM reviews
WHERE review_id = 20;

-- Remove a specific cart entry by its ID
DELETE FROM cart
WHERE cart_id = 5;

-- ==========================================================
-- 25. CREATE VIEW
-- ==========================================================

-- Build a reusable view of product name and price only
CREATE VIEW view_product_price_list AS
SELECT product_name, price
FROM products;

-- Build a reusable view of only Delivered orders
CREATE VIEW view_delivered_orders AS
SELECT *
FROM orders
WHERE order_status = 'Delivered';

-- ==========================================================
-- 26. CREATE INDEX
-- ==========================================================

-- Speed up searches on product name
CREATE INDEX idx_product_name_p4
ON products(product_name);

-- Speed up searches on user email
CREATE INDEX idx_user_email_p4
ON users(email);

-- ==========================================================
-- 27. STORED PROCEDURE
-- ==========================================================

-- Create a procedure that lists all users
DELIMITER //

CREATE PROCEDURE sp_get_all_users()
BEGIN
    SELECT * FROM users;
END //

DELIMITER ;

-- Run the procedure just created
CALL sp_get_all_users();

-- ==========================================================
-- 28. TRIGGER
-- ==========================================================

-- Create a log table to record stock changes
CREATE TABLE IF NOT EXISTS stock_log_p4 (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    old_stock INT,
    new_stock INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Automatically log every stock change made to products
DELIMITER //

CREATE TRIGGER trg_log_stock_change
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO stock_log_p4(product_id, old_stock, new_stock)
    VALUES(OLD.product_id, OLD.stock, NEW.stock);
END //

DELIMITER ;

-- ==========================================================
-- 29. EVENT (SCHEDULED TASK)
-- ==========================================================

-- Automatically delete reviews older than 1 year, every month
CREATE EVENT IF NOT EXISTS ev_remove_old_reviews
ON SCHEDULE EVERY 1 MONTH
DO
DELETE FROM reviews
WHERE review_date < CURDATE() - INTERVAL 1 YEAR;

-- ==========================================================
-- 30. TRANSACTION (COMMIT / ROLLBACK)
-- ==========================================================

-- Safely place an order and update stock together, or undo both if one fails
START TRANSACTION;

UPDATE products
SET stock = stock - 1
WHERE product_id = 1;

INSERT INTO orders (user_id, order_date, total_amount, order_status)
VALUES (1, CURDATE(), 79999, 'Processing');

COMMIT;

-- ==========================================================
-- 31. WINDOW FUNCTION
-- ==========================================================

-- Rank products by price within each category
SELECT
    product_name,
    category_id,
    price,
    RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS price_rank
FROM products;

-- Show a running total of order amounts by order date
SELECT
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- ==========================================================
-- 32. UNION
-- ==========================================================

-- Combine product names and category names into a single list
SELECT product_name AS item_name FROM products
UNION
SELECT category_name AS item_name FROM categories;

-- ==========================================================
-- 33. FINAL BUSINESS REPORT
-- ==========================================================

-- Show a full snapshot of database size across every table
SELECT
    (SELECT COUNT(*) FROM users)      AS total_users,
    (SELECT COUNT(*) FROM products)   AS total_products,
    (SELECT COUNT(*) FROM categories) AS total_categories,
    (SELECT COUNT(*) FROM orders)     AS total_orders,
    (SELECT COUNT(*) FROM payments)   AS total_payments,
    (SELECT COUNT(*) FROM reviews)    AS total_reviews;

-- ==========================================================