-- �� view
-- ���̺��� ������ �����ֱ����� ������ ��üŸ��
-- create or replace view ��� as select ��;
create or replace view view_emp_job
as 
select empno eno, ename, deptno dno, job
  from emp
 where job like 'SALESMAN';
 
 select * from view_emp_job;
 
 -- ����Ÿ ��ųʸ� �� �ִ� ��ü��
 select * from user_views;
 
 select * from emp_details_view;
 
 -- view�� ���� - ������ ����
 create or replace view v_emp
 as
 select empno no, job, mgr, deptno dno
  from emp;
 
 select * from emp;
 
 select * from v_emp;
 
 -- ������ ���� �� ����
 create or replace view v_emp_cmp
 as
 select empno, ename, sal, e.deptno dno, dname, loc
   from emp e, dept d
  where e.deptno = d.deptno
  ;
 
 select * from v_emp_cmp;
 -- ����Ÿ ��ųʸ� �κп��� view��� select���� ��ȸ
 select view_name,text
   from user_views;
   
select * from view_emp_job; 

insert into view_emp_job
values(8000,'ȫ�浿',30,'SALESMAN');


-- �信 �׷��Լ� ���
create or replace view v_emp_sal
as
select deptno deno, round(sum(sal)) sumSal,round(avg(sal)) avgSal
  from emp
  group by deptno
  ;



select * from v_emp_sal;

---insert into v_emp_sal values(40,9900,2500);

-- drop view ���;
select view_name,text from user_views;
drop view v_emp_sal;

-- �� �ɼ� 
 
-- ������ ���� ����� ������ override  - or replace
create or replace view v_emp
as 
select * from emp;


-- force ���̺��� ��� ������ view�� ������ �ϴ� ��� ���
create or replace force view v_emp_notable
as
select empno eno, ename, deptno dno, job
  from emp_notable
 where job like 'MANAGER'
 ;
 select * from v_emp_notable;
 
 select view_name, text from user_views;
 
 -- with check option
 create or replace view v_emp_job_nochk
 as
 select empno eno, ename, deptno dno, job
   from emp
 where job like 'MANAGER';
 
 select * from v_emp_job_nochk;
 
 insert into v_emp_job_nochk
 values(9000,'�Ӳ���',30,'SALESMAN');
 
 select * from v_emp_job_nochk;
 select * from emp;
 
 create or replace view v_emp_job_chk
 as
 select empno eno, ename, deptno dno, job
   from emp
  where job like 'MANAGER' 
   with check option
  ; 
  
  select * from v_emp_job_chk;
  
  insert into v_emp_job_chk
  values(9100,'������',30,'SALESMAN');
  
  select * from emp;
 
 insert into v_emp_job_chk
  values(9100,'������',30,'MANAGER');
 

-- WITH READ ONLY - �б� ����
create or replace view v_emp_job_readonly
as
select empno eno, ename, deptno dno, job
  from emp
 where job like 'MANAGER' 
  with read only -- �б� ����
 ; 
select * from v_emp_job_readonly;

insert into v_emp_job_readonly
values(9200,'��浿',30,'MANAGER');

 

select * from emp;
update emp set sal = 5000 where empno=8000;










  
select * from emp; 
 
 
 
 
 
 
 
 
 
 
 