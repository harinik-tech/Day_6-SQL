SELECT
    policy_id,
    policy_number,
    CONCAT(
        SUBSTRING(policy_number, 1, 3),
        '****',
        SUBSTRING(policy_number, -4)
    ) AS masked_policy_number
FROM policies;