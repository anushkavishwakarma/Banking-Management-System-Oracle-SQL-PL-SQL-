
--package body
CREATE OR REPLACE PACKAGE BODY banking_pkg AS

---------------------------------------------------
-- ADD CUSTOMER
---------------------------------------------------
PROCEDURE add_customer (
    p_first_name VARCHAR2,
    p_last_name VARCHAR2,
    p_email VARCHAR2,
    p_phone VARCHAR2,
    p_address VARCHAR2
) AS
BEGIN
    INSERT INTO customers
    VALUES (
        seq_customer.NEXTVAL,
        p_first_name,
        p_last_name,
        p_email,
        p_phone,
        p_address,
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE('Customer Added Successfully');
END;

---------------------------------------------------
-- CREATE ACCOUNT
---------------------------------------------------
PROCEDURE create_account (
    p_customer_id NUMBER,
    p_account_type VARCHAR2
) AS
BEGIN
    INSERT INTO accounts
    VALUES (
        seq_account.NEXTVAL,
        p_customer_id,
        p_account_type,
        0,
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE('Account Created Successfully');
END;

---------------------------------------------------
-- DEPOSIT
---------------------------------------------------
PROCEDURE deposit (
    p_account_id NUMBER,
    p_amount NUMBER
) AS
BEGIN
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_account_id;

    INSERT INTO transactions
    VALUES (
        seq_transaction.NEXTVAL,
        p_account_id,
        'DEPOSIT',
        p_amount,
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE('Deposit Successful');
END;

---------------------------------------------------
-- WITHDRAW
---------------------------------------------------
PROCEDURE withdraw (
    p_account_id NUMBER,
    p_amount NUMBER
) AS
    v_balance NUMBER;
BEGIN
    SELECT balance INTO v_balance
    FROM accounts
    WHERE account_id = p_account_id;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient Balance');
    END IF;

    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_account_id;

    INSERT INTO transactions
    VALUES (
        seq_transaction.NEXTVAL,
        p_account_id,
        'WITHDRAW',
        p_amount,
        SYSDATE
    );

    DBMS_OUTPUT.PUT_LINE('Withdrawal Successful');
END;

---------------------------------------------------
-- TRANSFER BETWEEN ACCOUNTS
---------------------------------------------------
PROCEDURE transfer (
    p_from_account NUMBER,
    p_to_account NUMBER,
    p_amount NUMBER
) AS
BEGIN
    withdraw(p_from_account, p_amount);
    deposit(p_to_account, p_amount);

    DBMS_OUTPUT.PUT_LINE('Transfer Successful');
END;

---------------------------------------------------
-- CALCULATE INTEREST
---------------------------------------------------
FUNCTION calculate_interest (
    p_account_id NUMBER,
    p_rate NUMBER
) RETURN NUMBER AS
    v_balance NUMBER;
BEGIN
    SELECT balance INTO v_balance
    FROM accounts
    WHERE account_id = p_account_id;

    RETURN (v_balance * p_rate) / 100;
END;

END banking_pkg;
/

--using package
BEGIN
    banking_pkg.add_customer('Anoushka','Vishwakarma','anu@gmail.com','9999999999','Mumbai');
END;
/
--create account
BEGIN
    banking_pkg.create_account(1,'SAVINGS');
END;
/
--Deposit
BEGIN
    banking_pkg.deposit(1001,5000);
END;
/
--Withdraw
BEGIN
    banking_pkg.withdraw(1001,1000);
END;
/
--Transfer
BEGIN
    banking_pkg.transfer(1001,1002,500);
END;
/
--Interest Calculation
DECLARE
    v_interest NUMBER;
BEGIN
    v_interest := banking_pkg.calculate_interest(1001,5);
    DBMS_OUTPUT.PUT_LINE('Interest = ' || v_interest);
END;
/