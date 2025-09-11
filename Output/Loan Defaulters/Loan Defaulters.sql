SELECT a.account_id, u.name, COUNT(l.loan_id) AS total_loans,
       SUM(CASE WHEN l.status='defaulted' THEN 1 ELSE 0 END) AS defaulted_loans
FROM fintech_db.accounts a
JOIN fintech_db.users u ON a.user_id = u.user_id
JOIN fintech_db.loans l ON a.account_id = l.account_id
GROUP BY a.account_id, u.name
HAVING defaulted_loans > 0
ORDER BY defaulted_loans DESC;

