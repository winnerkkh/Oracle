-- 주석
-- sql쿼리 select문
-- select 칼럼명1, 칼럼명2, ... from 테이블명;
-- 전체 칼럼 조회시는 *(wild카드문자) 사용;
select * from countries;
select * from departments
          where department_id = 100;

SELECT
    *
FROM
    departments;
 -- select [DISTICNT] {*|column[alias]...}    
 -- from table
 -- [WHERE conditione]
 -- [GROUP BY group_by_experssion]
 -- [HAVING troup_condition]
 -- [ORDER BY column];
 
-- 산술연산자
-- +,-,*,/
-- 쿼리한 결과칼럼들의 연산에 연산자가 사용됨.
-- 문자열 결합 연산자 : 앞문자||뒷문자 
-- 별칭(alias) as 이름

SELECT
    first_name || last_name,
    salary as salary,
    salary * 12 as yearSal
FROM employees;

-- commission_pct칼럼: salary의 상여 비율
-- null ; 커미션이 없는 부서 소속 직원
-- 커미션 율: 소수점으로 표시

select * from employees;

-- 칼럼값이 null인 경우 연산의 결과는 null
-- nbl(칼럼, 대체값) <- 칼럼의 값이 null일 경우 0으로 대체하는 함수

select employee_id as empid, 
       first_name || last_name as ename, 
       salary as salary, 
       salary*nvl (commission_pct, 0) as commission
    from employees;

-- 문제1. employee테이블에서
-- 사원들의 id와, 이름, 급여, 입사일자, 연봉(급여+급여*커미션율)
-- 을 출력하세요

select employee_id as EMP_ID,
       first_name || ' ' || last_name as Name,
       salary as Annual_Salary,
       hire_date as Hired_Date,
       (salary*12) + (salary*nvl(commission_pct,0)) as Total_Salary
    from employees;

--부서 테이블 조회
select * from DEPARTMENTS;

--칼럼의 null여부 조건 : is null / is not null
select manager_id
    from departments
      where manager_id is not null
       order by manager_id; -- order by 기본 오름차순
       
       
 -- location_id 중복
 -- 중복 제거 -- distinct
select manager_id, location_id
  from departments;
  
-- dual 테이블(오라클은 형식을 맞춰줘야 하기에, 만약 테이블이 없는 경우, 가상의 테이블인 dual을 호출하여 데이타 값을 읽어드림)
-- dummy칼럼이 하나 있는 쿼리 완성용 테이블
select sysdate from dual; -- 현재 날짜
select 2*3 from dual; -- 연산
select 5-4 from dual; -- 
select 18/6 from dual;

-- 오라클에서 데이타의 행수를 조회조건
-- rownum: 데이타가 입력된 행의 수를 말함.
select sysdate from departments where rownum = 1; -- 1행을 출력
select rownum, employee_id, first_name || last_name from employees;
  
       