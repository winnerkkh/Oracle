-- synonym ���Ǿ�
-- ���̺��� ��Ī�� ����� ����ϴ� ��줷
-- create [PUBLIC] synonym �óʴԸ� FOR ��ü

create table sampletbl(
   memo varchar2(50)
);

insert into sampletbl values('������ Ǫ������');
insert into sampletbl values('�ּ��� �� �սô�');

select * from sampletbl;

grant select on sampletbl to hr;
create public synonym pub_sam for sys.sampletbl;

-- synonym ����
-- drop synonym �óʴԸ�;

drop synonym samtbl;