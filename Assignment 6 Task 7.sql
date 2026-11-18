SELECT
    a.agent_id,
    a.agent_name,
    SUM(p.premium) AS total_premium
FROM agents a
INNER JOIN policies p
ON a.agent_id = p.agent_id
GROUP BY a.agent_id, a.agent_name
ORDER BY total_premium DESC
LIMIT 5;