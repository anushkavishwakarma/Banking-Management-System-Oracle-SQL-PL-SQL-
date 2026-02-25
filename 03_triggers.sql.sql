-- trigger (Prevent Negative Balance Directly)
create or replace trigger check_negtive_balance
before update on accounts
for each row
begin
    if :new.balance < 0 then
        raise_application_error(-20002,'Negative balance are not allowed');
    end if ;
end;
/