# Write your MySQL query statement below
-- SELECT Department.name, ranked_employees.name, ranked_employees.salary
-- FROM (
    SELECT id, RANK() OVER (
        PARTITION BY departmentId
        ORDER BY salary DESC
    ) AS rank
    FROM Employee
-- ) AS ranked_employees
-- INNER JOIN Department ON (
--   ranked_employees.departmentID = Department.id
-- )
-- WHERE ranked_employees.rank <= 3