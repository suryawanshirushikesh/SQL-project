WITH merchant_revenue AS (
    SELECT 
        merchant_id, 
        SUM(amount) AS revenue
    FROM fintech_db.transactions
    WHERE LOWER(transaction_type) = 'debit'
    GROUP BY merchant_id
)
SELECT 
    m.merchant_name, 
    COALESCE(mr.revenue, 0) AS revenue
FROM merchant_revenue mr
LEFT JOIN fintech_db.merchants m 
    ON mr.merchant_id = m.merchant_id
ORDER BY mr.revenue DESC
LIMIT 5;

