SELECT
    p.policy_id,
    p.policy_number,
    p.premium,
    c.claim_id
FROM policies p
LEFT JOIN claims c
ON p.policy_id = c.policy_id
WHERE c.claim_id IS NULL;