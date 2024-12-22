DROP DATABASE IF EXISTS ReadIt;
CREATE DATABASE ReadIt;
USE ReadIt;
set NAMES utf8;
set character set utf8;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Delivery_Partner;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Order_items;
-- -----------------------------------------------------TABLES-----------------------------------------------------
CREATE TABLE Customer(
    Customer_ID int NOT NULL PRIMARY KEY,
    Customer_Name varchar(45) NOT NULL,
    Customer_Email varchar(45) UNIQUE,
    Customer_Password varchar(45) NOT NULL,
    Customer_Phone char(12) NOT NULL,
    Customer_Address varchar(45) NOT NULL
);
INSERT INTO Customer (
        Customer_ID,
        Customer_Name,
        Customer_Email,
        Customer_Password,
        Customer_Phone,
        Customer_Address
    )
VALUES (
        1,
        'Alice',
        'alice@example.com',
        'alice123',
        '123-456-7890',
        '123 Main St'
    ),
    (
        2,
        'Bob',
        'bob@example.com',
        'bob456',
        '456-789-0123',
        '456 Elm St'
    ),
    (
        3,
        'Charlie',
        'charlie@example.com',
        'charlie789',
        '789-012-3456',
        '789 Oak St'
    ),
    (
        4,
        'David',
        'david@example.com',
        'david@123',
        '012-345-6789',
        '012 Pine St'
    ),
    (
        5,
        'Eva',
        'eva@example.com',
        'eva456',
        '345-678-9012',
        '345 Maple St'
    ),
    (
        6,
        'Frank',
        'frank@example.com',
        'frank789',
        '678-901-2345',
        '678 Cedar St'
    ),
    (
        7,
        'Grace',
        'grace@example.com',
        'grace@123',
        '901-234-5678',
        '901 Birch St'
    ),
    (
        8,
        'Hannah',
        'hannah@example.com',
        'hannah456',
        '234-567-8901',
        '234 Spruce St'
    ),
    (
        9,
        'Ian',
        'ian@example.com',
        'ian789',
        '567-890-1234',
        '567 Walnut St'
    ),
    (
        10,
        'Julia',
        'julia@example.com',
        'julia@123',
        '890-123-4567',
        '890 Fir St'
    );
CREATE TABLE Admin(
    Admin_ID int NOT NULL PRIMARY KEY,
    Admin_Name varchar(45) NOT NULL,
    Admin_Password varchar(45) NOT NULL
);
INSERT INTO Admin (Admin_ID, Admin_Name, Admin_Password)
VALUES (1, 'JohnDoe', 'jd@123'),
    (2, 'Admin123', 'securePass'),
    (3, 'SuperUser', 'superPass'),
    (4, 'Admin4', 'password123'),
    (5, 'Admin5', 'adminPass123'),
    (6, 'JaneSmith', 'js@456'),
    (7, 'Admin7', 'adminPass'),
    (8, 'Admin8', 'securePassword'),
    (9, 'Admin9', 'admin123'),
    (10, 'Admin10', 'password456');
CREATE TABLE Genre(
    Genre_ID int NOT NULL PRIMARY KEY,
    Genre_Name varchar(45) NOT NULL,
    Genre_Discount int NOT NULL DEFAULT 0,
    CHECK (Genre_Discount >= 0)
);
-- Inserting sample records into Genre table
INSERT INTO Genre (Genre_ID, Genre_Name, Genre_Discount)
VALUES (1, 'Fiction', 10),
    (2, 'Science Fiction', 15),
    (3, 'Mystery', 5),
    (4, 'Thriller', 8),
    (5, 'Romance', 12);
CREATE TABLE Book(
    Book_ID int NOT NULL PRIMARY KEY,
    Book_Name varchar(45) NOT NULL,
    Book_Author varchar(45) NOT NULL,
    Book_Price int NOT NULL,
    Book_Genre int NOT NULL,
    Book_Rating Decimal NOT NULL DEFAULT 0,
    CHECK (Book_Price >= 0),
    CHECK (
        Book_Rating >= 0
        AND Book_Rating <= 5
    ),
    FOREIGN KEY (Book_Genre) REFERENCES Genre(Genre_ID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Book (
        Book_ID,
        Book_Name,
        Book_Author,
        Book_Price,
        Book_Genre,
        Book_Rating
    )
VALUES (
        1,
        'To Kill a Mockingbird',
        'Harper Lee',
        15,
        1,
        4.5
    ),
    (2, '1984', 'George Orwell', 12, 2, 4.2),
    (3, 'The Da Vinci Code', 'Dan Brown', 18, 3, 4.0),
    (
        4,
        'The Girl with the Dragon Tattoo',
        'Stieg Larsson',
        20,
        4,
        4.3
    ),
    (
        5,
        'Pride and Prejudice',
        'Jane Austen',
        10,
        5,
        4.7
    ),
    (
        6,
        'The Catcher in the Rye',
        'J.D. Salinger',
        14,
        1,
        4.1
    ),
    (
        7,
        'Brave New World',
        'Aldous Huxley',
        16,
        2,
        4.4
    ),
    (8, 'Gone Girl', 'Gillian Flynn', 19, 3, 4.6),
    (
        9,
        'The Silence of the Lambs',
        'Thomas Harris',
        22,
        4,
        4.8
    ),
    (10, 'Jane Eyre', 'Charlotte Brontë', 11, 5, 4.2),
    (
        11,
        'The Great Gatsby',
        'F. Scott Fitzgerald',
        13,
        1,
        4.0
    ),
    (12, 'Dune', 'Frank Herbert', 17, 2, 4.5),
    (
        13,
        'The Hound of the Baskervilles',
        'Arthur Conan Doyle',
        21,
        3,
        4.3
    ),
    (
        14,
        'Gone with the Wind',
        'Margaret Mitchell',
        24,
        4,
        4.9
    ),
    (
        15,
        'Wuthering Heights',
        'Emily Brontë',
        9,
        5,
        4.6
    ),
    (16, 'Catch-22', 'Joseph Heller', 15, 1, 4.1),
    (17, 'The Hobbit', 'J.R.R. Tolkien', 18, 2, 4.7),
    (18, 'The Shining', 'Stephen King', 20, 3, 4.2),
    (
        19,
        'Jurassic Park',
        'Michael Crichton',
        23,
        4,
        4.5
    ),
    (20, 'Anna Karenina', 'Leo Tolstoy', 26, 5, 4.8);
CREATE TABLE Supplier(
    Supplier_ID int NOT NULL PRIMARY KEY,
    Supplier_Name varchar(45) NOT NULL,
    Supplier_Email varchar(45) UNIQUE,
    Supplier_Phone char(12) NOT NULL
);
INSERT INTO Supplier (
        Supplier_ID,
        Supplier_Name,
        Supplier_Email,
        Supplier_Phone
    )
VALUES (
        1,
        'ABC Suppliers',
        'abc@example.com',
        '123-456-7890'
    ),
    (
        2,
        'XYZ Distributors',
        'xyz@example.com',
        '456-789-0123'
    ),
    (
        3,
        'Global Books Inc.',
        'global@example.com',
        '789-012-3456'
    ),
    (
        4,
        'Bookworld Enterprises',
        'bookworld@example.com',
        '012-345-6789'
    ),
    (
        5,
        'QuickPrint Publishers',
        'quickprint@example.com',
        '345-678-9012'
    ),
    (
        6,
        'PrintExpress Ltd.',
        'printexpress@example.com',
        '678-901-2345'
    ),
    (
        7,
        'BookMaster Inc.',
        'bookmaster@example.com',
        '901-234-5678'
    ),
    (
        8,
        'Novel Supplies Co.',
        'novel@example.com',
        '234-567-8901'
    ),
    (
        9,
        'BestBooks Wholesalers',
        'bestbooks@example.com',
        '567-890-1234'
    ),
    (
        10,
        'Bookshelf Ltd.',
        'bookshelf@example.com',
        '890-123-4567'
    );
CREATE TABLE Supplies(
    Supplier_ID int NOT NULL,
    Book_ID int NOT NULL,
    Date_Supplied date NOT NULL,
    Book_Quantity int NOT NULL DEFAULT 0,
    Buy_Cost int NOT NULL DEFAULT 0,
    PRIMARY KEY (Supplier_ID, Book_ID, Date_Supplied),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (Book_Quantity >= 0),
    CHECK (Buy_Cost >= 0)
);
INSERT INTO Supplies (
        Supplier_ID,
        Book_ID,
        Date_Supplied,
        Book_Quantity,
        Buy_Cost
    )
VALUES (1, 2, '2024-02-10', 100, 500),
    (1, 1, '2024-02-10', 100, 500),
    (2, 2, '2024-02-10', 75, 600),
    (3, 3, '2024-02-10', 50, 700),
    (4, 4, '2024-02-10', 125, 550),
    (4, 5, '2024-02-10', 90, 650),
    (6, 6, '2024-02-10', 110, 520),
    (7, 7, '2024-02-10', 80, 620),
    (8, 8, '2024-02-10', 70, 590),
    (9, 9, '2024-02-10', 95, 580),
    (10, 10, '2024-02-10', 120, 530);
CREATE TABLE Delivery_Partner(
    Partner_ID int NOT NULL PRIMARY KEY,
    Partner_Name varchar(45) NOT NULL,
    Partner_Email varchar(45) UNIQUE,
    Partner_Phone char(12) NOT NULL,
    Partner_Password varchar(45) NOT NULL,
    Partner_Rating double DEFAULT 0
);
INSERT INTO Delivery_Partner (
        Partner_ID,
        Partner_Name,
        Partner_Email,
        Partner_Phone,
        Partner_Password,
        Partner_Rating
    )
VALUES (
        1,
        'John Smith',
        'john@example.com',
        '123-456-7890',
        'john@123',
        4.5
    ),
    (
        2,
        'Emma Johnson',
        'emma@example.com',
        '456-789-0123',
        'emma456',
        4.2
    ),
    (
        3,
        'Michael Brown',
        'michael@example.com',
        '789-012-3456',
        'michael@789',
        4.8
    ),
    (
        4,
        'Sarah Davis',
        'sarah@example.com',
        '012-345-6789',
        'sarah123',
        4.3
    ),
    (
        5,
        'David Wilson',
        'david@example.com',
        '345-678-9012',
        'david456',
        4.7
    ),
    (
        6,
        'Jennifer Martinez',
        'jennifer@example.com',
        '678-901-2345',
        'jennifer@789',
        4.1
    ),
    (
        7,
        'James Taylor',
        'james@example.com',
        '901-234-5678',
        'james123',
        4.6
    ),
    (
        8,
        'Lisa Thomas',
        'lisa@example.com',
        '234-567-8901',
        'lisa456',
        4.4
    ),
    (
        9,
        'Robert Garcia',
        'robert@example.com',
        '567-890-1234',
        'robert@789',
        4.9
    ),
    (
        10,
        'Emily Rodriguez',
        'emily@example.com',
        '890-123-4567',
        'emily123',
        4.0
    );
CREATE TABLE Cart(
    Customer_ID int NOT NULL,
    Book_ID int NOT NULL,
    Quantity int NOT NULL,
    PRIMARY KEY (Customer_ID, Book_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (Quantity >= 1)
);
INSERT INTO Cart (Customer_ID, Book_ID, Quantity)
VALUES (1, 1, 2),
    (1, 2, 1),
    (1, 3, 3),
    (2, 4, 2),
    (2, 5, 1),
    (3, 6, 2),
    (3, 7, 1),
    (4, 8, 3),
    (4, 9, 2),
    (5, 10, 1),
    (6, 11, 2),
    (6, 12, 1),
    (7, 13, 3),
    (8, 14, 2),
    (9, 15, 1);
CREATE TABLE Orders(
    Order_ID int NOT NULL,
    Customer_ID int NOT NULL,
    Delivery_Partner_ID int,
    Order_Status varchar(45) NOT NULL,
    Order_Total int NOT NULL DEFAULT 0,
    Delivery_Cost int NOT NULL DEFAULT 0,
    Order_Date date NOT NULL,
    PRIMARY KEY (Order_ID, Customer_ID),
    FOREIGN KEY (Delivery_Partner_ID) REFERENCES Delivery_Partner(Partner_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (Order_Total >= 0)
);
INSERT INTO Orders (
        Order_ID,
        Customer_ID,
        Delivery_Partner_ID,
        Order_Status,
        Order_Total,
        Delivery_Cost,
        Order_Date
    )
VALUES (1, 1, 1, 'Processing', 30, 5, '2024-02-10'),
    (2, 2, 2, 'Dispatched', 12, 4, '2024-02-10'),
    (3, 1, 3, 'Delivered', 54, 7, '2024-02-10'),
    (4, 4, 4, 'Processing', 40, 6, '2024-02-10'),
    (5, 5, 5, 'Processing', 22, 5, '2024-02-10');
CREATE TABLE Order_items(
    Order_ID int NOT NULL,
    Book_ID int NOT NULL,
    Quantity int NOT NULL DEFAULT 0,
    PRIMARY KEY (Order_ID, Book_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (Quantity >= 0)
);
INSERT INTO Order_items (Order_ID, Book_ID, Quantity)
VALUES (1, 1, 2),
    (1, 2, 1),
    (2, 3, 3),
    (2, 4, 2),
    (3, 5, 1),
    (3, 6, 2),
    (4, 7, 1),
    (4, 8, 3),
    (5, 9, 2),
    (5, 10, 1);
SHOW TABLES;
--  DESC all tables ; 
DESC Customer;
DESC Admin;
DESC Genre;
DESC book;
DESC cart;
DESC Supplier;
DESC Supplies;
DESC Delivery_Partner;
DESC Orders;
DESC Order_items;