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
    orderID VARCHAR(50) PRIMARY KEY,
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
    orderDetailID VARCHAR(50) PRIMARY KEY,
    orderID VARCHAR(50),
    productID VARCHAR(50),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (orderID) REFERENCES tblOrders(orderID) ON DELETE CASCADE,
    FOREIGN KEY (productID) REFERENCES tblProducts(productID) ON DELETE CASCADE
);

-- Sample data for Users
INSERT INTO tblUsers (userID, fullName, phone, password, roleID) VALUES
('U001', 'Nguyen Van A', '0987654321', 'password123', 'AD'),
('U002', 'Tran Thi B', '0912345678', 'password456', 'US'),
('U003', 'Le Van C', '0934567890', 'password789', 'US');

-- Sample data for Products
INSERT INTO tblProducts (productID, name, price, quantity) VALUES
('P001', 'Chocolate Cake', 150000.00, 20),
('P002', 'Strawberry Cake', 120000.00, 15),
('P003', 'Cheese Cake', 180000.00, 10),
('P004', 'Tiramisu', 200000.00, 8),
('P005', 'Red Velvet Cake', 170000.00, 12),
('P006', 'Matcha Green Tea Cake', 160000.00, 18),
('P007', 'Carrot Cake', 140000.00, 10),
('P008', 'Lemon Drizzle Cake', 130000.00, 14),
('P009', 'Black Forest Cake', 190000.00, 9),
('P010', 'Mango Mousse Cake', 175000.00, 11),
('P011', 'Opera Cake', 210000.00, 7),
('P012', 'Blueberry Cheesecake', 185000.00, 13);


DROP DATABASE CakeManagement;