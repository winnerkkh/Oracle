-- pl/sql
-- ������ ���α׷���
--01. --��� IF -ELSIF THNE ~ END IF;
    set serverout on
    DECLARE
     v_emp emp%rowtype;--emp���̺��� ��� Į���� �Ӽ��� ���� ���ڵ�Ÿ��
     v_dname varchar2(14);
    BEGIN
    select *
      INTO v_emp -- �� ��(row)�� ������ �ִ� ����
      from emp
     where ename = UPPER('KIng');
     
     if(v_emp.deptno = 10) then
       v_dname := 'accounting';
     elsif v_emp.deptno = 20 then
       v_dname := 'research';
     elsif v_emp.deptno = 30 then
       v_dname := 'sales';
     elsif v_emp.deptno = 40 then
       v_dname := 'operations';
     end if; -- if ���Ṯ
     
     dbms_output.put_line('���  /  �̸�  / �μ��� ');
     dbms_output.put_line('------------------------');
     dbms_output.put_line(v_emp.empno||'/'||v_emp.ename||'/'||v_dname);
    END; 

set serveroutput on;

--02. BASIC LOOP�� 1~10������ �ڿ����� ��
DECLARE 
    n number :=1; --���� ���� �� �ʱ�ȭ
    tot number := 0; --���� ���� �� �ʱ�ȭ
BEGIN
    LOOP
     tot := tot +n;
      n:=n+1;
     if(n>10) then
        exit;
     end if; -- if�� ����
    END LOOP;
   dbms_output.put_line(n||'������ �� ='||tot);
END;




-- 03. for loop�� 1~10������ ��
set serverout on
DECLARE
    tot number :=0; -- ���� ���� �� �ʱ�ȭ
BEGIN
    for n in 1..10 loop
        tot:=tot+n;
      end loop;
      
      DBMS_OUTPUT.PUT_LINE('�հ�'||tot);
END;



-- 04. WHILE~LOOP
set serverout on
DECLARE
    n number :=1; --���� ���� �� �ʱ�ȭ
    tot number := 0;
BEGIN
  WHILE n<=10 LOOP
   tot := tot+n;
   n:=n+1;
  END LOOP;
  
  dbms_output.put_line(n||'������ ��='||tot);
END;  


-- 05. CYRSOR�� ���� �� ���
set serverout on
DECLARE
   v_emp emp%rowtype; -- emp���ڵ� Ÿ�� ����
   CURSOR c1 
   is
   select * from emp
    where comm is not null;
BEGIN
 DBMS_OUTPUT.PUT_LINE('���  �̸�  �޿�');
 DBMS_OUTPUT.PUT_LINE('--------------');
  for v_emp in c1 loop
   exit when c1%notfound;
   DBMS_OUTPUT.PUT_LINE(v_emp.empno||' ' ||v_emp.ename||' '||V_emp.sal);
   end loop;
END;

-- 05-02 open c1, fetch c1 into ����, close c1;
DECLARE
   v_emp emp%rowtype; -- emp���ڵ� Ÿ�� ����
   CURSOR c1 
   is
   select * from emp
    where comm is not null;
BEGIN
 DBMS_OUTPUT.PUT_LINE('���  �̸�  �޿�');
 DBMS_OUTPUT.PUT_LINE('--------------');
 OPEN c1; --Ŀ�� ����
    loop
    fetch c1 into v_emp; --����Ÿ ��ġ
    exit when c1%notfound; --�ݺ��� ���������� ����
    DBMS_OUTPUT.PUT_LINE(v_emp.empno||' ' ||v_emp.ename||' '||V_emp.sal);
    end loop;
    close c1; --Ŀ�� �ݱ�
END;


select * from emp;
