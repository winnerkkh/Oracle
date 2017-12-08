-- transaction
-- insert,update, delete (DML문)
select * from dept;
insert into dept values(50,'ACCOUNTING','NEW YORK');

-- 테이블에 값 입력시 null 값을 갖는 행을 삽입
insert into dept(deptno, dname) values(60,'RandD');
update dept set dname = 'RandD' where deptno = 60; -- dml

select * from emp_bak;

insert into emp_bak
values(7000,'CANDY','MANAGER',7839,'12/05/01',0,null,30);

delete emp_bak where empno=7934;

create table dept_copy as
select * from dept;
select * from dept_copy;





