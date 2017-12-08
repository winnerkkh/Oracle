-- 뷰 view
-- 테이블의 정보를 보여주기위한 가상의 객체타입
-- create or replace view 뷰명 as select 문;
create or replace view view_emp_job
as 
select empno eno, ename, deptno dno, job
  from emp
 where job like 'SALESMAN';
 
 select * from view_emp_job;
 
 -- 데이타 딕셔너리 에 있는 객체뷰
 select * from user_views;
 
 select * from emp_details_view;
 
 -- view의 목적 - 보안의 목적
 create or replace view v_emp
 as
 select empno no, job, mgr, deptno dno
  from emp;
 
 select * from emp;
 
 select * from v_emp;
 
 -- 편리성을 위한 뷰 생성
 create or replace view v_emp_cmp
 as
 select empno, ename, sal, e.deptno dno, dname, loc
   from emp e, dept d
  where e.deptno = d.deptno
  ;
 
 select * from v_emp_cmp;
 -- 데이타 딕셔너리 부분에서 view명과 select문을 조회
 select view_name,text
   from user_views;
   
select * from view_emp_job; 

insert into view_emp_job
values(8000,'홍길동',30,'SALESMAN');


-- 뷰에 그룹함수 사용
create or replace view v_emp_sal
as
select deptno deno, round(sum(sal)) sumSal,round(avg(sal)) avgSal
  from emp
  group by deptno
  ;



select * from v_emp_sal;

---insert into v_emp_sal values(40,9900,2500);

-- drop view 뷰명;
select view_name,text from user_views;
drop view v_emp_sal;

-- 뷰 옵션 
 
-- 없으면 새로 만들고 있으면 override  - or replace
create or replace view v_emp
as 
select * from emp;


-- force 테이블이 없어도 강제로 view를 만들어야 하는 경우 사용
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
 values(9000,'임꺽정',30,'SALESMAN');
 
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
  values(9100,'일지매',30,'SALESMAN');
  
  select * from emp;
 
 insert into v_emp_job_chk
  values(9100,'일지매',30,'MANAGER');
 

-- WITH READ ONLY - 읽기 전용
create or replace view v_emp_job_readonly
as
select empno eno, ename, deptno dno, job
  from emp
 where job like 'MANAGER' 
  with read only -- 읽기 전용
 ; 
select * from v_emp_job_readonly;

insert into v_emp_job_readonly
values(9200,'김길동',30,'MANAGER');

 

select * from emp;
update emp set sal = 5000 where empno=8000;










  
select * from emp; 
 
 
 
 
 
 
 
 
 
 
 