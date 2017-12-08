-- 카디션곱
-- a테이블의 행수 x b테이블의 행수 = 투테이블간의 발생가능한 모든 

select * from emp, dept;


-- 두테이블간 발생가능한 모든 경우에서 특정칼럼끼리 서로 맞는 경우만 추출(join)
select * 
  from emp, dept
 where emp.deptno = dept.deptno;
 
-- = EQUI JOIN
select emp.empno as "사원 번호", emp.ename as "사원 이름", 
       dept.deptno as "부서 번호", dept.dname as "부서명"
  from emp, dept
 where emp.deptno = dept.deptno;
   
   select * from dept;
-- = EQUI JOIN
select emp.empno as "사원 번호", emp.ename as "사원 이름", 
       dept.deptno as "부서 번호", dept.dname as "부서명"
  from emp, dept
 where emp.deptno = dept.deptno
   and emp.empno=7788;
 
select e.empno as "사원 번호", e.ename as "사원 이름", 
       D.deptno as "부서 번호", d.dname as "부서명"
  from emp e, dept d
 where e.deptno = d.deptno
   and e.empno=7788;
  
-- oracle에서 차용한 ANSI JOIN(표준 쿼리문) 
 -- EQUI JOIN -NATURAL JOIN (9i에서 추가)
 -- 양쪽 테이블에 같은 이름으로 존재하는 칼럼을 단독으로 칼럼명만 표시
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
    on( e.mgr = manager.empno(+)) -- 오라클 에서 제공하는 outer join방식 (+) <== 정보가 부족한쪽에 첨부
    ;
    
select e.empno, e.ename, manager.ename
  from emp e left outer join emp manager
    on( e.mgr = manager.empno) -- 오라클 에서 제공하는 outer join방식 (+)
    ;
    


select * from emp;

 
 