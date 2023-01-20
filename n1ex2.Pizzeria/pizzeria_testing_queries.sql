USE pizzeria;
-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
SELECT SUM(o.quantity_drinks) AS drinks_sold, l.name AS city FROM orders o
JOIN restaurant r ON r.restaurant_id = o.restaurant_id
JOIN locality l ON r.locality_id = l.locality_id
WHERE l.name IN ('cerdanyola');


-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT o.orders_id, o.delivery_or_pickup, e.first_name, e.last_name FROM employee e 
JOIN restaurant r ON e.employee_id = r.restaurant_id 
JOIN orders o ON r.restaurant_id = o.restaurant_id
WHERE e.employee_id = '1';