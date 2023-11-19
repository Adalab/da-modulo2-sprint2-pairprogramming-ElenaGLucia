Use northwind;

-- 1. Extraer los pedidos con el máximo "order_date" para cada empleado
SELECT order_id, customer_id, employee_id, order_date, required_date
FROM orders AS a where order_date = (Select MAX(order_date)
from orders AS b where a.employee_id = b.employee_id);

Select MAX(order_date) -- Esta sería la subconsulta 
from orders
group by employee_id;

-- 2. Extraer  el precio unitario máximo (unit_price) de cada producto vendido
select product_id, unit_price
from products;

-- con subquery correlacionada
select product_id, unit_price 
from products as p
where unit_price = (Select Max(unit_price) 
from products as p1 where p.product_id = p1.product_id);

-- 3. Extraer información de los productos "Beverages"
select product_id, product_name, category_id
from products
where category_id = 1;

-- con subquery 
SELECT product_id,product_name, category_id
FROM products WHERE category_id = (
        SELECT category_id
        FROM categories
        WHERE category_name = 'Beverages');
        
-- con subquery correlacionada
select product_id, product_name, category_id
from products as pr
where category_id = (select category_id 
		        from products as pr2 
			where category_id = 1 and pr.product_id = pr2.product_id);
        
-- 4. Extraer la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
SELECT DISTINCT country
FROM customers
WHERE country NOT IN (SELECT DISTINCT country
        FROM suppliers
        WHERE country IS NOT NULL);

-- 5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread" (producto id 6) en un sólo pedido
select *
from customers as c
where customer_id in (select customer_id
from orders as o
where order_id in (select order_id
from order_details as d
where product_id = 6 AND quantity > 20));

-- 6. Extraer los 10 productos más caros
SELECT product_name, unit_price
from products
order by unit_price DESC
limit 10;

-- con subquery correlacionada
SELECT product_name, unit_price
from products as pr
where product_name = (SELECT product_name
from products as pr1 where pr.product_name = pr1.product_name)
order by unit_price DESC
limit 10;

-- 7. Extraer el producto más popular y la cantidad que se compró
select product_name -- faltaria mostrar la suma de las cantidades
from products
where product_id in (select product_id
from order_details as j
group by product_id
having SUM(quantity) >= ALL (select SUM(quantity)
				from order_details as h
				group by product_id));
