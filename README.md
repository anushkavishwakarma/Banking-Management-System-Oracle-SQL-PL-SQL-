
### Procedures:
- `add_customer`
- `create_account`
- `deposit`
- `withdraw`
- `transfer`

### Function:
- `calculate_interest`

This improves:
- Modularity
- Performance
- Maintainability
- Logical grouping of operations

---

## 📊 Indexing Strategy

Indexes are created on:
- `accounts(customer_id)`
- `transactions(account_id)`

Primary and Unique constraints automatically generate indexes.

---

## ▶ Execution Order

To run the project in Oracle:

1. Run `01_tables.sql`
2. Run `02_sequences.sql`
3. Run `03_triggers.sql`
4. Run `04_package_spec.sql`
5. Run `05_package_body.sql`
6. Run `07_indexes.sql`
7. Run `06_test_cases.sql`

---

## 🧪 Testing

The project includes a test script that demonstrates:

- Customer creation
- Account creation
- Deposits and withdrawals
- Fund transfer
- Interest calculation
- Exception handling (insufficient balance)

---

## 🎯 Learning Outcomes

Through this project, the following concepts were applied:

- Relational Database Design
- Primary & Foreign Key Constraints
- PL/SQL Procedures & Functions
- Triggers
- Packages
- Exception Handling
- Transaction Management
- Indexing & Query Optimization

---

## 👩‍💻 Author

**Anushka Vishwakarma**  
Bachelor of Science in Computer Science  
University of Mumbai  

---

## 📌 Project Status

✅ Completed  
✅ Structured  
✅ Tested  
✅ GitHub Ready  
