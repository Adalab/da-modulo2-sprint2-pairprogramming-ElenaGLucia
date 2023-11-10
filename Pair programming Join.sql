USE `queries básicas`;

-- 1. cuántos pedidos ha realizado cada empresa cliente de UK. Nos piden el ID del cliente y el nombre de la empresa y el número de pedidos.
SELECT`customers`.`company_name``customers`.`company_name`, `customers`.`customer_id`, COUNT(`customers`.`customer_id`) AS "N.Pedidos"
FROM `customers`
NATURAL JOIN  `orders`
Where `customers`.`country` = "UK"
GROUP BY `customers`.`customer_id`;

-- 2. Productos pedidos por empresa en UK por año
SELECT company_name, DATE_FORMAT(order_date, '%Y') AS "Año", SUM(quantity) AS "N.Objetos"
FROM `orders`
NATURAL JOIN  `order_details` NATURAL JOIN `customers`
Where country = "UK"
GROUP BY Año, order_id;






-- Where `customers`.`country` = "UK"
