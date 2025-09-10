import random
from faker import Faker
import pandas as pd
from datetime import datetime, timedelta

fake = Faker("en_IN")

# -----------------------
# CONFIG
# -----------------------
NUM_USERS = 200
NUM_MERCHANTS = 50
NUM_TRANSACTIONS = 1000
NUM_LOANS = 150

# -----------------------
# USERS
# -----------------------
users = []
for i in range(1, NUM_USERS + 1):
    users.append({
        "user_id": i,
        "name": fake.name(),
        "dob": fake.date_of_birth(minimum_age=18, maximum_age=70).strftime("%Y-%m-%d"),
        "city": fake.city(),
        "signup_date": fake.date_between(start_date="-5y", end_date="today").strftime("%Y-%m-%d"),
        "kyc_status": random.choice(["verified", "pending", "rejected"])
    })

# -----------------------
# MERCHANTS
# -----------------------
merchant_categories = ["Food", "Travel", "Shopping", "Bills", "Entertainment"]
merchants = []
for i in range(1, NUM_MERCHANTS + 1):
    merchants.append({
        "merchant_id": i,
        "name": fake.company(),
        "category": random.choice(merchant_categories),
        "city": fake.city()
    })

# -----------------------
# ACCOUNTS
# -----------------------
account_types = ["savings", "current", "loan"]
accounts = []
for i in range(1, NUM_USERS + 1):
    accounts.append({
        "account_id": i,
        "user_id": i,
        "account_type": random.choice(account_types),
        "balance": round(random.uniform(1000, 500000), 2),
        "created_at": fake.date_between(start_date="-5y", end_date="today").strftime("%Y-%m-%d")
    })

# -----------------------
# TRANSACTIONS
# -----------------------
transactions = []
for i in range(1, NUM_TRANSACTIONS + 1):
    user_acc = random.choice(accounts)
    transactions.append({
        "txn_id": i,
        "account_id": user_acc["account_id"],
        "merchant_id": random.randint(1, NUM_MERCHANTS),
        "txn_type": random.choice(["debit", "credit"]),
        "amount": round(random.uniform(100, 50000), 2),
        "txn_timestamp": fake.date_time_between(start_date="-2y", end_date="now").strftime("%Y-%m-%d %H:%M:%S"),
        "status": random.choice(["success", "failed"])
    })

# -----------------------
# PAYMENTS
# -----------------------
payment_methods = ["UPI", "Card", "NetBanking", "Wallet"]
payments = []
for txn in transactions:
    payments.append({
        "payment_id": txn["txn_id"],
        "txn_id": txn["txn_id"],
        "method": random.choice(payment_methods),
        "success_flag": 1 if txn["status"] == "success" else 0,
        "fee": round(txn["amount"] * random.uniform(0.005, 0.02), 2)
    })

# -----------------------
# LOANS
# -----------------------
loans = []
for i in range(1, NUM_LOANS + 1):
    user = random.choice(users)
issue_date = fake.date_between(start_date="-3y", end_date="-6m")
# -----------------------
# SAVE TO CSV
# -----------------------
pd.DataFrame(users).to_csv("users.csv", index=False)
print("✅ users.csv saved with", len(users), "rows")

pd.DataFrame(accounts).to_csv("accounts.csv", index=False)
print("✅ accounts.csv saved with", len(accounts), "rows")

pd.DataFrame(merchants).to_csv("merchants.csv", index=False)
print("✅ merchants.csv saved with", len(merchants), "rows")

pd.DataFrame(transactions).to_csv("transactions.csv", index=False)
print("✅ transactions.csv saved with", len(transactions), "rows")

pd.DataFrame(payments).to_csv("payments.csv", index=False)
print("✅ payments.csv saved with", len(payments), "rows")

pd.DataFrame(loans).to_csv("loans.csv", index=False)
print("✅ loans.csv saved with", len(loans), "rows")

print("\n🎉 All fake FinTech datasets generated successfully! Check your script folder.")

