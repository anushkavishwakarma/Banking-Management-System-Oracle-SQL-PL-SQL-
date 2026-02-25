--package specification
CREATE OR REPLACE PACKAGE banking_pkg AS

    PROCEDURE add_customer (
        p_first_name VARCHAR2,
        p_last_name VARCHAR2,
        p_email VARCHAR2,
        p_phone VARCHAR2,
        p_address VARCHAR2
    );

    PROCEDURE create_account (
        p_customer_id NUMBER,
        p_account_type VARCHAR2
    );

    PROCEDURE deposit (
        p_account_id NUMBER,
        p_amount NUMBER
    );

    PROCEDURE withdraw (
        p_account_id NUMBER,
        p_amount NUMBER
    );

    PROCEDURE transfer (
        p_from_account NUMBER,
        p_to_account NUMBER,
        p_amount NUMBER
    );

    FUNCTION calculate_interest (
        p_account_id NUMBER,
        p_rate NUMBER
    ) RETURN NUMBER;

END banking_pkg;
/
