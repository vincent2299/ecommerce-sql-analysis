CREATE TABLE Customers (customer_id INT PRIMARY KEY, name VARCHAR(50), join_date DATE, country VARCHAR(50));
CREATE TABLE Orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, total_amount DECIMAL(10,2));
CREATE TABLE Products (product_id INT PRIMARY KEY, product_name VARCHAR(50), category VARCHAR(50), price DECIMAL(10,2));
CREATE TABLE Order_Items (order_id INT, product_id INT, quantity INT);

INSERT INTO Customers VALUES 
(1, 'Alice Smith', '2023-01-15', 'USA'), (2, 'Bob Jones', '2023-02-20', 'UK'),
(3, 'Charlie Brown', '2023-03-05', 'Canada'), (4, 'Diana Prince', '2023-03-12', 'USA');

INSERT INTO Products VALUES 
(101, 'Laptop', 'Electronics', 1200.00), (102, 'Smartphone', 'Electronics', 800.00),
(103, 'Desk Chair', 'Furniture', 150.00), (104, 'Coffee Table', 'Furniture', 250.00);

INSERT INTO Orders VALUES 
(1001, 1, '2023-04-10', 1200.00), (1002, 2, '2023-04-15', 950.00),
(1003, 1, '2023-05-20', 800.00), (1004, 3, '2023-05-22', 150.00),
(1005, 4, '2023-06-05', 1450.00);

INSERT INTO Order_Items VALUES 
(1001, 101, 1), (1002, 102, 1), (1002, 103, 1), 
(1003, 102, 1), (1004, 103, 1), (1005, 101, 1), (1005, 104, 1);
