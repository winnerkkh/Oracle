-- 테이블 관련 쿼리
-- ddl(create, alter, drop, truncate)
-- emp테이블을 이용하여 emp_bak테이블 생성
-- create table 테이블명 as select 문:

create table emp_bak as 
select * from emp;

select * from emp_bak;

create table emp_bak2 as 
select empno, ename, sal
  from emp;
  
  select * from emp_bak2;
  
--두개 이상의 테이블 join하여 새로운 테이블 생성  
create table empinfo as  
select e.empno empno, e.ename ename, e.deptno deptno, d.dname dname, s.grade grade
  from emp e, dept d, salgrade s
 where e.deptno = d.deptno
   and e.sal between s.losal and s.hisal;
   
 --테이블 구조만 생성
 create table dept_bak as
 select *
   from dept
 where 0=1; -- where 조건에 false값을 유도하는 식을 사용
 
 select * from dept_bak;
 select * from empinfo;
 
 
-- ddl문 - alter테이블
-- alter table 테이블명 [add| modify | drop] 칼럼;

select * from dept_bak;
-- 칼럼 추가 alter table 테이블명 add(칼럼명 테이타타입)
alter table dept_bak add (seq number(2));

--기존의 칼럼을 변경 alter table 테이블명 modify(칼럼명 테이타 타입)
alter table dept_bak modify seq varchar2(2);

--기존 칼럼 제거 alter table 테이블명 drop colum 칼럼명
alter table dept_bak drop column seq;

--
insert into dept_bak(deptno, dname, loc, seq)
            values(1,'영업','서울',1);

-- 특정 칼럼을 사용못하게 수정
-- set unused
alter table dept_bak set unused(seq);

insert into dept_bak(deptno, dname, loc, seq)
            values(1,'기획','인천',2);
    
alter table dept_bak drop unused columns;    

--테이블명 변경 rename
rename dept_bak to dept20;
select * from dept20;

-- 테이블 삭제 drop table 테이블명
drop table dept20;

create table emp_bak3 as select * from emp;
select *from emp;
select * from emp_bak3;

-- ddl문에서 데이블의 데이타 삭제
truncate table emp_bak3;
select * from emp_bak3;

--테이타 사전
-- user_ , all_, dba_
select table_name from user_tables; -- 해당 user가 소유한 object(table, view, index precedure, function, trigger)

-- all_user가 접근권한이 있는 objectㄷ들의 정보를 알수 있다
select * from all_tables;

-- dba_ dba(sys, system권한)으로 접속하여 볼수 있는 object들의 정보
select * from dba_tables;

select * from user_tab_cols;

select table_name, column_name, data_type, data_type_mod, data_length, data_precision, nullable
from user_tab_cols
where table_name = 'EMP'
order by column_id;


