
USE OpticalShop;

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


