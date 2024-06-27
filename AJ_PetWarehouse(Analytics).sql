-- ---------------------------- --
-- Who are our top 5 customers? --
-- ---------------------------- --

-- Top 5 by sales amount --

SELECT c.business_name, SUM(s.sales) AS total_sales_amount
FROM customers AS c
JOIN sales AS s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY SUM(s.sales) DESC
LIMIT 5;

-- Top 5 by monetary amount --

SELECT c.business_name, SUM(s.price) AS total_sales_amount
FROM customers AS c
JOIN sales AS s
ON c.customer_id = s.customer_id
GROUP BY c.customer_id
ORDER BY SUM(s.price) DESC
LIMIT 5;

-- ----------------------------------------------- --
-- Which supplier provides us with the most sales? --
-- ----------------------------------------------- --

SELECT sup.business_name, SUM(s.price) AS total_sales_amount
FROM suppliers AS sup
JOIN sales AS s
ON sup.supplier_id = s.supplier_id
GROUP BY sup.supplier_id
ORDER BY SUM(s.price) DESC;

SELECT sup.business_name, SUM(s.price) AS total_sales_amount
FROM suppliers AS sup
JOIN sales AS s
ON sup.supplier_id = s.supplier_id
GROUP BY sup.supplier_id
ORDER BY SUM(s.price) DESC
LIMIT 1;

-- -------------------------------------------------------------- --
-- Which animals should we be targeting in our product expansion? --
-- -------------------------------------------------------------- --

-- by sales amount --

SELECT p.pet_type, SUM(s.sales) AS total_sales_amount
FROM pet_type AS p
JOIN sales AS s
ON p.pet_type_id = s.pet_type_id
GROUP BY p.pet_type_id
ORDER BY SUM(s.sales) DESC;

-- by monetary amount --

SELECT p.pet_type, SUM(s.price) AS total_sales_amount
FROM pet_type AS p
JOIN sales AS s
ON p.pet_type_id = s.pet_type_id
GROUP BY p.pet_type_id
ORDER BY SUM(s.price) DESC;

-- ------------------------------------------------------------------------- --
-- Which sizes of cats and dogs should we be targeting in our clothing line? --
-- ------------------------------------------------------------------------- --

SELECT pt.pet_type, ps.pet_size, SUM(s.sales) AS total_sales_amount
FROM pet_type AS pt
JOIN sales AS s
ON pt.pet_type_id = s.pet_type_id
JOIN pet_size AS ps
ON s.pet_size_id = ps.pet_size_id
JOIN products AS pr
ON pr.product_cat_id = s.product_cat_id
WHERE pt.pet_type IN ('cat', 'dog')
AND pr.product_category = 'clothes'
GROUP BY pt.pet_type, ps.pet_size
ORDER BY total_sales_amount DESC;

-- -------------------------------------------------------------------------------------------------- --
-- Provide me with the email and addresses of customers who did not purchase any goods in this period --
-- -------------------------------------------------------------------------------------------------- --

SELECT c.business_name, c.first_name, c.last_name, c.email, c.address, c.city, c.postcode
FROM customers AS c
LEFT JOIN sales AS s
ON c.customer_id = s.customer_id
WHERE s.customer_id IS NULL
ORDER BY c.business_name;

-- ---------------------------------------------------------- --
-- Provide me with the products that businesses would not buy --
-- ---------------------------------------------------------- --

SELECT product_id, COUNT(re_buy) AS no_repurchase
FROM sales
WHERE re_buy = 'no'
AND re_buy != 'yes'
GROUP BY product_id
ORDER BY no_repurchase DESC;

-- --------------------------------------------- --
-- Which products are rated higher than average? --
-- --------------------------------------------- --

SELECT 
    product_id, rating
FROM
    sales
GROUP BY product_id , rating
HAVING rating > (SELECT 
        AVG(rating)
    FROM
        sales)
ORDER BY rating DESC;

