-- ���̺� ���� ����
-- ddl(create, alter, drop, truncate)
-- emp���̺��� �̿��Ͽ� emp_bak���̺� ����
-- create table ���̺�� as select ��:

create table emp_bak as 
select * from emp;

select * from emp_bak;

create table emp_bak2 as 
select empno, ename, sal
  from emp;
  
  select * from emp_bak2;
  
--�ΰ� �̻��� ���̺� join�Ͽ� ���ο� ���̺� ����  
create table empinfo as  
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, s.grade grade
  from emp e, dept d, salgrade s
 where e.deptno = d.deptno
   and e.sal between s.losal and s.hisal;
   
 --���̺� ������ ����
 create table dept_bak as
 select *
   from dept
 where 0=1; -- where ���ǿ� false���� �����ϴ� ���� ���
 
 select * from dept_bak;
 select * from empinfo;
 
 
-- ddl�� - alter���̺�
-- alter table ���̺�� [add| modify | drop] Į��;

select * from dept_bak;
-- Į�� �߰� alter table ���̺�� add(Į���� ����ŸŸ��)
alter table dept_bak add (seq number(2));

--������ Į���� ���� alter table ���̺�� modify(Į���� ����Ÿ Ÿ��)
alter table dept_bak modify seq varchar2(2);

--���� Į�� ���� alter table ���̺�� drop colum Į����
alter table dept_bak drop column seq;

--
insert into dept_bak(deptno, dname, loc, seq)
            values(1,'����','����',1);

-- Ư�� Į���� �����ϰ� ����
-- set unused
alter table dept_bak set unused(seq);

insert into dept_bak(deptno, dname, loc, seq)
            values(1,'��ȹ','��õ',2);
    
alter table dept_bak drop unused columns;    

--���̺�� ���� rename
rename dept_bak to dept20;
select * from dept20;

-- ���̺� ���� drop table ���̺��
drop table dept20;

create table emp_bak3 as select * from emp;
select *from emp;
select * from emp_bak3;

-- ddl������ ���̺��� ����Ÿ ����
truncate table emp_bak3;
select * from emp_bak3;

--����Ÿ ����
-- user_ , all_, dba_
select table_name from user_tables; -- �ش� user�� ������ object(table, view, index precedure, function, trigger)

-- all_user�� ���ٱ����� �ִ� object������ ������ �˼� �ִ�
select * from all_tables;

-- dba_ dba(sys, system����)���� �����Ͽ� ���� �ִ� object���� ����
select * from dba_tables;

select * from user_tab_cols;

select table_name, column_name, data_type, data_type_mod, data_length, data_precision, nullable
from user_tab_cols
where table_name = 'EMP'
order by column_id;


