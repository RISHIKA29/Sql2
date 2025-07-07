SELECT id, (
    CASE
    WHEN ISNULL(p_id) THEN 'Root'
    WHEN (id NOT IN (SELECT IFNULL(p_id, 0) FROM Tree)) THEN 'Leaf'
    ELSE 'Inner'
    END
) AS type FROM Tree
