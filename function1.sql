SET SERVEROUTPUT ON 
create or replace function countfn
return number
as
  n number;
begin
select count(*) into n from employee;
dbms_output.put_line('no of employees:'||n);
return 0;
end;
/