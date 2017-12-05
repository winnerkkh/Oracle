-- 정렬을 위한 order by절
-- SELECT * [COL1, COL2 ....](2)
--  FROM 테이블
--   WHERE 조건절 (1)
--    ORDER BY 절 (3)

select * from emp order by sal; -- 기본 오름차순
select * from emp order by sal desc; -- 내리차순

select * from emp order by ename;
select * from emp order by hiredate;

select * from emp order by sal asc,  ename desc; -- 두개 이상의 칼럼을 기준으로 정렬