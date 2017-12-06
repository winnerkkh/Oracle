--01. substr(), instr(문자열, 패턴[,시작,출현회수])
 select * from emp;
 select substr(hiredate,instr(hiredate,'/')-2,2) 년도,
        substr(hiredate,instr(hiredate,'/')+1,2) 달
   from emp;
 
 --02. substr(), 4월에 입사한 사원 where 입사일 = 4월, 
 -- to_number() 문자열 ->숫자
 select *
   from emp
  where to_number(substr(hiredate,instr(hiredate,'/')+1,2)) = 4 
  ;
 
 --03. mod() 나머지 구하는 함수
 -- mod(값1, 값2)  짝수 : 어떤 수를 2로 나누어 나머지가 0 이면 짝수
 -- where 조건에서 사원번호가 짝수 
 select * 
   from emp
  where mod(empno,2) = 0
  order by empno;

-- 04. 날짜 to_char(날짜, 포맷)
select hiredate,
       to_char(hiredate, 'yy/MON/dd dy')
  from emp;

-- 05. 오늘이 올해 01/01 기준으로 몇일이 지났는지 확인
-- trunc(sysdate, 'yy') => '2017/01/01' 
select trunc(sysdate - trunc(sysdate, 'yy'))
  from dual;
 
-- 06. 
select a.empno 사원번호, a.ename 사원명,
        b.empno 매니저번호, b.ename 매니저명
  from emp a,
       emp b
 where a.mgr = b.empno;
 
 
-- nvl(값,0)
select empno, ename, nvl(mgr,0)
  from emp;



-- 07. decode()함수
-- decode(job, 'analyst', 200, 'salesman', 180, 'manager', 150, 'cleark', 100) 인상
select empno,
       ename,
       job,
       to_char(sal+decode(lower(job),'analyst',200,'salesman',180,
                               'manager',150, 'clerk',100),'l999,999')
       as upSal                               
  from emp;
