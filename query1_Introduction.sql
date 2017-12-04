-- �ּ�
-- sql���� select��
-- select Į����1, Į����2, ... from ���̺��;
-- ��ü Į�� ��ȸ�ô� *(wildī�幮��) ���;
select * from countries;
select * from departments
          where department_id = 100;

SELECT
    *
FROM
    departments;
 -- select [DISTICNT] {*|column[alias]...}    
 -- from table
 -- [WHERE conditione]
 -- [GROUP BY group_by_experssion]
 -- [HAVING troup_condition]
 -- [ORDER BY column];
 
-- ���������
-- +,-,*,/
-- ������ ���Į������ ���꿡 �����ڰ� ����.
-- ���ڿ� ���� ������ : �չ���||�޹��� 
-- ��Ī(alias) as �̸�

SELECT
    first_name || last_name,
    salary as salary,
    salary * 12 as yearSal
FROM employees;

-- commission_pctĮ��: salary�� �� ����
-- null ; Ŀ�̼��� ���� �μ� �Ҽ� ����
-- Ŀ�̼� ��: �Ҽ������� ǥ��

select * from employees;

-- Į������ null�� ��� ������ ����� null
-- nbl(Į��, ��ü��) <- Į���� ���� null�� ��� 0���� ��ü�ϴ� �Լ�

select employee_id as empid, 
       first_name || last_name as ename, 
       salary as salary, 
       salary*nvl (commission_pct, 0) as commission
    from employees;

-- ����1. employee���̺���
-- ������� id��, �̸�, �޿�, �Ի�����, ����(�޿�+�޿�*Ŀ�̼���)
-- �� ����ϼ���

select employee_id as EMP_ID,
       first_name || ' ' || last_name as Name,
       salary as Annual_Salary,
       hire_date as Hired_Date,
       (salary*12) + (salary*nvl(commission_pct,0)) as Total_Salary
    from employees;

--�μ� ���̺� ��ȸ
select * from DEPARTMENTS;

--Į���� null���� ���� : is null / is not null
select manager_id
    from departments
      where manager_id is not null
       order by manager_id; -- order by �⺻ ��������
       
       
 -- location_id �ߺ�
 -- �ߺ� ���� -- distinct
select manager_id, location_id
  from departments;
  
-- dual ���̺�(����Ŭ�� ������ ������� �ϱ⿡, ���� ���̺��� ���� ���, ������ ���̺��� dual�� ȣ���Ͽ� ����Ÿ ���� �о�帲)
-- dummyĮ���� �ϳ� �ִ� ���� �ϼ��� ���̺�
select sysdate from dual; -- ���� ��¥
select 2*3 from dual; -- ����
select 5-4 from dual; -- 
select 18/6 from dual;

-- ����Ŭ���� ����Ÿ�� ����� ��ȸ����
-- rownum: ����Ÿ�� �Էµ� ���� ���� ����.
select sysdate from departments where rownum = 1; -- 1���� ���
select rownum, employee_id, first_name || last_name from employees;
  
       