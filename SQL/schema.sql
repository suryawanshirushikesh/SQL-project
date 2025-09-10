-- ======================================
-- FinTech Database Schema
-- ======================================
CREATE DATABASE IF NOT EXISTS fintech_db;
USE fintech_db;

-- ======================================
-- 1️⃣ USERS
-- ======================================
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    city VARCHAR(100),
    signup_date DATE,
    kyc_status ENUM('verified', 'pending', 'rejected') DEFAULT 'pending'
);

-- ======================================
-- 2️⃣ MERCHANTS
-- ======================================
CREATE TABLE IF NOT EXISTS merchants (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('Food','Travel','Shopping','Bills','Entertainment'),
    city VARCHAR(100)
);

-- ======================================
-- 3️⃣ ACCOUNTS
-- ======================================
CREATE TABLE IF NOT EXISTS accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    account_type ENUM('savings','current','loan') DEFAULT 'savings',
    balance DECIMAL(12,2) DEFAULT 0.00,
    created_at DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================================
-- 4️⃣ TRANSACTIONS
-- ======================================
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    merchant_id INT,
    transaction_type ENUM('debit','credit') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    status ENUM('success','failed') DEFAULT 'success',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ======================================
-- 5️⃣ PAYMENTS
-- ======================================
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_id INT NOT NULL,
    method ENUM('UPI','Card','NetBanking','Wallet'),
    amount DECIMAL(12,2) NOT NULL,
    status ENUM('success','failed') DEFAULT 'success',
    payment_date DATETIME NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================================
-- 6️⃣ LOANS
-- ======================================
CREATE TABLE IF NOT EXISTS loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    loan_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status ENUM('active','closed','defaulted') DEFAULT 'active',
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

