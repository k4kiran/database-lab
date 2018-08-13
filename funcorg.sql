SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION fcount(d varchar2)
	RETURN Varchar2
	AS 
		name varchar2(20);		
	BEGIN
		SELECT EMPNAME into name from EMPLOYEE where empid=(select manager from employee where empid=d);
		RETURN name; 
	END;
/
DECLARE
	T varchar2(20);
	name varchar2(20);
	BEGIN
		T:='&empid';
		name:=fcount(T);
		DBMS_OUTPUT.PUT_LINE(name);
	END; 
/