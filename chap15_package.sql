-- ��Ű��
-- ������Ʈ(procedure,function,trigger)���� ������������
-- ��� �����ϴ� ��ü
-- ��Ű�� ���κ�
-- CREATE [OR REPLACE] PACKAGE ��Ű����
-- IS
-- PROCDEURE ���ν����� 1;
-- PROCDEURE ���ν����� 2;
-- END;

-- ��Ű�� BODY �κ�
-- CREATE [OR REPLACE] PACKAGE BODY ��Ű����
-- IS
-- PROCEDURE ���ν�����1
-- is ~~~
-- END;
-- PROCDEURE ���ν����� 2
-- is ~~~
-- END;
-- END;

-- ����
-- EXECUTE ��Ű����.���ν�����;
-- ��Ű�� �����
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
 DBMS_OUTPUT.PUT_LINE('�μ���ȣ/�μ���/������');
 DBMS_OUTPUT.PUT_LINE('----------------------');
 FOR vdept in C1 LOOP
     EXIT WHEN C1%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(vdept.deptno||'/'||vdept.dname||'/'||vdept.loc);
 END LOOP;
 END;-- ���ν��� ��.
END;-- ��Ű�� �ٵ� �κ� END.
/

--- ����� ������ ������ �� @���ϸ��� ����
--SQL> @C:\1�ǽ��ǵ���Ÿ���̽�\oracle\sql\package












