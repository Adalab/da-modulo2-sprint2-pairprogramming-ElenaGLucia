use northwind;
Ejercicio 1. Subconsultas.
# Falta terminar
SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders WHERE employee_id IN (
SELECT employee_id
FROM orders
Where MAX(order_date);

SELECT order_id, customer_id, employee_id, order_date, required_date -- Deuvelve los empleados q han hecho un pedido con fecha máxima
FROM orders where order_date = (Select MAX(order_date)
from orders);

SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS a where order_date = (Select MAX(order_date)
from orders AS b where a.employee_id = b.employee_id);

SELECT order_id, customer_id, employee_id, order_date, required_date, 
FROM orders WHERE employee_id IN (
SELECT employee_id, customer_id, MAX(order_date) AS max_order_date 
FROM orders
GROUP BY employee_id, customer_id;

SELECT order_id, customer_id, employee_id
FROM orders WHERE employee_id IN (
SELECT employee_id, sus MAX(order_date) AS max_order_date 
FROM orders
GROUP BY employee_id);




Ejercicio 2
Pendiente



Ejercicio 3
SELECT product_id,product_name, category_id
FROM products WHERE category_id = (
        SELECT category_id
        FROM categories
        WHERE category_name = 'Beverages')
        
Ejercicio 4
SELECT DISTINCT country
FROM customers
WHERE country NOT IN (SELECT DISTINCT country
        FROM suppliers
        WHERE country IS NOT NULL);
Ejercicio 5
Pendiente

Ejercicio 6
SELECT
    product_name,
    unit_price
FROM
    products
ORDER BY
    unit_price DESC;
WHERE unit_price >= 10 (
        SELECT COUNT(DISTINCT unit_price)
        FROM products
        )

