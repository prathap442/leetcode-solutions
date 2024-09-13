# Write your MySQL query statement below
SELECT class FROM Courses GROUP BY class HAVING COUNT(class) >= 5;
-- COUNT(class): Counts the number of non-NULL values in the class column for each group.
-- COUNT(*): Counts all the rows in the group, regardless of whether the class column contains NULLs.