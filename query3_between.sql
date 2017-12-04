select * from employees
    where salary >= 1000 and salary <=15000
        order by salary;
    
-- between 연산자
-- 조건구간 비교 where 칼럼 between A and B => 칼럼 >= and 칼럼

select * from employees
    where salary between 1000 and 15000;
    
-- in 연산자
-- 나열형 조건 중 하나이상 만족하면 참.
select * from emp where commission_pct in(0.3, 0.5, 1.4);

-- not in
select * from emp where commission_pct not in(0.3, 0.5, 1.4);

-- like 연산자는 조건에서 와일드카드와 함꼐 사용됨
-- %(길이 상관없이 포함), _(길이가 1인 포함)
-- 조건 = (exactly), like(포함)
select * from emp where ename like'SC%'; --길이 상관없이 sc를 포함한 문자열을 찾음

select * from emp order by ename;

select * from emp where ename like '%S'; --이름이 S로 끝나는 사원

-- select 이름이 M이 마지막에서 두번째안 사원을 추출하세요
select * from emp where ename like '%M_'; --길이가 1인 와일드카드 문자

select * from emp where ename like '__A%';  --이름의 철자가 세번째 A인 사원
select * from emp where ename not like '__A%' order by ename;  --이름의 철자가 세번째 A인 사원을 제외한 나머지 사원 출력

--조건 null여부 계산 is null / is not null;
select * from emp where comm is null;
select * from emp where comm is not null;
