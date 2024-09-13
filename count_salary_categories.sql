# Write your MySQL query statement below
-- SELECT COUNT(*) FROM (SELECT (CASE
--   WHEN income>50000 THEN 'High Salary'
--   WHEN (income>20000 AND income <50000) THEN 'Average Salary'
--   ELSE 'Low Salary'
--   END) AS income FROM Accounts) As b
WITH SalaryCategories AS(
    SELECT 'High Salary' AS category
    UNION
    SELECT 'Low Salary'
    UNION
    SELECT 'Average Salary'
),
customized AS(
  SELECT a1.income AS category, COUNT(*) AS accounts_count FROM (SELECT (CASE
    WHEN income>50000 THEN 'High Salary'
    WHEN (income>=20000 AND income<=50000) THEN 'Average Salary'
    ELSE 'Low Salary'
    END) AS income FROM Accounts) AS a1
  GROUP BY a1.income
)
SELECT SalaryCategories.category, IFNULL(customized.accounts_count, 0) AS accounts_count FROM SalaryCategories 
LEFT JOIN customized 
ON SalaryCategories.category = customized.category