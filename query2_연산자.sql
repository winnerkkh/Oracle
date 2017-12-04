select * from employees
  where salary >=1500; -- �񱳿����� = ũ�ų� ����.
  
select * from employees
  where department_id = 10; -- equal ����
  
--���ڿ� �������� ��ȸ�ϱ�
select * from employees
  where first_name = 'Whalen'; --���ڿ� ���� �񱳽�, ���ڿ��� ''�� ��� ��

-- ��¥ �������� ��ȸ�ϱ�
select * from  emploees
  where hire_date>= '1981/01/01'; --��¥�� ��� ��, ''�� ��� ��
  
-- �� ������
-- AND: ������ �ΰ� �̻��� ��� ��� ������ ���̾�� ��.
-- OR: ������ �ΰ��̻��� ��� �ϳ��� ������ ���̸� ��.
-- NOT: ������ ���̸� ����. ������ �����̸� �� (���ǿ� �������� ���ϴ� �͸� �˻�)

select * from employees;
select * from employees
  where department_id = 100 and job_id='108'; -- ���ǿ� and�� ���

select * from employees
  where department_id = 100 or job_id='108'; -- ���ǿ� or�� ���
  
select * from employees
  where not department_id =100; -- ���ǿ� not�� ���

select * from employees
  where department_id <> 100; -- ���ǿ� not�� ���  
  
select * from employees
  where department_id !=100; -- ���ǿ� not�� ���  

select * from employees
  where department_id ^=100; -- ���ǿ� not�� ���

select * from employees
  where salary >= 1000 and salary <=1500; --�� �������� ���� ��, 1000<= salary <=1500
  
select * from employees
  where salary>1000 and salary<1500; --�� �������� ���� ��, 1000< salary <1500  
  
-- where���ǿ� �񱳿��� �ΰ��̻��� or ����
select * from employees
  where commission_pct = 0.3 or commission_pct=0.5 or commission_pct = 1.4;
  
-- 1. employee���̺��� �μ��ڵ尡 100�̰ų� manager_id�� null�̰ų�
-- salary�� 10000 �̸��� ��� ����
-- emp_id, empname, hire_date, job_id, manager_id, department_id

select employee_id as EMP_ID,
       first_name || ' ' || last_name as Name,
       hire_date as Hired_Date,
       JOB_ID,
       Manager_ID,
       Department_ID
   from employees         
   where department_id =100 or department_id is null or salary<10000;
  
  