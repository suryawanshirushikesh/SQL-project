SELECT u.user_id, u.name, SUM(t.amount) AS total_spent
FROM fintech_db.users u
JOIN fintech_db.accounts a ON u.user_id = a.user_id
JOIN fintech_db.transactions t ON a.account_id = t.account_id
WHERE t.transaction_type='debit'
GROUP BY u.user_id, u.name
HAVING SUM(t.amount) > (
    SELECT AVG(total_amount)
    FROM (
        SELECT SUM(amount) AS total_amount
        FROM fintech_db.transactions
        WHERE transaction_type='debit'
        GROUP BY account_id
    ) AS user_totals
)
ORDER BY total_spent DESC;

