CREATE DATABASE CakeManagement;
USE CakeManagement;

-- Table Users
CREATE TABLE tblUsers (
    userID VARCHAR(50) PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    roleID VARCHAR(15) NOT NULL
);

-- Table Orders
CREATE TABLE tblOrders (
    orderID INT IDENTITY(1,1) PRIMARY KEY, 
    userID VARCHAR(50),
    total DECIMAL(10,2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userID) REFERENCES tblUsers(userID) ON DELETE CASCADE
);

-- Table Products
CREATE TABLE tblProducts (
    productID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL
);

-- Table OrderDetails
CREATE TABLE tblOrderDetails (
    orderDetailID INT IDENTITY(1,1) PRIMARY KEY, 
    orderID INT,  
    productID VARCHAR(50),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES tblOrders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES tblProducts(productID) ON DELETE CASCADE
);


-- Sample data for Users
INSERT INTO tblUsers (userID, fullName, phone, password, roleID) VALUES
('manqb123', 'Nguyen Thi Man', '0979303544', 'manqb123', 'AD'),
('sangqb', 'Mai Quang Sang', '0912345678', 'sangqb', 'US'),
('phucqb2005', 'Pham Thanh Phuc', '0986345675', 'phucqb2005', 'US');

-- Sample data for Products
INSERT INTO tblProducts (productID, name, price, quantity) VALUES
('P001', 'Chocolate Cake', 16.00, 20),
('P002', 'Strawberry Cake', 14.80, 15),
('P003', 'Cheese Cake', 17.20, 10),
('P004', 'Tiramisu', 15.45, 8),
('P005', 'Red Velvet Cake', 20.50, 12),
('P006', 'Matcha Green Tea Cake', 15.5, 18),
('P007', 'Carrot Cake', 14.80, 10),
('P008', 'Lemon Drizzle Cake', 13.50, 14),
('P009', 'Black Forest Cake', 11.25, 9),
('P010', 'Mango Mousse Cake', 17.50, 11)

delete from tblOrders
delete from tblOrderDetails

DROP DATABASE CakeManagement; 