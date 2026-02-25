--indexing(performance)
CREATE INDEX idx_customer_email ON customers(email);
CREATE INDEX idx_account_customer ON accounts(customer_id);
CREATE INDEX idx_transaction_account ON transactions(account_id);