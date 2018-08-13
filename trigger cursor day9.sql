
15 a:

 
set serveroutput on
CREATE OR REPLACE TRIGGER tri
BEFORE  UPDATE OF balance ON master
For each row
DECLARE 
 amount number;
	exp exception;


BEGIN
	if :new.balance>:old.balance then
		amount:=:new.balance-:old.balance;
		insert into transaction values(:new.accno,amount,sysdate,'Deposit');
 	elsif:old.balance > 1000 then
		amount:=:old.balance-:new.balance;
		insert into transaction values(:new.accno,amount,sysdate,'Withdraw');
	else 
		raise exp;
	end if;
	   
END;



15 b 1:

DECLARE  
   total_rows number(2); 
BEGIN
    
   UPDATE employee1 
   SET salary = 15000 where salary<10000; 
   IF sql%notfound THEN 
      dbms_output.put_line('no customers selected'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' customers selected '); 
   END IF;  
END; 
/  


15 b 2:


DECLARE  
   total_rows number(2); 
BEGIN
    
   UPDATE employee1 
   SET salary = 35000 where salary>10000 and salary<30000; 
   IF sql%notfound THEN 
      dbms_output.put_line('no customers selected'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' customers selected '); 
   END IF;  
END; 
/     





15 b 3:

DECLARE  
   total_rows number(2); 
BEGIN
    
   UPDATE employee1 
   SET salary = 65000 where salary>=30000 and salary<60000; 
   IF sql%notfound THEN 
      dbms_output.put_line('no customers selected'); 
   ELSIF sql%found THEN 
      total_rows := sql%rowcount;
      dbms_output.put_line( total_rows || ' customers selected '); 
   END IF;  
END; 
/      







15 b  4:

CREATE OR REPLACE PROCEDURE UPDATION IS

Declare CURSOR incr IS
SELECT SALARY FROM EMPLOYEE1;
n_empid employee.empid%type;
n_SAL EMPLOYEE1.SALARY%TYPE;

BEGIN 
OPEN incr;
LOOP
	FETCH incr INTO n_SAL;
	EXIT WHEN incr%NOTFOUND;
	if (n_SAL>=30000) and (n_SAL<60000) then
		update employee1 set salary=65000 where n_empid=&n_empid;
	end if;
END LOOP;
CLOSE incr;
END;
/







update master set balance=balance+2000 where accno=15370;


                                  











