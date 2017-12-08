-- 권한 유저권한, 객체 권한
-- create session, create table, create view, create sequence
-- 권한부여
-- 사용자 생성
create user usertest04 identified by pass4;
-- 사용자 생성 후에는 권한이 없는 상태
-- grant 권한 to 사용자;
-- 
grant create session to usertest04;
-- 
grant create table to usertest04;
-- 테이블 생성위치 변경
alter user usertest04 default tablespace users;
--테이블 생성공간 확보
alter user usertest04 quota 2m on users;

-- 객체(table, view, sequence, procedure)에 대한 권한
-- grant 권한(select,insert,updae,delte,execute) 
-- on object
-- to 사용자 [with grant option];
select count(*) from emp;
-- with grant option으로 권한 부여
grant select on emp to usertest04 with grant option;
-- usertest04에서 hr.emp 조회 가능
select count(*) from hr.emp;
-- usertest04에서 같은 권한을 다른유저(usertest02)에 부여 가능
grant select on hr.emp to usertest02;
 select count(*) from hr.emp;

--권한 회수 revoke
-- usertest04에서 usertest02에 부여한 권한 회수
revoke select on hr.emp from usertest02;
-- hr에서 usertest04에 부여한 권한 회수
revoke select  on hr.emp from 


-- role 권한을 특정 목적단위로 묶어서 과리하는 단위
-- DBA(ADMIN이 처리할수 있는 권한 ), 
-- CONNECT(CREATE SESSION ~ CREATE SYNONYM), 
-- RESOURCE(CREATE TABLE ~ CREATE CLUSTER) 
grant connect to usertest04;
grant resource to usertest04;

-- 사용자 정의 Role 생성
-- create role 롤명 grant 부여할 권한 to 유저;
create role roletest01;--권한 생성
grant create session, create table, create view to roletest01;--권한 집어넣기
grant roletest01 to usertest04;

-- 부여한 role 정보 조회
select * from role_sys_privs order by role;
select * from user_role_privs order by username;

create role roletest02;
grant select on hr.emp to roletest02;

-- 객체에 부여된 권한 조회
select * from role_tab_privs where table_name like UPPER('emp');
























select * from dba_data_files;

