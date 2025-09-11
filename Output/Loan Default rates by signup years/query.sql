SELECT  
    YEAR(u.signup_date) AS signup_year,
    COUNT(l.loan_id) AS total_loans,
    SUM(CASE WHEN l.status = 'defaulted' THEN 1 ELSE 0 END) AS defaulted_loans,
    ROUND(
        (SUM(CASE WHEN l.status = 'defaulted' THEN 1 ELSE 0 END) / COUNT(l.loan_id)) * 100, 
        2
    ) AS default_rate_percent
FROM fintech_db.loans l
JOIN fintech_db.accounts a ON l.account_id = a.account_id
JOIN fintech_db.users u ON a.user_id = u.user_id
GROUP BY signup_year
HAVING total_loans > 5
ORDER BY default_rate_percent DESC;

