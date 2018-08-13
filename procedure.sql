
SET SERVEROUTPUT ON 
create or replace procedure count
as 
  n number;
begin
select count(*) into n from employee;
dbms_output.put_line('no of employees:'||n);
end;
/

