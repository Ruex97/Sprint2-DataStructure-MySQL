-- Lists a customer's total invoices in a given period.

SELECT * FROM customers 
WHERE registration_date 
BETWEEN '2022-05-05' AND '2022-09-05';

-- List the different models of glasses that an employee has sold during a year.

SELECT s.selling_date, s.glasses_id, g.brand, g.crystal_graduation, g.mount_type, g.price, s2.first_name, s2.last_name 
FROM sellings s
JOIN sellers s2
ON s.sellers_sellers_id = s2.sellers_id
JOIN glasses g
ON s.glasses_id = g.glasses_id
WHERE selling_date 
BETWEEN '2022-01-01' AND '2023-01-01';


-- List the different suppliers who have supplied glasses sold successfully by the optician.
SELECT su.suppliers_id, g.glasses_id, g.brand, g.price, s.selling_date, su.first_name
FROM glasses g
JOIN sellings s 
ON g.glasses_id = s.glasses_id
JOIN suppliers su
on g.suppliers_id = su.suppliers_id;


