-- ������ ���� order by��
-- SELECT * [COL1, COL2 ....](2)
--  FROM ���̺�
--   WHERE ������ (1)
--    ORDER BY �� (3)

select * from emp order by sal; -- �⺻ ��������
select * from emp order by sal desc; -- ��������

select * from emp order by ename;
select * from emp order by hiredate;

select * from emp order by sal asc,  ename desc; -- �ΰ� �̻��� Į���� �������� ����