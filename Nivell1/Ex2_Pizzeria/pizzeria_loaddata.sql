use pizzeria;
INSERT INTO province VALUES
(8, 'Barcelona'),(17, 'Girona'),(25, 'Lleida'),(43, 'Tarragona');

INSERT INTO city (city_name, province_id) VALUES
('Barcelona', 8), ('Girona', 17),('Lleida', 25),('Tarragona', 43),
('Vilanova i la Geltrú', 8), ('Salt', 17),('Balaguer', 25),('Reus', 43),
('Vic', 8), ('Roses', 17),('Tremp', 25),('Salou', 43);

INSERT INTO customer (name, surname, address, phone, city_id) VALUES
('Joan', 'Garriga', 'Diputació, 365, 4t 1a', '666666666', 1),
('Anna', 'Vidal', 'Diputació, 366, 4t 1a', '677777777', 2),
('Albert', 'Font', 'Prat de la Riba, 365, 4t 3a', '666666666', 3),
('Robert', 'Amat', 'Rambla nova, 12, 1r 1a', '666666666', 1);

INSERT INTO store (address, zip_code, city_id) VALUES
('Passeig Sant Joan, 43', '08010', 1),
('Major, 46', '17002', 2),
('Passeig Ronda, 23', '25003', 3),
('Rambla Nova, 56', '43003', 4);

INSERT INTO employee (name, surname, nif, phone, position, store_id) VALUES
('Gwenael', 'Le Moing', '12345678A', '936666666', 'Cook', 1),
('Maria', 'Inglés', '13345678B', '935666666', 'Deliverer', 1),
('Camilo', 'Rodríguez', '12345458Z', '937866666', 'Deliverer', 2),
('Emma', 'Álvarez', '12345445Y', '667866666', 'Cook', 2),
('Alfredo', 'Pico', '16645458Z', '977866666', 'Deliverer', 3),
('Xènia', 'Mila', '12305458D', '677866666', 'Deliverer', 4);

INSERT INTO pizza_category (name) VALUES
('Pizzes de tardor', 'Pizzes Oferta', 'Pizzes clássiques');

INSERT INTO product (name, description, image_path, price, product_type, pizza_category_id) VALUES
('Margarita', 'Tomàquet i mozzarela', 'path/margarita.jpg', 9.99, 'Pizza', 3),
('Tardor', 'Bolets, pernil dolç, Tomàquet', 'path/tardor.jpg', 11.99, 'Pizza', 1),
('Haloween', 'Carbassa i mozzarela', 'path/haloween.jpg', 12.99, 'Pizza', 1),
('Quatre estacions', 'Verdures, tomàquet i mozzarela', 'path/quatreestaions.jpg', 10.99, 'Pizza', 3),
('Quatre formatges', 'Blau, emental, cabra i mozzarel·la', 'path/quatreformatges.jpg', 9.99, 'Pizza', 2),
('Hawaiana', 'Pernil dolç, pinya i tomàquet', 'path/hawaiana.jpg', 9.99, 'Pizza', 2),
('Cheese', 'vedella, formatge i ceba', 'path/cheese.jpg', 13.99, 'Hamburguesa', null),
('Vegana', 'Seitan, formatge vegà i tomàquet', 'path/vegana.jpg', 11.99, 'Hamburguesa', null),
('Pollastre', 'Pollastre, formatge i quètxup', 'path/pollastre.jpg', 9.99, 'Hamburguesa', null),
('Coca cola', 'Coca cola zero', 'path/cocacola.jpg', 1.99, 'Beguda', null),
('Aigua mineral', 'Aigual mineral del Montseny', 'path/aigua.jpg', 1.99, 'Beguda', null),
('Cervesa', 'Estrella Damn', 'path/estrella.jpg', 2.50, 'Beguda', null);

INSERT INTO pizzeria.order (customer_id, order_datetime, delivery_type, amount, city_id, store_id) VALUES
(1, '2024-10-01 16:56:56', 'HOME', 11.99, 1, 1),
(4, '2024-10-03 16:56:56', 'HOME', 12.99, 1, 1),
(4, '2024-10-01 16:56:56', 'HOME', 11.99, 1, 1),
(2, '2024-10-03 16:56:56', 'HOME', 12.99, 2, 2),
(3, '2024-10-13 16:56:56', 'HOME', 9.99, 3, 3),
(3, '2024-10-08 16:56:56', 'STORE', 12.99, 3, 3),
(2, '2024-10-05 16:56:56', 'HOME', 9.99, 2, 2),
(2, '2024-10-15 16:56:56', 'STORE', 11.98, 2, 2),
(1, '2024-10-12 14:56:56', 'STORE', 18.99, 1, 1);

INSERT INTO order_details (quantity, order_id, product_id) VALUES
(1, 1, 26), (1, 2, 27), (1, 3, 32), (1, 4, 27), (1, 5, 29),
(1, 6, 27), (1, 7, 25), (1, 8, 25), (1, 8, 34), (1, 9, 31), (2, 9, 36);

INSERT INTO order_delivery (delivered_on, order_id, employee_id) VALUES
('2024-10-01 17:56:56', 1, 2),
('2024-10-03 17:56:56', 2, 2),
('2024-10-01 16:56:56', 3, 2),
('2024-10-03 17:56:56', 4, 3),
('2024-10-13 16:56:56', 5, 5),
('2024-10-05 16:56:56', 7, 3);

SELECT c.city_name, sum(od.quantity)
FROM order_details od JOIN product p ON od.product_id = p.product_id
JOIN pizzeria.order o ON o.order_id = od.order_id
JOIN city c ON o.city_id = c.city_id
WHERE p.product_type = 'Beguda'
group by c.city_name having c.city_name = 'Barcelona';

SELECT e.name, e.surname, count(*) as ComandesLliurades
FROM pizzeria.order o JOIN order_delivery od ON o.order_id = od.order_id
JOIN employee e ON od.employee_id = e.employee_id
WHERE e.employee_id = 2
GROUP BY e.name, e.surname