INSERTING DATA


USE Pizzeria;


INSERT INTO province (name) VALUES
('California'),
('Texas'),
('New York');


INSERT INTO city (name, id_province) VALUES
('Los Angeles', 1),
('San Francisco', 1),
('Houston', 2),
('Dallas', 2),
('New York City', 3);


INSERT INTO customer (first_name, last_name, address, postal_code, id_city, phone) VALUES
('John', 'Smith', '123 Main St', '90001', 1, '555-1234'),
('Emily', 'Johnson', '45 Pine Ave', '94102', 2, '555-5678'),
('Michael', 'Brown', '78 Market St', '77001', 3, '555-8765'),
('Sarah', 'Davis', '98 Elm Rd', '75201', 4, '555-3344'),
('David', 'Wilson', '200 Broadway', '10007', 5, '555-9999');


INSERT INTO store (address, postal_code, id_city) VALUES
('500 Sunset Blvd', '90026', 1),
('150 Market St', '94105', 2),
('100 Main Plaza', '77002', 3);


INSERT INTO employee (first_name, last_name, nif, phone, role, id_store) VALUES
('Anna', 'Lopez', 'A12345678', '555-1111', 'cook', 1),
('Mark', 'Evans', 'B98765432', '555-2222', 'delivery', 1),
('Laura', 'Bennett', 'C87654321', '555-3333', 'cook', 2),
('Tom', 'Garcia', 'D76543210', '555-4444', 'delivery', 2),
('Peter', 'Clark', 'E65432109', '555-5555', 'cook', 3),
('Linda', 'Miller', 'F54321098', '555-6666', 'delivery', 3);


INSERT INTO category (name) VALUES
('Classic Pizzas'),
('Special Pizzas'),
('Vegan Pizzas');

INSERT INTO product (name, description, image, price, type, id_category) VALUES
('Margherita', 'Tomato, mozzarella, basil', 'margherita.jpg', 8.50, 'pizza', 1),
('Pepperoni', 'Tomato, mozzarella, pepperoni', 'pepperoni.jpg', 9.50, 'pizza', 1),
('BBQ Chicken', 'BBQ sauce, chicken, onion', 'bbqchicken.jpg', 10.00, 'pizza', 2),
('Vegan Delight', 'Vegan cheese, veggies', 'vegan.jpg', 9.00, 'pizza', 3),
('Cheeseburger', 'Beef, cheese, lettuce, tomato', 'burger.jpg', 7.00, 'burger', NULL),
('Cola', '330ml can', 'cola.jpg', 2.00, 'drink', NULL),
('Water', '500ml bottle', 'water.jpg', 1.50, 'drink', NULL);

INSERT INTO orders (date_time, delivery_type, total, id_customer, id_store, id_delivery_person, delivery_date_time) VALUES
('2025-10-10 18:30:00', 'home', 20.00, 1, 1, 2, '2025-10-10 19:00:00'),
('2025-10-11 12:15:00', 'store', 17.50, 2, 2, NULL, NULL),
('2025-10-12 20:45:00', 'home', 25.00, 3, 3, 6, '2025-10-12 21:20:00'),
('2025-10-13 13:10:00', 'store', 10.00, 4, 1, NULL, NULL),
('2025-10-13 19:45:00', 'home', 30.00, 5, 2, 4, '2025-10-13 20:15:00');

INSERT INTO order_product (id_order, id_product, quantity) VALUES
(1, 1, 1),
(1, 6, 2),
(2, 2, 1),
(2, 7, 2),
(3, 3, 2),
(3, 6, 1),
(4, 5, 1),
(5, 4, 1),
(5, 6, 2),
(5, 7, 1);



QUERIES:

SELECT 
    ci.name AS city,
    SUM(op.quantity) AS total_drinks_sold
FROM order_product op
JOIN product p ON op.id_product = p.id_product
JOIN orders o ON op.id_order = o.id_order
JOIN store s ON o.id_store = s.id_store
JOIN city ci ON s.id_city = ci.id_city
WHERE p.type = 'drink'
  AND ci.name = 'Los Angeles'
GROUP BY ci.name;


SELECT 
    e.first_name,
    e.last_name,
    COUNT(o.id_order) AS total_orders_handled
FROM employee e
LEFT JOIN orders o ON e.id_employee = o.id_delivery_person
WHERE e.first_name = 'Mark' AND e.last_name = 'Evans'
GROUP BY e.id_employee;
