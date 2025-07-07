# Write your MySQL query statement below
WITH CTE AS (
    SELECT *, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk FROM Employee
),
CTE2 AS (
    SELECT * FROM CTE WHERE rnk<=3
)
SELECT d.name AS Department, CTE2.name AS Employee, CTE2.salary AS Salary 
FROM CTE2 JOIN Department d ON CTE2.departmentId=d.id