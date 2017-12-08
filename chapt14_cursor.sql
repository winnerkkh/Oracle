-- Ŀ��
-- select�� ��������� �����ϰ� �ִ� ������ ���̺�(ResultSet)
-- DECLARE
-- CURSOR Ŀ���� IS SELECT~~��;
-- BEGIN
--   OPEN Ŀ����;
--   FETCH Ŀ���� INTO ����1,����2,...;
--   CLOSE Ŀ����;
-- END;
DECLARE
 v_dept dept%rowtype;-- ������ �÷����� ��� �����Ҽ� �ִ� ����ü(structure)
 CURSOR c1 is select * from dept; -- Ŀ�� ����
BEGIN
    dbms_output.put_line('�μ���ȣ  �μ���  ������');
    dbms_output.put_line('------------------------');
    OPEN c1; -- Ŀ�� ����
    LOOP
      fetch c1 into v_dept.deptno, v_dept.dname, v_dept.loc;
      EXIT when c1%NOTFOUND;--Ŀ�� ���(����Ÿ�� ������)
      dbms_output.put_line(v_dept.deptno||' '||v_dept.dname||' '||v_dept.loc);
    END LOOP;
    CLOSE c1; -- �ڿ� ����
END;

-- demp ���̺� , dept���̺� salgrade���̺�
-- �����ȣ, �����, �μ���ȣ, �μ���, �޿���,����� ����ϼ���.
-- cursor c_empInfo;
DECLARE
 v_emp emp%rowtype;
 v_dept dept%rowtype;
 v_grade salgrade%rowtype;
 CURSOR c_empInfo is 
 select empno, ename, deptno,dname,sal,grade
  from emp natural join dept, 
       salgrade 
 where emp.sal between losal and hisal;
BEGIN
    dbms_output.put_line('�����ȣ ����� �μ���ȣ �μ���  �޿���  ���');
    dbms_output.put_line('---------------------------------------------');
    OPEN c_empInfo;
    LOOP
      fetch c_empInfo 
      into v_emp.empno, v_emp.ename, v_emp.deptno, v_dept.dname, v_emp.sal, v_grade.grade;
      EXIT when c_empInfo%NOTFOUND;
      dbms_output.put_line(v_emp.empno||' '||v_emp.ename||' '||v_emp.deptno||' '||v_dept.dname||' '||v_emp.sal||' '||v_grade.grade);
    END LOOP;
    CLOSE c_empInfo; -- �ڿ� ����
END;

-- CURSOR FOR  -����, OPEN, FETCH, CLOSE;

-- FOR ���ڵ�� IN Ŀ���� LOOP SELECT��;~~; END LOOP;
DECLARE
  v_dept dept%rowtype;--����ü
  cursor c1 is select * from dept;
BEGIN
    dbms_output.put_line('�μ���ȣ  �μ���       ������');
    dbms_output.put_line('-----------------------------');
    for v_dept in c1 loop
     exit when c1%notfound;
     dbms_output.put_line(v_dept.deptno||' '||v_dept.dname||' '||v_dept.loc);
     end loop;
END;







select empno, ename, deptno,dname,sal,grade
  from emp natural join dept, 
       salgrade 
 where emp.sal between losal and hisal;













