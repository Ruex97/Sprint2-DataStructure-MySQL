INSERT INTO province (name)
VALUES  ('Barcelona'), 
		('Girona'), 
		('Tarragona'), 
		('Lleida');
        
INSERT INTO locality (name, province_province_id)
VALUES ('Sabadell', 1), ('Cerdanyola', 1), ('Barbera', 1), ('Hospitalet', 1), ('Mollerussa', 4), ('Lleida', 4);

INSERT INTO customers (first_name, last_name, address, postal_code, phone_number, locality_id)
VALUES  ('Xavi', 'Rue', 'Calle1Puerta1', '08206', '644555123', 2),
		('Marc', 'Rue', 'Calle2Puerta2', '08206', '644225123', 3),
        ('Elena', 'Vicente', 'Calle3Puerta3', '08206', '644225123', 5),
        ('Leo', 'Messi', 'Calle4Puerta4', '08206', '644225123', 4),
        ('Pol', 'Rue', 'Calle5Puerta5', '25206', '644225123', 6),
        ('Pere', 'Rue', 'Calle6Puerta6', '25206', '644225123', 6);

-- LAST        
INSERT INTO orders (date_time, delivery_or_pickup, delivery_date_time, quantity_burguers, quantity_pizzas, quantity_drinks, price, customer_id, restaurant_id, delivery_employee_id)
 VALUES  ('2022-01-01', 'pickup', NULL, '3', '1', '1','50', '7', 1, NULL),
		('2022-02-02', 'pickup', NULL, '3', '1', '2','50', '8', 1, NULL),
		('2022-03-03', 'pickup', NULL, NULL, '3', '3','50', '9', 1, NULL), 
		('2022-04-04', 'pickup', NULL, NULL, '3', '3','50', '10', 1, NULL), 
		('2022-05-05', 'pickup', NULL, NULL, '3', '3','50', '11', 2, NULL), 
		('2022-10-05', 'pickup', NULL, NULL, '3', '3','50', '12', 2, NULL); 
        

INSERT INTO restaurant (address, postal_code, locality_id)
VALUES ('Carrer Sabadell 8', '08206', '2'),
	   ('Carrer Lleida 80', '25002', '6');
       
       
INSERT INTO employee (first_name, last_name, nif, phone_number, job_type, restaurant_id)
VALUES  ('Carlos', 'Rodri', '49525287X', '655887744', 'delivery', '1'),
		('Ronaldinho', 'gaucho', '44725221H', '613245744', 'cook', '1'),
		('Roberto', 'Carlos', '49444287X', '655145844', 'waiter', '1'),
		('Julio', 'Maldini', '78925287X', '655662233', 'cook', '2'),
		('Andres', 'Iniesta', '98545287X', '655114477', 'waiter', '2');
        
INSERT INTO products (product_type, name, description, image, price, pizza_category_id)
VALUES ('pizza', 'carbonara', 'description1', 'image1', '15', '1'),
('pizza', 'bbq', 'description2', 'image2', '15', '1'),
('pizza', '4cheese', 'description3', 'image3', '15', '2'),
('pizza', '8cheese', 'description4', 'image4', '15', '2'),
('Burguer', 'pork', 'description5', 'image5', '15', NULL),
('Water', 'Fiji', 'description6', 'image6', '15', NULL);


INSERT INTO pizza_category (name)
VALUES ('Oferton del martes'), ('Edición verano');

INSERT INTO products_has_orders (products_product_id, orders_orders_id)
VALUE (7,14), (8,15), (9,16),(10,17), (11,18), (12,19);
      
      

