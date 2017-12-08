-- ���� ��������, ��ü ����
-- create session, create table, create view, create sequence
-- ���Ѻο�
-- ����� ����
create user usertest04 identified by pass4;
-- ����� ���� �Ŀ��� ������ ���� ����
-- grant ���� to �����;
-- 
grant create session to usertest04;
-- 
grant create table to usertest04;
-- ���̺� ������ġ ����
alter user usertest04 default tablespace users;
--���̺� �������� Ȯ��
alter user usertest04 quota 2m on users;

-- ��ü(table, view, sequence, procedure)�� ���� ����
-- grant ����(select,insert,updae,delte,execute) 
-- on object
-- to ����� [with grant option];
select count(*) from emp;
-- with grant option���� ���� �ο�
grant select on emp to usertest04 with grant option;
-- usertest04���� hr.emp ��ȸ ����
select count(*) from hr.emp;
-- usertest04���� ���� ������ �ٸ�����(usertest02)�� �ο� ����
grant select on hr.emp to usertest02;
 select count(*) from hr.emp;

--���� ȸ�� revoke
-- usertest04���� usertest02�� �ο��� ���� ȸ��
revoke select on hr.emp from usertest02;
-- hr���� usertest04�� �ο��� ���� ȸ��
revoke select  on hr.emp from 


-- role ������ Ư�� ���������� ��� �����ϴ� ����
-- DBA(ADMIN�� ó���Ҽ� �ִ� ���� ), 
-- CONNECT(CREATE SESSION ~ CREATE SYNONYM), 
-- RESOURCE(CREATE TABLE ~ CREATE CLUSTER) 
grant connect to usertest04;
grant resource to usertest04;

-- ����� ���� Role ����
-- create role �Ѹ� grant �ο��� ���� to ����;
create role roletest01;--���� ����
grant create session, create table, create view to roletest01;--���� ����ֱ�
grant roletest01 to usertest04;

-- �ο��� role ���� ��ȸ
select * from role_sys_privs order by role;
select * from user_role_privs order by username;

create role roletest02;
grant select on hr.emp to roletest02;

-- ��ü�� �ο��� ���� ��ȸ
select * from role_tab_privs where table_name like UPPER('emp');
























select * from dba_data_files;

