-- ��������
-- not null, unique, primary key, foreign key, check
create table customer(
id varchar(20) not null,
pwd varchar(20) not null,
name varchar(20) not null,
tel varchar(30),
address varchar(100)
);
insert into customer(id,pwd,name,tel,address)
  values (null,null,null,'010-111-1234','����');
  

-- unique �ߺ���������ʴ� ��������
drop table customer;
create table customer(
id varchar(20) unique,
pwd varchar(20) not null,
name varchar(20) not null,
tel varchar(30),
address varchar(100)
);
insert into customer(id,pwd,name,tel,address)
 values('hong','hong','ȫ�浿',null,null);
 select * from customer;
 insert into customer(id,pwd,name,tel,address)
 values('hong','hong','ȫ�浿',null,null);
 
-- key = not null + unique
drop table customer;
create table customer(
id varchar(20) primary key,
pwd varchar(20) not null,
name varchar(20) not null,
tel varchar(30),
address varchar(100)
);

select * from customer;
insert into customer(id,pwd,name,tel,address)
 values('hong','hong','ȫ�浿',null,null);
 select * from customer;
 insert into customer(id,pwd,name,tel,address)
 values('hong','hong','ȫ�浿',null,null);
 
drop table customer;
create table customer(
id varchar(20),
pwd varchar(20) not null,
name varchar(20) not null,
tel varchar(30),
address varchar(100),
constraint customer_id_pk primary key(id)
); 
 
select * from user_indexes; 

-- emp_second, dept
-- foreign key ���������� �Է½� check�ɼǰ� ���� ����
create table emp_second(
eno number(4) constraint emp_second_eno_pk primary key,
ename varchar(10),
job varchar(9),
dno number(2) constraint emp_second_dno_fk references dept(deptno)
);
select * from emp_second;
select * from dept;
insert into emp_second(eno,ename,job,dno) 
                 values(1001,'ȫ�浿',upper('manager'),10);

 insert into emp_second(eno,ename,job,dno) 
                 values(1002,'ȫ�浿',lower('manager'),20);
insert into emp_second(eno,ename,job,dno) 
                 values(1003,'������',upper('manager'),70);                 
 
 
