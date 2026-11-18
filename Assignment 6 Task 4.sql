SELECT
    pr.product_name,
    SUM(premium_data.total_premium) AS total_premium,
    SUM(claim_data.total_claims) AS total_claims,
    ROUND(
        SUM(claim_data.total_claims) /
        NULLIF(SUM(premium_data.total_premium), 0) * 100,
        2
    ) AS claim_ratio
FROM products pr
INNER JOIN (
    SELECT product_id, SUM(premium) AS total_premium
    FROM policies
    GROUP BY product_id
) premium_data
ON pr.product_id = premium_data.product_id
INNER JOIN (
    SELECT p.product_id, SUM(c.claim_amount) AS total_claims
    FROM policies p
    INNER JOIN claims c
    ON p.policy_id = c.policy_id
    GROUP BY p.product_id
) claim_data
ON pr.product_id = claim_data.product_id
GROUP BY pr.product_id, pr.product_name
HAVING claim_ratio > 60;