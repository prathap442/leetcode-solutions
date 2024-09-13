# Write your MySQL query statement below
WITH CTE2 AS (
    SELECT * FROM Logs 
    ORDER BY id
),

CTE AS (
  SELECT num,
    LEAD(num, 1) OVER() AS num1,
    LEAD(num, 2) OVER() AS num2,
    id,
    LEAD(id, 1) OVER() AS num1_id,
    LEAD(id, 2) OVER() AS num2_id
    FROM CTE2
)

SELECT Distinct num AS ConsecutiveNums 
FROM CTE 
WHERE num = num1 
AND num1=num2
AND num1_id = id+1 
AND num2_id = id+2




-- Looking at the solution in a differnt approach 
# Write your MySQL query statement below
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l2.num = l3.num;