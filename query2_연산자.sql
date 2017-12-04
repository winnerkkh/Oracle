select * from employees
  where salary >=1500; -- 비교연산자 = 크거나 같다.
  
select * from employees
  where department_id = 10; -- equal 연산
  
--문자열 조건으로 조회하기
select * from employees
  where first_name = 'Whalen'; --문자열 조건 비교시, 문자열은 ''로 묶어서 비교

-- 날짜 조건으로 조회하기
select * from  emploees
  where hire_date>= '1981/01/01'; --날짜인 경우 비교, ''로 묶어서 비교
  
-- 논리 연산자
-- AND: 조건이 두개 이상인 경우 모든 조건이 참이어야 됨.
-- OR: 조건이 두개이상인 경우 하나라도 조건이 참이면 됨.
-- NOT: 조건이 참이면 거짓. 조건이 거짓이면 참 (조건에 만족하지 못하는 것만 검색)

select * from employees;
select * from employees
  where department_id = 100 and job_id='108'; -- 조건에 and인 경우

select * from employees
  where department_id = 100 or job_id='108'; -- 조건에 or인 경우
  
select * from employees
  where not department_id =100; -- 조건에 not인 경우

select * from employees
  where department_id <> 100; -- 조건에 not인 경우  
  
select * from employees
  where department_id !=100; -- 조건에 not인 경우  

select * from employees
  where department_id ^=100; -- 조건에 not인 경우

select * from employees
  where salary >= 1000 and salary <=1500; --비교 연산자의 구간 비교, 1000<= salary <=1500
  
select * from employees
  where salary>1000 and salary<1500; --비교 연산자의 구간 비교, 1000< salary <1500  
  
-- where조건에 비교연산 두개이상의 or 조건
select * from employees
  where commission_pct = 0.3 or commission_pct=0.5 or commission_pct = 1.4;
  
-- 1. employee테이블에서 부서코드가 100이거나 manager_id가 null이거나
-- salary가 10000 미만인 사원 추출
-- emp_id, empname, hire_date, job_id, manager_id, department_id

select employee_id as EMP_ID,
       first_name || ' ' || last_name as Name,
       hire_date as Hired_Date,
       JOB_ID,
       Manager_ID,
       Department_ID
   from employees         
   where department_id =100 or department_id is null or salary<10000;
  
  