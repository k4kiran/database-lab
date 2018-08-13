DAY 9

/*creating function*/

set serveroutput on
CREATE OR REPLACE FUNCTION inccom(d varchar2,c number)
RETURN number
  AS
 BEGIN
 UPDATE EMPLOYEE SET commision=commision+c WHERE EMPID=d;
  RETURN 0;
 END inccom;
/

/*declaring function*/

DECLARE 
              id varchar2(20);
              inc number;
              call number;
              BEGIN
                     id:='&id';
                     inc:=&inc;
                     call:=inccom(id,inc);
              END;
/

/*creating procedure*/                     

DECLARE
 procedure newemp AS
     id varchar2(20);
     nam varchar2(20);
  
  BEGIN
   id:='&id';
   nam:='&nam';
   insert into employee(empid,empname) values(id,nam);
   END newemp;

begin
newemp();
end;


/*creating package*/

CREATE OR REPLACE PACKAGE pack AS
FUNCTION inccom(d varchar2,c number)
RETURN number;

PROCEDURE newemp;

END pack;
/


  



