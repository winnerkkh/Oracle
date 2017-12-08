--�׷��Լ�
-- sum(),avg(),count(), max(),min()
-- �׷��Լ��� ��ü����Ÿ�� ������� �Ҷ��� group by�� ���� �ʴ´�.
select to_char(sum(sal),'l999,999') "�� �޿���",
       to_char(avg(sal),'l999,999') "��� �޿���",
       to_char(min(sal),'l999,999') "�ּ� �޿�",
       to_char(max(sal),'l999,999') "�ִ� �޿�"
 from emp;  
  
  
-- max(), min()
select min(hiredate), max(hiredate)
  from emp;

--�׷��Լ����� null ���
select sum(comm) as "Ŀ�̼�", --Ŀ�̼� ���鸸 sum() 4�� sum�� ���
       sum(nvl(comm,0)) as "Ŀ�̼�2", -- ��� sum()�� ���
       count(comm) as "Ŀ�̼� ���", -- null���� ������ ���� ���� 4�Ǹ� count()
       count(nvl(comm,0)) as "Ŀ�̼� ���2", --��� count()
       count(*) as �Ǽ� --��ü Į�� ��� count()
  from emp;
  
  select * from emp;
  select job from emp;
  --���� ������ ���� ���Ҷ� -�ߤ�Ȥ ����
  select distinct job from emp;
  select count(distinct job) from emp;
  
  -- Į���� �ߺ��� �����ϴ� �Լ� distinct
  select count(distinct job) from emp;
  select count(distinct deptno) from emp;
  
-- group by ��
select job, max(ename), max(sal)
  from emp
  group by job;

select emp.deptno,
       emp.ename,
       maxSal
 from emp,    
( select deptno, max(sal) maxSal
    from emp
   group by deptno
  ) b
 where emp.deptno = b.deptno
   and emp.sal = b.maxSal
   ;



-- ���, ave()
select round(avg(sal)) as "��ձ޿�"
from emp;

select deptno,
      trunc(avg(sal)) as avgSal
  from emp
 group by deptno;

------------------------------------------
-- �μ��� ��ձ޿� �̻��� �޴� ������� ���Ͻÿ�
-- empno, ename, sal
 select b.deptno deptno,b.empno empno, b.ename ename, b.sal sal, a.avgSal avgSal
   from emp b,
    (select deptno,
            trunc(avg(sal)) as avgSal
       from emp a
      group by deptno) a
  where b.deptno = a.deptno
    and b.sal >= a.avgSal
;
 -----------------------------------------------                             

-- having ��: group by �� ����� ���͸� �ϴ� ����
select deptno, max(sal)
  from emp
 group by deptno
 having max(sal)>=3000;

-- job 'MANAGER'���� �� ����� �� �޿� �Ѿ� 5000�Ѵ� ����, �Ѿ� ���
select job,         -- ��
        count(*),
        sum(sal)
   from emp
  where trim(job) not like 'MANAGER' -- ��
  group by job            --��
  having sum(sal)>=5000   --��
   order by sum(sal)      --��
  ;

select * from emp




  