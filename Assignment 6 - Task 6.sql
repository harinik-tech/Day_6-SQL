SELECT
    CASE
        WHEN TIMESTAMPDIFF(YEAR, c.dob, CURDATE()) BETWEEN 18 AND 25
            THEN '18-25'
        WHEN TIMESTAMPDIFF(YEAR, c.dob, CURDATE()) BETWEEN 26 AND 35
            THEN '26-35'
        WHEN TIMESTAMPDIFF(YEAR, c.dob, CURDATE()) BETWEEN 36 AND 45
            THEN '36-45'
        WHEN TIMESTAMPDIFF(YEAR, c.dob, CURDATE()) BETWEEN 46 AND 60
            THEN '46-60'
        ELSE 'Above 60'
    END AS age_band,
    ROUND(AVG(p.premium), 2) AS average_premium
FROM customers c
INNER JOIN policies p
ON c.customer_id = p.customer_id
GROUP BY age_band
ORDER BY MIN(TIMESTAMPDIFF(YEAR, c.dob, CURDATE()));