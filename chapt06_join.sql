-- ī��ǰ�
-- a���̺��� ��� x b���̺��� ��� = �����̺��� �߻������� ��� 

select * from emp, dept;


-- �����̺� �߻������� ��� ��쿡�� Ư��Į������ ���� �´� ��츸 ����(join)
select * 
  from emp, dept
 where emp.deptno = dept.deptno;
 
-- = EQUI JOIN
select emp.empno as "��� ��ȣ", emp.ename as "��� �̸�", 
       dept.deptno as "�μ� ��ȣ", dept.dname as "�μ���"
  from emp, dept
 where emp.deptno = dept.deptno;
   
   select * from dept;
-- = EQUI JOIN
select emp.empno as "��� ��ȣ", emp.ename as "��� �̸�", 
       dept.deptno as "�μ� ��ȣ", dept.dname as "�μ���"
  from emp, dept
 where emp.deptno = dept.deptno
   and emp.empno=7788;
 
select e.empno as "��� ��ȣ", e.ename as "��� �̸�", 
       D.deptno as "�μ� ��ȣ", d.dname as "�μ���"
  from emp e, dept d
 where e.deptno = d.deptno
   and e.empno=7788;
  
-- oracle���� ������ ANSI JOIN(ǥ�� ������) 
 -- EQUI JOIN -NATURAL JOIN (9i���� �߰�)
 -- ���� ���̺� ���� �̸����� �����ϴ� Į���� �ܵ����� Į���� ǥ��
 SELECT e.empno, e.ename, 
        d.dname, deptno
   from emp e natural join dept d
   where e.empno = 7788
   ;
   
 -- EQUI JOIN - JOIN ~USING
 select e.empno, e.ename, d.dname, deptno
   from emp e join dept d
    using(deptno)
  where e.empno = 7788;
  
-- EQUI JOIN JOIN ~ ON
 select e.empno, e.ename,
         d.dname, e.deptno
  from emp e join dept d
   on (e.deptno = d.deptno)
 where e.empno = 7788
 ;
 
 
 
 
 
-- NON-EQUI JOIN  >= <=
select * from salgrade;

select empno, ename, sal, grade
  from emp join salgrade
   on (emp.sal between salgrade.losal and salgrade.hisal)
   ;

select empno, ename, sal, grade
  from emp , salgrade s
  where emp.sal between s.losal and s.hisal 
   ;
   
select empno, ename, sal, grade
  from emp , salgrade s
  where emp.sal >= s.losal and  emp.sal <= s.hisal 
   ;

select * 
  from emp e, dept d, salgrade s
 where e.deptno = d.deptno
   and e.sal between s.losal and s.hisal
;
 
 
 -- self join
select * from emp;
select * 
  from emp a, 
        emp b
 where a.mgr = b.empno
 ;
 
-- outer join
select e.empno, e.ename, manager.ename
  from emp e join emp manager
    on( e.mgr = manager.empno(+)) -- ����Ŭ ���� �����ϴ� outer join��� (+) <== ������ �������ʿ� ÷��
    ;
    
select e.empno, e.ename, manager.ename
  from emp e left outer join emp manager
    on( e.mgr = manager.empno) -- ����Ŭ ���� �����ϴ� outer join��� (+)
    ;
    


select * from emp;

 
 