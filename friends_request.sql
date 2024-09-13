/*
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.
 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

 

Example 1:

Input: 
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
| 1            | 2           | 2016/06/03  |
| 1            | 3           | 2016/06/08  |
| 2            | 3           | 2016/06/08  |
| 3            | 4           | 2016/06/09  |
+--------------+-------------+-------------+
Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
 

Follow up: In the real world, multiple people could have the same most number of friends. Could you find all these people in this case?
*/

==========================
Solution i prosed

WITH CTE1 AS(
  SELECT requester_id, COUNT(*) 
  AS requests_done 
  FROM RequestAccepted 
  GROUP BY requester_id
),
CTE2 AS(
  SELECT accepter_id, 
  COUNT(*) AS accpets_done 
  FROM RequestAccepted 
  GROUP BY accepter_id
),

CTE3 AS (SELECT COALESCE(CTE1.requester_id, CTE2.accepter_id) AS id,
(COALESCE(CTE1.requests_done, 0) + COALESCE(CTE2.accpets_done, 0)) AS num
FROM CTE1 
LEFT JOIN CTE2 
ON CTE1.requester_id = CTE2.accepter_id
)
SELECT * FROM CTE3 WHERE CTE3.num = (
  SELECT MAX(num) FROM CTE3
)
SELECT * FROM CTE3 WHERE CTE3.num = (SELECT MAX(num) FROM CTE3)

==========================
LEETCODE solution


(SELECT requester_id FROM RequestAccepted) UNION ALL (SELECT accepter_id FROM RequestAccepted)

WITH CTE AS (
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL 
  (SELECT accepter_id FROM RequestAccepted)
) 

SELECT id, COUNT(*) num FROM CTE group by 1 order by 2 DESC LIMIT 1

============================