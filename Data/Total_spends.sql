SELECT u.user_id, u.name, SUM(t.amount) AS total_spent
FROM users u
JOIN accounts a ON u.user_id = a.user_id
JOIN transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'debit'
GROUP BY u.user_id, u.name
ORDER BY total_spent DESC
LIMIT 10;
