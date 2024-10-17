CREATE SCHEMA `northwind`;

USE `northwind`;

-- EJERCICIO 4
SELECT *
	FROM employees;
    
SELECT employee_id, last_name, first_name
	FROM employees;
    
-- EJERCICIO 5
SELECT *
	FROM products;
    
SELECT *
	FROM products
    WHERE unit_price BETWEEN 0 AND 5;    

-- EJERCICIO 6
SELECT *
	FROM products
    WHERE unit_price IS NULL;

-- EJERCICIO 7
SELECT *
	FROM products
    WHERE unit_price < 15
		AND
        product_id < 20; 
        
-- EJERCICIO 8
SELECT *
	FROM products
    WHERE NOT (unit_price <= 15
		OR
        product_id <= 20); 

-- EJERCICIO 9
SELECT ship_country, ship_region
	FROM orders;
    
-- EJERCICIO 10
SELECT product_id, product_name, unit_price
	FROM products
    lIMIT 10;

-- EJERCICIO 11
SELECT product_id, product_name, unit_price
	FROM products
    ORDER BY product_id DESC
    lIMIT 10;

-- EJERCICIO 12
SELECT DISTINCT order_id
	FROM order_details;
    
-- EJERCICIO 13
SELECT  *, ROUND(unit_price * quantity, 2) AS ImporteTotal
    FROM  order_details;

-- EJERCICIO 14
SELECT DISTINCT order_id
	FROM order_details
    LIMIT 5 
    OFFSET 4;




