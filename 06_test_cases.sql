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