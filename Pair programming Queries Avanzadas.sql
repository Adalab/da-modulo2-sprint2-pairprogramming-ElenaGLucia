SELECT 
MAX(unit_price) AS highestPrice, 
MIN(unit_price) AS lowestPrice 
FROM products;

SELECT AVG(unit_price), SUM(units_in_stock)
FROM products;

SELECT MIN(freight)
FROM orders
GROUP BY ship_country
HAVING ship_country = "UK";

SELECT MAX(freight), ship_country
FROM orders
GROUP BY ship_country
HAVING ship_country = "UK";

SELECT AVG(unit_price) AS "precio_medio"
FROM products;


SELECT DISTINCT product_name
FROM products
WHERE unit_price > 28.866363636363637;


SELECT product_name
FROM products
WHERE discontinued = 1;

SELECT product_id, product_name
FROM products
WHERE discontinued = 0
ORDER BY product_id DESC
LIMIT 10;

SELECT  employee_id,
COUNT(order_id),
MAX(freight)
FROM orders
GROUP BY employee_id;


SELECT employee_id, 
	COUNT(order_id),  
	MAX(freight),
    DATE_FORMAT(shipped_date, '%Y') as año
FROM orders
WHERE DATE_FORMAT(shipped_date, '%Y')  = 0000
GROUP BY employee_id, año;


SELECT
  DATE_FORMAT(order_date, '%d') as dia,
  DATE_FORMAT(order_date, '%m') as mes,
  DATE_FORMAT(order_date, '%Y') as año,
  COUNT(order_id)
FROM
  orders
GROUP BY
  dia, mes, año
ORDER BY
  año, mes, dia;


SELECT  
  DATE_FORMAT(order_date, '%m') as mes,
  DATE_FORMAT(order_date, '%Y') as año,
  COUNT(order_id)
FROM
  orders
GROUP BY
  mes, año
ORDER BY
  año, mes;
  
SELECT city,COUNT(employee_id)
FROM employees
GROUP BY
city
HAVING COUNT(employee_id) >= 4;

ALTER TABLE order_details
ADD COLUMN cantidad_monetaria FLOAT; 
UPDATE order_details
SET cantidad_monetaria = unit_price * quantity;

SELECT cantidad_monetaria, product_id,
CASE
	WHEN cantidad_monetaria < 2000 THEN "Bajo"
	ELSE  "Alto"
	END AS "clasificacion"
FROM order_details;








  

