-- 커서
-- select한 쿼리결과를 저장하고 있는 가상의 테이블(ResultSet)
-- DECLARE
-- CURSOR 커서명 IS SELECT~~문;
-- BEGIN
--   OPEN 커서명;
--   FETCH 커서명 INTO 변수1,변수2,...;
--   CLOSE 커서명;
-- END;
DECLARE
 v_dept dept%rowtype;-- 한행의 컬럼들을 모두 저장할수 있는 구조체(structure)
 CURSOR c1 is select * from dept; -- 커서 선언
BEGIN
    dbms_output.put_line('부서번호  부서명  지역명');
    dbms_output.put_line('------------------------');
    OPEN c1; -- 커서 열기
    LOOP
      fetch c1 into v_dept.deptno, v_dept.dname, v_dept.loc;
      EXIT when c1%NOTFOUND;--커서 상수(데이타가 없으면)
      dbms_output.put_line(v_dept.deptno||' '||v_dept.dname||' '||v_dept.loc);
    END LOOP;
    CLOSE c1; -- 자원 해제
END;

-- demp 테이블 , dept테이블 salgrade테이블
-- 사원번호, 사원명, 부서번호, 부서명, 급여액,등급을 출력하세요.
-- cursor c_empInfo;
DECLARE
 v_emp emp%rowtype;
 v_dept dept%rowtype;
 v_grade salgrade%rowtype;
 CURSOR c_empInfo is 
 select empno, ename, deptno,dname,sal,grade
  from emp natural join dept, 
       salgrade 
 where emp.sal between losal and hisal;
BEGIN
    dbms_output.put_line('사원번호 사원명 부서번호 부서명  급여액  등급');
    dbms_output.put_line('---------------------------------------------');
    OPEN c_empInfo;
    LOOP
      fetch c_empInfo 
      into v_emp.empno, v_emp.ename, v_emp.deptno, v_dept.dname, v_emp.sal, v_grade.grade;
      EXIT when c_empInfo%NOTFOUND;
      dbms_output.put_line(v_emp.empno||' '||v_emp.ename||' '||v_emp.deptno||' '||v_dept.dname||' '||v_emp.sal||' '||v_grade.grade);
    END LOOP;
    CLOSE c_empInfo; -- 자원 해제
END;

-- CURSOR FOR  -선언, OPEN, FETCH, CLOSE;

-- FOR 레코드명 IN 커서명 LOOP SELECT문;~~; END LOOP;
DECLARE
  v_dept dept%rowtype;--구조체
  cursor c1 is select * from dept;
BEGIN
    dbms_output.put_line('부서번호  부서명       지역명');
    dbms_output.put_line('-----------------------------');
    for v_dept in c1 loop
     exit when c1%notfound;
     dbms_output.put_line(v_dept.deptno||' '||v_dept.dname||' '||v_dept.loc);
     end loop;
END;







select empno, ename, deptno,dname,sal,grade
  from emp natural join dept, 
       salgrade 
 where emp.sal between losal and hisal;













