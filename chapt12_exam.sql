-- sequence, index
-- sequence는 번호를 자동발번하기 위한 객체
-- index는 데이타를 빠르게 검색하기 위한 객체
-- sequence는 두개의 값을 가지고 있음
-- currval(현재값), nextval(다음값)
-- 01. 시퀀스 조건 1부터 시작, 1씩 증가, 최대값 100000

create sequence emp_seq
start with 1
increment by 1
maxvalue 100000;

-- 생성 직후 sequence의 현재값(currvl)을 조회하면 오류
-- 생성 직후에는 nextval을 한번 실행 후 현재값(currval)을 조회
select emp_seq.currval from dual;
select emp_seq.nextval from dual;
select emp_seq.currval from dual;

-- sequence는 값 입력시 자동 순번으로 사용
create table emp01 as
 select empno, ename, hiredate
  from emp
where rownum <1;

select * from emp01;

-- sequence를 사용하면 입력오류 발생시 연속발번된 번호가 소실되는 경우가 발생
insert into emp01 values(emp_seq.nextval, '홍길동', '17-12-08');


-- 03. index 생성 -- B-tree 사용
-- create [unique] index indext명 on 테이블(칼럼)
create index index_emp01_ename on emp01(ename);

select ename, count(*) from emp01 group by ename;
select * from emp01;

update emp01
  set ename = '홍길동2'
 where empno=17;