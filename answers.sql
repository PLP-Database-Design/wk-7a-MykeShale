-- 1. Question 1

The ProductDetail table is not in 1NF because the Products column contains multiple values separated by commas. In 1NF, each field must hold only a single value.

To transform it, you need to:

Create separate rows for each product.

Maintain the OrderID and CustomerName for each product.

SQL Query for 1NF Transformation:

-- Creating the 1NF structure
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Inserting data into the new 1NF table
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');





-- 2. Question 2
Achieving 2NF (Second Normal Form)
The OrderDetails table is in 1NF but not in 2NF because:

CustomerName is dependent only on OrderID, which is part of a composite key (OrderID, Product). This is a partial dependency.

To achieve 2NF:

Separate CustomerName into its own table, linking it with OrderID.

Remove the partial dependency.

SQL Queries for 2NF Transformation:
Step 1: Create the Orders table to store customer information.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Populate the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');


Step 2: Create the OrderProducts table to store product and quantity details.
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Populate the OrderProducts table
INSERT INTO OrderProducts (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);


