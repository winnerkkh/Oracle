select * from employees
    where salary >= 1000 and salary <=15000
        order by salary;
    
-- between ������
-- ���Ǳ��� �� where Į�� between A and B => Į�� >= and Į��

select * from employees
    where salary between 1000 and 15000;
    
-- in ������
-- ������ ���� �� �ϳ��̻� �����ϸ� ��.
select * from emp where commission_pct in(0.3, 0.5, 1.4);

-- not in
select * from emp where commission_pct not in(0.3, 0.5, 1.4);

-- like �����ڴ� ���ǿ��� ���ϵ�ī��� �Բ� ����
-- %(���� ������� ����), _(���̰� 1�� ����)
-- ���� = (exactly), like(����)
select * from emp where ename like'SC%'; --���� ������� sc�� ������ ���ڿ��� ã��

select * from emp order by ename;

select * from emp where ename like '%S'; --�̸��� S�� ������ ���

-- select �̸��� M�� ���������� �ι�°�� ����� �����ϼ���
select * from emp where ename like '%M_'; --���̰� 1�� ���ϵ�ī�� ����

select * from emp where ename like '__A%';  --�̸��� ö�ڰ� ����° A�� ���
select * from emp where ename not like '__A%' order by ename;  --�̸��� ö�ڰ� ����° A�� ����� ������ ������ ��� ���

--���� null���� ��� is null / is not null;
select * from emp where comm is null;
select * from emp where comm is not null;
