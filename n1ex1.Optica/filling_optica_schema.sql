USE optica;

INSERT INTO address (street, number, flat, door, cp, country)
VALUES
('Montseny', '16', '4', '1', '08206', 'Spain'),
('Aneto', '26', '1', '4', '08205', 'Spain'),
('Rambla', '36', '1', '4', '08205', 'Spain'),
('Gran via', '76', '3', '1', '08203', 'Spain'),
('Blasco de Garay', '65', '4', '4', '08204', 'Spain'),
('Alemania', '62', '3', '2', '08202', 'Spain');

INSERT INTO suppliers (first_name, phone_number, fax, company_nif, address_id)
VALUES
('Gafastop', '644458525', '1234', '49874521X', '1'),
('GafasPlus', '644445612', '1254', '44874521W', '2'),
('4Ojos', '644452225', '1235', '45424521Q', '3'),
('Lupasparatodos', '644778525', '2234', '49234521U', '4'),
('gafasvip', '644455465', '1224', '45874562A', '5'),
('gafasbrutales', '621458525', '3234', '49774521T', '6');


INSERT INTO glasses (brand, crystal_graduation, mount_type, mount_colour, glass_colour, price, suppliers_id)
VALUES
('Rayban', '1.5', 'pasta', 'grey', 'blue', '65', '1'),
('Hawker', '2.5', 'pasta', 'grey', 'blue', '54', '2'),
('Tommy', '4.5', 'metalica', 'grey', 'blue', '65', '3'),
('Diesel', '1.5', 'metalica', 'grey', 'blue', '55', '4'),
('Polo', '2.5', 'flotant', 'grey', 'blue', '78', '5'),
('Zara', '1', 'flotant', 'grey', 'blue', '41', '6');

INSERT INTO sellers (first_name, last_name)
VALUES 
('Javier', 'Moreno'),
('Marina', 'sagues');

INSERT INTO customers (first_name, postal_address, phone_number, email, registration_date, affiliate_id, sellers_sellers_id)
VALUES 
('Xavi', '08206', '665555123', 'xavirue@gmail.com', '2022-05-05', '0','1'),
('Carlos', '08206', '664455123', 'carlos@gmail.com', '2022-06-05', '1','1'),
('Maria', '08206', '666655123', 'maria@gmail.com', '2022-08-05', '1','1'),
('Cristian', '08206', '677555123', 'cris@gmail.com', '2022-08-05', '1','1'),
('Joan', '08206', '665888123', 'joan@gmail.com', '2022-10-05', '3','1'),
('Dani', '08206', '665456123', 'dani@gmail.com', '2022-11-05', '0','1');

INSERT INTO sellings (selling_date, glasses_id, sellers_sellers_id, customers_customers_id)
VALUES
('2022-01-01', '1', '1', '1'),
('2022-01-01', '2', '2', '2'),
('2022-01-01', '3', '1', '3'),
('2022-01-01', '4', '1', '4'),
('2022-01-01', '4', '1', '5'),
('2022-01-01', '6', '2', '6');






