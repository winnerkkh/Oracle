--nvl(컬럼,지정값) 보통 지정값을 이렇게 사용  ->  ' ' , 0
select ename,
       comm,
       nvl(comm,0),--comm의 값이 null이면 0으로 대체하라,타입이숫자면 0,문자면''
       to_char(sal*12 + nvl(comm,0),'l999,999')
  from emp;  

--nv12(칼럼, 지정값1, 지정값2) '', 0
select ename,
       sal,
       comm,
       nvl2(comm, comm,0),
       nvl2(comm, sal*12+comm, sal*12)
  from emp;    
  
--NULLIF(값1,값2) 값1==값2 면 NULL
select nullif('A','A'),nullif('A','B') from dual;
--
select nvl(nullif('A','A') ,'같다'),nvl2(nullif('A','B'),'다르다','같다')
from dual;


-- coaleasce(조건, 값1, 값2, 값3....) 함수
select ename, sal, comm,
      coalesce(comm, sal, 0)
  from emp
 order by ename;



 -- decode(표현식, true1, 값1, true2,값2, ...,default)
 select ename, deptno,
        decode(deptno,10,'회계',20,'연구',30,'영업','지원')
    from emp;
 
 select * from salgrade;
 
-- sign()함수 sign(값1,값2) 결과가 양수면1, 음수면 -1, 같은값이면 0
 select empno, ename, sal,
        decode(sign(sal-3001),1,5,0,5,
        decode(sign(sal-2001),1,4,0,4,
        decode(sign(sal-1401),1,3,0,3,
        decode(sign(sal-1201),1,2,0,2,1)))) as 등급
   from emp
  order by 등급 desc, sal desc;
  
 --case함수()
 -- case when 조건1 then 값1 
 --      when 조건2 then 값2... end
 select empno,
         ename,
         case when sal >=700 and sal<=1200 then 1
              when sal>=1201 and sal<=1400 then 2
              when sal>=1401 and sal<=2000 then 3
              when sal>=2001 and sal<=3000 then 4
              when sal>=3001 and sal<=9999 then 5
              end as salgrade
     from emp;
        
         
 
 select * from dept;        
 select distinct deptno from emp;        

