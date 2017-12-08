--그룹함수
-- sum(),avg(),count(), max(),min()
-- 그룹함수를 전체데이타를 대상으로 할때는 group by를 쓰지 않는다.
select to_char(sum(sal),'l999,999') "총 급여액",
       to_char(avg(sal),'l999,999') "평균 급여액",
       to_char(min(sal),'l999,999') "최소 급여",
       to_char(max(sal),'l999,999') "최대 급여"
 from emp;  
  
  
-- max(), min()
select min(hiredate), max(hiredate)
  from emp;

--그룹함수에서 null 사용
select sum(comm) as "커미션", --커미션 대상들만 sum() 4건 sum한 결과
       sum(nvl(comm,0)) as "커미션2", -- 모두 sum()한 결과
       count(comm) as "커미션 대상", -- null값을 가지고 있지 않은 4건만 count()
       count(nvl(comm,0)) as "커미션 대상2", --모두 count()
       count(*) as 건수 --전체 칼럼 대상 count()
  from emp;
  
  select * from emp;
  select job from emp;
  --맡은 직무의 종류 구할때 -중ㅂ혹 제거
  select distinct job from emp;
  select count(distinct job) from emp;
  
  -- 칼럼의 중복을 제거하는 함수 distinct
  select count(distinct job) from emp;
  select count(distinct deptno) from emp;
  
-- group by 절
select job, max(ename), max(sal)
  from emp
  group by job;

select emp.deptno,
       emp.ename,
       maxSal
 from emp,    
( select deptno, max(sal) maxSal
    from emp
   group by deptno
  ) b
 where emp.deptno = b.deptno
   and emp.sal = b.maxSal
   ;



-- 평균, ave()
select round(avg(sal)) as "평균급여"
from emp;

select deptno,
      trunc(avg(sal)) as avgSal
  from emp
 group by deptno;

------------------------------------------
-- 부서별 평균급여 이상을 받는 사원들을 구하시오
-- empno, ename, sal
 select b.deptno deptno,b.empno empno, b.ename ename, b.sal sal, a.avgSal avgSal
   from emp b,
    (select deptno,
            trunc(avg(sal)) as avgSal
       from emp a
      group by deptno) a
  where b.deptno = a.deptno
    and b.sal >= a.avgSal
;
 -----------------------------------------------                             

-- having 절: group by 한 결과를 필터링 하는 조건
select deptno, max(sal)
  from emp
 group by deptno
 having max(sal)>=3000;

-- job 'MANAGER'제외 한 사원들 중 급여 총액 5000넘는 직급, 총액 출력
select job,         -- ②
        count(*),
        sum(sal)
   from emp
  where trim(job) not like 'MANAGER' -- ①
  group by job            --③
  having sum(sal)>=5000   --④
   order by sum(sal)      --⑤
  ;

select * from emp




  