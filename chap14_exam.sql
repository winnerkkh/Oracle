-- pl/sql
-- 절차적 프로그래밍
--01. --제어문 IF -ELSIF THNE ~ END IF;
    set serverout on
    DECLARE
     v_emp emp%rowtype;--emp테이블의 모든 칼럼의 속성을 가진 레코드타입
     v_dname varchar2(14);
    BEGIN
    select *
      INTO v_emp -- 한 행(row)만 받을수 있는 변수
      from emp
     where ename = UPPER('KIng');
     
     if(v_emp.deptno = 10) then
       v_dname := 'accounting';
     elsif v_emp.deptno = 20 then
       v_dname := 'research';
     elsif v_emp.deptno = 30 then
       v_dname := 'sales';
     elsif v_emp.deptno = 40 then
       v_dname := 'operations';
     end if; -- if 종료문
     
     dbms_output.put_line('사번  /  이름  / 부서명 ');
     dbms_output.put_line('------------------------');
     dbms_output.put_line(v_emp.empno||'/'||v_emp.ename||'/'||v_dname);
    END; 

set serveroutput on;

--02. BASIC LOOP문 1~10사이의 자연수의 합
DECLARE 
    n number :=1; --변순 선언 및 초기화
    tot number := 0; --변수 선언 및 초기화
BEGIN
    LOOP
     tot := tot +n;
      n:=n+1;
     if(n>10) then
        exit;
     end if; -- if문 종료
    END LOOP;
   dbms_output.put_line(n||'까지의 합 ='||tot);
END;




-- 03. for loop문 1~10까지의 합
set serverout on
DECLARE
    tot number :=0; -- 변수 선언 및 초기화
BEGIN
    for n in 1..10 loop
        tot:=tot+n;
      end loop;
      
      DBMS_OUTPUT.PUT_LINE('합계'||tot);
END;



-- 04. WHILE~LOOP
set serverout on
DECLARE
    n number :=1; --변수 선언 및 초기화
    tot number := 0;
BEGIN
  WHILE n<=10 LOOP
   tot := tot+n;
   n:=n+1;
  END LOOP;
  
  dbms_output.put_line(n||'까지의 합='||tot);
END;  


-- 05. CYRSOR의 선언 및 사용
set serverout on
DECLARE
   v_emp emp%rowtype; -- emp레코드 타입 선언
   CURSOR c1 
   is
   select * from emp
    where comm is not null;
BEGIN
 DBMS_OUTPUT.PUT_LINE('사번  이름  급여');
 DBMS_OUTPUT.PUT_LINE('--------------');
  for v_emp in c1 loop
   exit when c1%notfound;
   DBMS_OUTPUT.PUT_LINE(v_emp.empno||' ' ||v_emp.ename||' '||V_emp.sal);
   end loop;
END;

-- 05-02 open c1, fetch c1 into 변수, close c1;
DECLARE
   v_emp emp%rowtype; -- emp레코드 타입 선언
   CURSOR c1 
   is
   select * from emp
    where comm is not null;
BEGIN
 DBMS_OUTPUT.PUT_LINE('사번  이름  급여');
 DBMS_OUTPUT.PUT_LINE('--------------');
 OPEN c1; --커서 오픈
    loop
    fetch c1 into v_emp; --데이타 배치
    exit when c1%notfound; --반복문 빠져나가는 조건
    DBMS_OUTPUT.PUT_LINE(v_emp.empno||' ' ||v_emp.ename||' '||V_emp.sal);
    end loop;
    close c1; --커서 닫기
END;


select * from emp;
