--01. substr(), instr(���ڿ�, ����[,����,����ȸ��])
 select * from emp;
 select substr(hiredate,instr(hiredate,'/')-2,2) �⵵,
        substr(hiredate,instr(hiredate,'/')+1,2) ��
   from emp;
 
 --02. substr(), 4���� �Ի��� ��� where �Ի��� = 4��, 
 -- to_number() ���ڿ� ->����
 select *
   from emp
  where to_number(substr(hiredate,instr(hiredate,'/')+1,2)) = 4 
  ;
 
 --03. mod() ������ ���ϴ� �Լ�
 -- mod(��1, ��2)  ¦�� : � ���� 2�� ������ �������� 0 �̸� ¦��
 -- where ���ǿ��� �����ȣ�� ¦�� 
 select * 
   from emp
  where mod(empno,2) = 0
  order by empno;

-- 04. ��¥ to_char(��¥, ����)
select hiredate,
       to_char(hiredate, 'yy/MON/dd dy')
  from emp;

-- 05. ������ ���� 01/01 �������� ������ �������� Ȯ��
-- trunc(sysdate, 'yy') => '2017/01/01' 
select trunc(sysdate - trunc(sysdate, 'yy'))
  from dual;
 
-- 06. 
select a.empno �����ȣ, a.ename �����,
        b.empno �Ŵ�����ȣ, b.ename �Ŵ�����
  from emp a,
       emp b
 where a.mgr = b.empno;
 
 
-- nvl(��,0)
select empno, ename, nvl(mgr,0)
  from emp;



-- 07. decode()�Լ�
-- decode(job, 'analyst', 200, 'salesman', 180, 'manager', 150, 'cleark', 100) �λ�
select empno,
       ename,
       job,
       to_char(sal+decode(lower(job),'analyst',200,'salesman',180,
                               'manager',150, 'clerk',100),'l999,999')
       as upSal                               
  from emp;
