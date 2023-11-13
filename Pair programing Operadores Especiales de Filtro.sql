EJERCICIO 1

SELECT company_name, contact_name, city
FROM customers
WHERE city LIKE 'A_%'OR city LIKE 'B_%';

EJERCICIO 2

SELECT city, company_name, contact_name, COUNT(order_id)
FROM orders
INNER JOIN customers ON orders.customer_id =  customers.customer_id
GROUP BY city, company_name, contact_name
HAVING city LIKE 'L_%';


SELECT city, company_name, contact_name, COUNT(order_id)
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP by city, company_name, contact_name
HAVING city LIKE 'L_%';

EJERCICIO 3
SELECT contact_name, contact_title, company_name
FROM customers
WHERE contact_title NOT LIKE "%Sales%"

EJERCICIO 4
SELECT contact_name
FROM customers
WHERE contact_name NOT LIKE "_a%"

EJERCICIO 5
SELECT city, company_name, contact_name, "Customer" AS "Relationship"
FROM customers
UNION
SELECT city, company_name, contact_name, "Suppliers" AS "Relationship"
FROM suppliers

EJERCICIO 6
SELECT *
FROM categories
WHERE description LIKE "%sweet%" OR "%Sweet%"

EJERCICIO 7 (Además hemos incluido una columna para saber qué son)
SELECT CONCAT(first_name, " ",last_name) AS "Nombre_completo", "Empleado" AS "Puesto"
FROM employees
UNION 
SELECT contact_name AS "Nombre_completo", "Cliente" AS "Puesto"
FROM customers



