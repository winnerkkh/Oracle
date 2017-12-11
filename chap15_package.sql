-- 패키지
-- 오브젝트(procedure,function,trigger)들을 업무목적별로
-- 묶어서 관리하는 객체
-- 패키지 헤드부분
-- CREATE [OR REPLACE] PACKAGE 패키지명
-- IS
-- PROCDEURE 프로시져명 1;
-- PROCDEURE 프로시져명 2;
-- END;

-- 패키지 BODY 부분
-- CREATE [OR REPLACE] PACKAGE BODY 패키지명
-- IS
-- PROCEDURE 프로시져명1
-- is ~~~
-- END;
-- PROCDEURE 프로시져명 2
-- is ~~~
-- END;
-- END;

-- 실행
-- EXECUTE 패키지명.프로시저명;
-- 패키지 선언부
CREATE OR REPLACE PACKAGE EXAM_PACK 
IS
FUNCTION CAL_BONUS(vempno in emp.empno%type)
RETURN number;
PROCEDURE cursor_sam02;
END;
/
CREATE OR REPLACE PACKAGE BODY EXAM_PACK 
IS
FUNCTION CAL_BONUS(vempno in emp.empno%type)
RETURN number
IS 
  vsal number(7,2);
 BEGIN
    select sal into vsal
      from emp
     where empno = vempno;
     RETURN vsal*200;
 END;
 
PROCEDURE cursor_sam02
IS
 vdept dept%rowtype;
 CURSOR C1
 IS
 SELECT * FROM DEPT;
 BEGIN
 DBMS_OUTPUT.PUT_LINE('부서번호/부서명/지역명');
 DBMS_OUTPUT.PUT_LINE('----------------------');
 FOR vdept in C1 LOOP
     EXIT WHEN C1%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
 END LOOP;
 END;-- 프로시져 끝.
END;-- 패키지 바디 부분 END.
/

--- 저장된 파일의 컴파일 은 @파일명을 실행
--SQL> @C:\1실습실데이타베이스\oracle\sql\package












