-- ------------------ DQL -------------------
-- Show Discounts on all the books
SELECT Book_Name,
    Genre_Discount Discount
FROM book
    JOIN genre ON book.Book_Genre = genre.Genre_ID;
-- Show the total expenses on each supplier
SELECT Supplier_Name,
    Expense
FROM supplier
    NATURAL JOIN (
        SELECT Supplier_ID,
            sum(Buy_Cost) Expense
        FROM supplies
        GROUP BY Supplier_ID
    ) T;
-- Show total price of each customer's cart
SELECT Customer_Name,
    sum(Quantity * Book_Price) Cart_Value
FROM (
        customer
        NATURAL JOIN cart
    )
    NATURAL JOIN book
GROUP BY Customer_ID;
-- Show all the Delivered Orders 
SELECT *
FROM Orders
WHERE Order_Status = 'Delivered';
-- Show all the Customers who have not placed any order 
SELECT Customer_id,
    Customer_Name
FROM customer
WHERE Customer_ID NOT IN(
        SELECT Customer_ID
        FROM orders
    );
-- Show top 3 Delivery Partners in order of their rating 
SELECT *
FROM delivery_partner
ORDER BY Partner_Rating DESC
LIMIT 3;
-- Show all the Customers whose name end at 'e'
SELECT Customer_ID,
    Customer_Name
FROM customer
WHERE Customer_Name like '%e';
-- ---------------- DML ---------------------
-- 
UPDATE Genre
SET Genre_Discount = 20
WHERE Genre_Discount BETWEEN 10 AND 15;
-- 
DELETE FROM Orders
WHERE Order_Date < '2024-02-01';
-- 
UPDATE Admin
SET Admin_Password = 'newSecurePass'
WHERE Admin_ID = 3;
-- --------------- Database Constraints -------------------
-- -- NOT NULL 
-- INSERT INTO Supplier (
--         Supplier_ID,
--         Supplier_Name
--     )
-- VALUES (19, 'Arihant');
-- -- unique key 
-- INSERT INTO Customer (
--         Customer_ID,
--         Customer_Name,
--         Customer_Email,
--         Customer_Password,
--         Customer_Phone,
--         Customer_Address
--     )
-- VALUES (
--         100,
--         'sneha',
--         'alice@example.com',
--         'sn123',
--         '124-456-7890',
--         '123 MPS'
--     );
-- -- primary key 
-- INSERT INTO Admin (Admin_ID, Admin_Name, Admin_Password)
-- VALUES (1, 'Harsh', 'nopassword');
-- -- foreign key 
-- INSERT INTO Book (
--         Book_ID,
--         Book_Name,
--         Book_Author,
--         Book_Price,
--         Book_Genre,
--         Book_Rating
--     )
-- VALUES (29, 'naruto', 'kishimoto', 12, 7, 4.2);
-- -- Check 
-- INSERT INTO Cart (Customer_ID, Book_ID, Quantity)
-- VALUES (10, 6, 0);