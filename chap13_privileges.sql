--- synonym ���Ǿ�
-- ���̺��� ��Ī�� ����� ����ϴ� ���
-- CREATE [PUBLIC] SYNONYM �ó�Ը� FOR ��ü
create table sampletbl(
memo varchar2(50)
);
insert into sampletbl values('������ Ǫ������');
insert into sampletbl values('�ּ��� �� �սô�');
select * from sampletbl;

grant select on sampletbl to hr;
--
grant select on sampletbl to usertest02;
grant select on sampletbl to usertest04;
-- public �ó���� ���鶧 ������ select������ ������ ��ȸ�� �ȵ�.
create public synonym pub_sam for sys.sampletbl;
-- synonym����
-- drop synonym �ó�Ը�;
 drop synonym samtbl;
 select * from pub_sam;
 
 
 
 
 









