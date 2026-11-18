SELECT
    c.customer_id,
    c.customer_name,
    COUNT(p.policy_id) AS total_active_policies
FROM customers c
INNER JOIN policies p
ON c.customer_id = p.customer_id
WHERE p.status = 'Active'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(p.policy_id) > 1;