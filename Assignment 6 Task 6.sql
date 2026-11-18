SELECT
    YEAR(start_date) AS policy_year,
    MONTH(start_date) AS policy_month,
    COUNT(policy_id) AS total_new_policies
FROM policies
GROUP BY YEAR(start_date), MONTH(start_date)
ORDER BY policy_year, policy_month;