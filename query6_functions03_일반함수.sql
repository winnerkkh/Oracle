--nvl(�÷�,������) ���� �������� �̷��� ���  ->  ' ' , 0
select ename,
       comm,
       nvl(comm,0),--comm�� ���� null�̸� 0���� ��ü�϶�,Ÿ���̼��ڸ� 0,���ڸ�''
       to_char(sal*12 + nvl(comm,0),'l999,999')
  from emp;  

--nv12(Į��, ������1, ������2) '', 0
select ename,
       sal,
       comm,
       nvl2(comm, comm,0),
       nvl2(comm, sal*12+comm, sal*12)
  from emp;    
  
--NULLIF(��1,��2) ��1==��2 �� NULL
select nullif('A','A'),nullif('A','B') from dual;
--
select nvl(nullif('A','A') ,'����'),nvl2(nullif('A','B'),'�ٸ���','����')
from dual;


-- coaleasce(����, ��1, ��2, ��3....) �Լ�
select ename, sal, comm,
      coalesce(comm, sal, 0)
  from emp
 order by ename;



 -- decode(ǥ����, true1, ��1, true2,��2, ...,default)
 select ename, deptno,
        decode(deptno,10,'ȸ��',20,'����',30,'����','����')
    from emp;
 
 select * from salgrade;
 
-- sign()�Լ� sign(��1,��2) ����� �����1, ������ -1, �������̸� 0
 select empno, ename, sal,
        decode(sign(sal-3001),1,5,0,5,
        decode(sign(sal-2001),1,4,0,4,
        decode(sign(sal-1401),1,3,0,3,
        decode(sign(sal-1201),1,2,0,2,1)))) as ���
   from emp
  order by ��� desc, sal desc;
  
 --case�Լ�()
 -- case when ����1 then ��1 
 --      when ����2 then ��2... end
 select empno,
         ename,
         case when sal >=700 and sal<=1200 then 1
              when sal>=1201 and sal<=1400 then 2
              when sal>=1401 and sal<=2000 then 3
              when sal>=2001 and sal<=3000 then 4
              when sal>=3001 and sal<=9999 then 5
              end as salgrade
     from emp;
        
         
 
 select * from dept;        
 select distinct deptno from emp;        

