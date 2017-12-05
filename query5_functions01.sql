-- 문자 함수
-- upper()대문자
-- lower() 소문자
-- initcap() 첫글자만 대문자

select 'Oracle mania', 
    upper('Oracle mania'),
    lower('Oracle mania'),
    initcap('Oracle mania')
from dual;


select empno, initcap(ename), initcap(job)
  from emp
  order by empno;
  
select empno, initcap(ename), initcap(job)
  from emp
 where upper(ename) = upper('scoTT') -- 대문자끼리 비교
  order by empno;

select empno, initcap(ename), initcap(job)
  from emp
 where lower(ename) = lower('scoTT') -- 소문자끼리 비교
  order by empno;
  
-- 문자열 길이 함수
-- length(), length()
select length('Oracle mania'), length('오라클마니아') from dual;
select lengthb('Oracle mania'), lengthb('오라클마니아') from dual;

-- 문자 조작 함수
-- concat(), substr(), substrb(), instr(), lpad(), rpad(), trim()
select 'Oracle ' || 'mania'
  from dual;  
 select concat('Oracle ', 'Mania') from dual;

-- 'Oracle', ' ', 'mania', 'emp',' ', 'user'
select 'Oracle'||' '||'mania'||','||'emp'||' '||'user'
from dual;

select concat(concat(concat('Oracle',' '), concat('mania',',')),
       concat(concat('emp',' ').'user'))
    from dual;
    
--문자열 잘라내기 substr(대상, 시작위치, 추출할 갯수)
select substr('Oracle mania', 4,3), --정순
       substr('Oracle mania', -4,3) --역순
   from dual;
    
select *
  from emp
 where substr(ename,-1,1) = 'N';

select *
  from emp
 where ename like '%N'; -- 'N'으로 끝나는 이름
 
 --날짜의 데이타 자르기
select *
  from emp
 where substr(hiredate,1,2) = '87'; --문자열 자르기
 
select *
  from emp
 where to_char(hiredate, 'YY') = '87'; -- data타입을 문자타입으로 변환후 자르기
 
select *
  from emp
 where hiredate like '87%';
 
-- 한글 문자열 잘라내기
select substr('오라클매니아', 3, 4),
       substrb('오라클매니아', 3, 4)
  from dual;
  
-- 문자열내의 특정 문자의 위치를 찾는 함수 instr(대상, 찾을문자, 시작위치, 찾을 순번)
select instr('Oracle mania', 'a') from dual; -- 첫번째 나타나는 위치;
select instr('Oracle mania', 'a', 5 ,2) from dual; -- 두번째 나타나는 위치
select instr('Oracle mania', 'a', 1 ,2) from dual; -- 두번째 나타나는 위치

--
select instr('오라클매니아', '라'), --문자의 갯수로 찾음
       instrb('오라클매니아', '라') --문자를 byte단위로 찾음 
  from dual;

select * from emp where instr(ename, 'R', 3, 1) =3; --''
select * from emp where ename like '__R%';

-- hiredate 날짜 // ()80/02/22)=> - - (80-02-22)
select empno,
       ename,
       concat(substr(hiredate,instr(hiredate,'/',1)-2,2),'-') ||
       substr(instr(hiredate,'/')+1,2) ||
       substr(hiredate,instr(hiredate,'/',1,2)+1,2)
from emp;

--pad(lpad,rpad)
select ename,lpad(sal,10,'*')
 from emp; --왼쪽 채우기
  
  -- pad(lpad, rpad)
select ename, lpad(sal,10,'*')
  from emp; --오른쪽 채우기
  
--문자열 공백 제거 하수 trim();
select ' Oracle mania ', 
  ltrim(' Oracle mania '), --왼쪽 공백 제거
  rtrim(' Oracle mania ') --오른쪽 공백제거
 from dual;
 
 -- 문자열 공백 제거 함수 trim();
select length(' Oracle mania '),
    length(ltrim(' Oracle mania ')), --왼족 공백 제거
    length(rtrim(' Oracle mania ')) --오른쪽 공백 제거
    from dual;
 
 -- 특정 문자 제거함수
select 'Oracle mania',
    trim('O' from 'Oracle mania')
 from dual;
 
 --앞위 모두 (오른쪽, 왼쪽) 다 잘라내기
 select ' Oracle mania ',
        length(' Oracle mania '),
        trim(' Oracle mania '),
        length(trim(' Oracle mania '))
 from dual;     
 
 
 
 
 
 
 
 -- emp테이블에서, 입사일을 '87/02/03' -> 1987년 02월 03일로 변경 후 출력
 -- empno, ename, hiredate from emp;
 
 --숫자함수
--round, trunc ,mod

SELECT
    87.7654,
    round(87.7654), --소수점 첫째자리에서 반올림
    round(87.7654,2), --소수점 둘째 자리로 반올림
    round(98.7654,-1) --정수1자리에서 반올림 -> round(9.87654)*10
    
FROM
    dual;
    
 --trunc()
SELECT
    98.7654,
    trunc(98.7654), 
    trunc(98.7654,2),
    trunc(98.7654,-1)
FROM
    dual;
 
 -- mod(값1, 값2)
 select mod(31,2),
        mod(31,5),
        mod(31,8)
    from dual;
    
 --사원 급여를 500으로 나눈 나머지
 select empno, ename, sal, mod(sal, 500)
  from emp;
    