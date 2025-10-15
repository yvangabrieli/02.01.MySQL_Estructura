
CREATE DATABASE OpticalShop;
USE OpticalShop;

CREATE TABLE Addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    number VARCHAR(20),
    floor VARCHAR(20),
    door VARCHAR(20),
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20),
    country VARCHAR(50) NOT NULL
);

CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address_id INT,
    phone VARCHAR(30),
    fax VARCHAR(30),
    tax_id VARCHAR(30),
    FOREIGN KEY (address_id) REFERENCES Addresses(id)
);

CREATE TABLE Frame_Types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('floating','plastic','metal') NOT NULL
);

CREATE TABLE Brands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id)
);

CREATE TABLE Glasses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    lens_prescription VARCHAR(50),
    frame_type_id INT NOT NULL,
    frame_color VARCHAR(50),
    lens_color VARCHAR(50),
    price DECIMAL(10,2),
    FOREIGN KEY (brand_id) REFERENCES Brands(id),
    FOREIGN KEY (frame_type_id) REFERENCES Frame_Types(id)
);

CREATE TABLE Clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address_id INT,
    phone VARCHAR(30),
    email VARCHAR(100),
    registration_date DATE,
    recommended_by INT,
    FOREIGN KEY (address_id) REFERENCES Addresses(id),
    FOREIGN KEY (recommended_by) REFERENCES Clients(id)
);

CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    employee_id INT NOT NULL,
    glasses_id INT NOT NULL,
    date DATE,
    price DECIMAL(10,2),
    FOREIGN KEY (client_id) REFERENCES Clients(id),
    FOREIGN KEY (employee_id) REFERENCES Employees(id),
    FOREIGN KEY (glasses_id) REFERENCES Glasses(id)
);

INSERT INTO Addresses (street, number, city, postal_code, country)
VALUES 
('Main Street', '12', 'Barcelona', '08001', 'Spain'),
('Gran Via', '45', 'Madrid', '28013', 'Spain'),
('High Street', '88', 'London', 'SW1A1AA', 'UK');

INSERT INTO Suppliers (name, address_id, phone, fax, tax_id)
VALUES 
('VisionPro Ltd', 1, '+34 912345678', '+34 912345679', 'ES12345678A'),
('OptiWorld', 2, '+34 934567890', '+34 934567891', 'ES87654321B');

INSERT INTO Frame_Types (type_name)
VALUES ('floating'), ('plastic'), ('metal');
		
INSERT INTO Brands (name, supplier_id)
VALUES 
('RayView', 1),
('ClearSight', 2);

INSERT INTO Glasses (brand_id, lens_prescription, frame_type_id, frame_color, lens_color, price)
VALUES 
(1, '1.25/0.75', 3, 'black', 'blue', 120.50),
(2, '0.00/0.00', 2, 'red', 'clear', 95.00);

INSERT INTO Clients (name, address_id, phone, email, registration_date)
VALUES 
('Anna Lopez', 1, '+34 678123456', 'anna@example.com', '2024-01-12'),
('John Smith', 3, '+44 7123456789', 'john@example.com', '2024-02-05');

INSERT INTO Employees (name)
VALUES ('Maria Garcia'), ('David Jones');

INSERT INTO Sales (client_id, employee_id, glasses_id, date, price)
VALUES 
(1, 1, 1, '2024-03-10', 120.50),
(2, 2, 2, '2024-03-12', 95.00);


Queries 

Total invoices of a client in a period:

SELECT 
    c.name AS Client,
    COUNT(s.id) AS Total_Sales,
    SUM(s.price) AS Total_Amount
FROM Sales s
JOIN Clients c ON s.client_id = c.id
WHERE s.date BETWEEN '2024-01-01' AND '2024-12-31' AND c.name = 'Anna Lopez'
GROUP BY c.id;


Different glasses sold by an employee in a year:

SELECT 
    e.name AS Employee,
    g.brand_id,
    COUNT(s.id) AS Glasses_Sold
FROM Sales s
JOIN Employees e ON s.employee_id = e.id
JOIN Glasses g ON s.glasses_id = g.id
WHERE YEAR(s.date) = 2024 AND e.name = 'Maria Garcia'
GROUP BY e.id, g.brand_id;


Different suppliers that supplied glasses sold successfully:

SELECT DISTINCT 
    sup.name AS Supplier
FROM Sales s
JOIN Glasses g ON s.glasses_id = g.id
JOIN Brands b ON g.brand_id = b.id
JOIN Suppliers sup ON b.supplier_id = sup.id;


