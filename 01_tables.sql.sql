use anu;
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE,
    phone VARCHAR2(15),
    address VARCHAR2(200),
    created_at DATE DEFAULT SYSDATE
);
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    account_type VARCHAR2(20), -- SAVINGS / CURRENT
    balance NUMBER(12,2) DEFAULT 0,
    created_at DATE DEFAULT SYSDATE,
    
    CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
CREATE TABLE transactions (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER,
    transaction_type VARCHAR2(20), -- DEPOSIT / WITHDRAW
    amount NUMBER(12,2),
    transaction_date DATE DEFAULT SYSDATE,
    
    CONSTRAINT fk_account
    FOREIGN KEY (account_id)
    REFERENCES accounts(account_id)
);
