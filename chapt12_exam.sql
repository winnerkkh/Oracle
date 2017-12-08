-- sequence, index
-- sequence�� ��ȣ�� �ڵ��߹��ϱ� ���� ��ü
-- index�� ����Ÿ�� ������ �˻��ϱ� ���� ��ü
-- sequence�� �ΰ��� ���� ������ ����
-- currval(���簪), nextval(������)
-- 01. ������ ���� 1���� ����, 1�� ����, �ִ밪 100000

create sequence emp_seq
start with 1
increment by 1
maxvalue 100000;

-- ���� ���� sequence�� ���簪(currvl)�� ��ȸ�ϸ� ����
-- ���� ���Ŀ��� nextval�� �ѹ� ���� �� ���簪(currval)�� ��ȸ
select emp_seq.currval from dual;
select emp_seq.nextval from dual;
select emp_seq.currval from dual;

-- sequence�� �� �Է½� �ڵ� �������� ���
create table emp01 as
 select empno, ename, hiredate
  from emp
where rownum <1;

select * from emp01;

-- sequence�� ����ϸ� �Է¿��� �߻��� ���ӹ߹��� ��ȣ�� �ҽǵǴ� ��찡 �߻�
insert into emp01 values(emp_seq.nextval, 'ȫ�浿', '17-12-08');


-- 03. index ���� -- B-tree ���
-- create [unique] index indext�� on ���̺�(Į��)
create index index_emp01_ename on emp01(ename);

select ename, count(*) from emp01 group by ename;
select * from emp01;

update emp01
  set ename = 'ȫ�浿2'
 where empno=17;