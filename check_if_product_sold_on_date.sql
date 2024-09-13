# Write your MySQL query statement below
SELECT * FROM (
    (SELECT distinct product_id, 10 as price from Products WHERE products.product_id not in(SELECT distinct product_id FROM products WHERE change_date <= '2019-08-16'))
UNION
(
    SELECT product_id, new_price AS price FROM products
    WHERE (product_id, change_date) IN 
    ( 
      SELECT product_id, MAX(change_date)
      FROM products
      WHERE change_date <= '2019-08-16'
      GROUP BY product_id
    )
)) AS b
ORDER BY b.product_id