USE `queries básicas`;

-- 1. cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
SELECT `customers`.`company_name`, `customers`.`customer_id`, COUNT(`customers`.`customer_id`) AS "N.Pedidos"
FROM `customers`
NATURAL JOIN  `orders`
Where `customers`.`country` = "UK"
GROUP BY `customers`.`customer_id`;

-- 2. Productos pedidos por empresa en UK por año
SELECT  company_name, DATE_FORMAT(order_date, '%Y') AS "Año", SUM(quantity) AS "N.Objetos"
FROM customers  -- Si esta tabla fuese orders, no funcionaría. PARECE QUE EL ORDEN IMPORTA!!!
INNER JOIN orders  on  `customers`.customer_id = `orders`.customer_id
INNER JOIN order_details `order_details` on `orders`.order_id = `order_details`.order_id 
Where country = "UK"
GROUP BY company_name, Año;

-- 3. La misma consulta anterior pero con la adición de la cantidad de dinero que han pedido por esa cantidad de objetos, teniendo en cuenta los descuentos, etc
SELECT  company_name, DATE_FORMAT(order_date, '%Y') AS "Año", SUM(quantity) AS "N.Objetos", SUM(quantity*unit_price - quantity*unit_price*discount) As "Total"
FROM customers 
INNER JOIN orders  on  `customers`.customer_id = `orders`.customer_id
INNER JOIN order_details `order_details` on `orders`.order_id = `order_details`.order_id 
Where country = "UK"
GROUP BY company_name, Año;

-- 4.  Pedidos que han realizado cada compañía y su fecha
SELECT  order_id, company_name, order_date
FROM orders
INNER JOIN customers  on  `customers`.customer_id = `orders`.customer_id;

-- 5.  Tipos de producto vendidos
SELECT `categories`.category_id, category_name, product_name, SUM(quantity*`order_details`.unit_price - quantity*`order_details`.unit_price*discount) As "TotalSales"
FROM products
INNER JOIN categories on `categories`.category_id = `products`.category_id
INNER JOIN order_details  on  `order_details`.product_id = `products`.product_id
GROUP BY `categories`.category_name, product_name; -- NO ME SALE

-- 6.  Qué empresas tenemos en la BBDD Northwind
SELECT order_id, company_name, order_date
FROM customers
NATURAL JOIN orders;

-- 7. Pedidos por cliente de UK
SELECT company_name, COUNT(order_id) AS "N.Pedidos"
FROM customers
NATURAL JOIN orders
WHERE country = "UK"
GROUP BY company_name;

-- 8. Empresas de UK y sus pedidos
SELECT order_id, company_name, order_date
FROM customers
NATURAL JOIN orders
WHERE country = "UK";

-- 9. Empleadas que sean de la misma ciudad
SELECT e1.city, e1.first_name, e1.last_name, e2.city, e2.first_name, e2.last_name
FROM employees AS e1, employees As e2
WHERE e1.reports_to = e2.employee_id;

-- 10. BONUS: FULL OUTER JOIN Pedidos y empresas con pedidos asociados o no
SELECT order_id, company_name, order_date
FROM orders
LEFT JOIN customers
ON customers.customer_id = orders.customer_id
UNION
SELECT order_id, company_name, order_date
FROM orders
RIGHT JOIN customers 
ON customers.customer_id = orders.customer_id;

