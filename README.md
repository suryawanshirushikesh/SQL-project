# SQL-project

#  FinTech Analytics Database (SQL Project)

##  Overview

This project simulates a FinTech banking system and demonstrates advanced SQL skills for **data analysis, reporting, and relational database design**.
It was designed to showcase **MySQL expertise** across schema creation, data import, joins, aggregations, CTEs, subqueries, and window functions on a realistic dataset.

---

##  Dataset & Schema

The database consists of **6 core tables**, connected through relational keys:

1. **Users** – user\_id, name, email, phone, signup\_date
2. **Accounts** – account\_id, user\_id, account\_type, balance, created\_at
3. **Loans** – loan\_id, account\_id, amount, interest\_rate, status, issued\_date
4. **Merchants** – merchant\_id, name, category, location
5. **Payments** – payment\_id, account\_id, amount, payment\_date, method, status
6. **Transactions** – txn\_id, account\_id, amount, transaction\_date, transaction\_type

➡ Together, they form a **mini core-banking dataset** with customers, accounts, loans, merchants, and transaction/payment flows.

---

##  SQL Skills Demonstrated

* **Joins & Aggregations**
* **Subqueries**
* **Common Table Expressions (CTEs)**
* **Window Functions**
* **Advanced Filtering & Grouping**
* **Database Schema Design & Constraints**

## How This Helps Banks

Spot top customers and high-value accounts for better offers.

See loan default trends to reduce risk.

Track merchant and payment patterns to boost revenue.

Keep data clean and ready for reports or audits.


