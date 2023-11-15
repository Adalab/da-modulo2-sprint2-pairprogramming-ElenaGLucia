EJERCICIO 1 

WITH clientes AS (SELECT customer_id, company_name
 FROM CUSTOMERS)
SELECT *
FROM clientes

EJERCICIO 2

Incorporamos dos opciones: la que se ve el pais y la que no
WITH clientes_PAIS AS (
SELECT customer_id, company_name, country
	FROM customers    
)
SELECT *
FROM clientes_pais
WHERE country = 'Germany'

WITH clientes_PAIS AS (
SELECT customer_id, company_name, country
	FROM customers    
)
SELECT customer_id, company_name
FROM clientes_pais
WHERE country = 'Germany'

EJERCICIO 3
WITH tabla AS (SELECT * 
FROM orders
NATURAL JOIN customers)
SELECT customer_id, company_name, order_id, order_date
FROM tabla

EJERCICIO 4
WITH tabla AS (SELECT * 
FROM orders
NATURAL JOIN customers)
SELECT customer_id, company_name, COUNT(order_id)
FROM tabla
GROUP BY  customer_id, company_name


EJERCICIO 5
WITH cantidas AS
(SELECT product_name, 
FROM products


