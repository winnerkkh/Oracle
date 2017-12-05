-- ���� �Լ�
-- upper()�빮��
-- lower() �ҹ���
-- initcap() ù���ڸ� �빮��

select 'Oracle mania', 
    upper('Oracle mania'),
    lower('Oracle mania'),
    initcap('Oracle mania')
from dual;


select empno, initcap(ename), initcap(job)
  from emp
  order by empno;
  
select empno, initcap(ename), initcap(job)
  from emp
 where upper(ename) = upper('scoTT') -- �빮�ڳ��� ��
  order by empno;

select empno, initcap(ename), initcap(job)
  from emp
 where lower(ename) = lower('scoTT') -- �ҹ��ڳ��� ��
  order by empno;
  
-- ���ڿ� ���� �Լ�
-- length(), length()
select length('Oracle mania'), length('����Ŭ���Ͼ�') from dual;
select lengthb('Oracle mania'), lengthb('����Ŭ���Ͼ�') from dual;

-- ���� ���� �Լ�
-- concat(), substr(), substrb(), instr(), lpad(), rpad(), trim()
select 'Oracle ' || 'mania'
  from dual;  
 select concat('Oracle ', 'Mania') from dual;

-- 'Oracle', ' ', 'mania', 'emp',' ', 'user'
select 'Oracle'||' '||'mania'||','||'emp'||' '||'user'
from dual;

select concat(concat(concat('Oracle',' '), concat('mania',',')),
       concat(concat('emp',' ').'user'))
    from dual;
    
--���ڿ� �߶󳻱� substr(���, ������ġ, ������ ����)
select substr('Oracle mania', 4,3), --����
       substr('Oracle mania', -4,3) --����
   from dual;
    
select *
  from emp
 where substr(ename,-1,1) = 'N';

select *
  from emp
 where ename like '%N'; -- 'N'���� ������ �̸�
 
 --��¥�� ����Ÿ �ڸ���
select *
  from emp
 where substr(hiredate,1,2) = '87'; --���ڿ� �ڸ���
 
select *
  from emp
 where to_char(hiredate, 'YY') = '87'; -- dataŸ���� ����Ÿ������ ��ȯ�� �ڸ���
 
select *
  from emp
 where hiredate like '87%';
 
-- �ѱ� ���ڿ� �߶󳻱�
select substr('����Ŭ�ŴϾ�', 3, 4),
       substrb('����Ŭ�ŴϾ�', 3, 4)
  from dual;
  
-- ���ڿ����� Ư�� ������ ��ġ�� ã�� �Լ� instr(���, ã������, ������ġ, ã�� ����)
select instr('Oracle mania', 'a') from dual; -- ù��° ��Ÿ���� ��ġ;
select instr('Oracle mania', 'a', 5 ,2) from dual; -- �ι�° ��Ÿ���� ��ġ
select instr('Oracle mania', 'a', 1 ,2) from dual; -- �ι�° ��Ÿ���� ��ġ

--
select instr('����Ŭ�ŴϾ�', '��'), --������ ������ ã��
       instrb('����Ŭ�ŴϾ�', '��') --���ڸ� byte������ ã�� 
  from dual;

select * from emp where instr(ename, 'R', 3, 1) =3; --''
select * from emp where ename like '__R%';

-- hiredate ��¥ // ()80/02/22)=> - - (80-02-22)
select empno,
       ename,
       concat(substr(hiredate,instr(hiredate,'/',1)-2,2),'-') ||
       substr(instr(hiredate,'/')+1,2) ||
       substr(hiredate,instr(hiredate,'/',1,2)+1,2)
from emp;

--pad(lpad,rpad)
select ename,lpad(sal,10,'*')
 from emp; --���� ä���
  
  -- pad(lpad, rpad)
select ename, lpad(sal,10,'*')
  from emp; --������ ä���
  
--���ڿ� ���� ���� �ϼ� trim();
select ' Oracle mania ', 
  ltrim(' Oracle mania '), --���� ���� ����
  rtrim(' Oracle mania ') --������ ��������
 from dual;
 
 -- ���ڿ� ���� ���� �Լ� trim();
select length(' Oracle mania '),
    length(ltrim(' Oracle mania ')), --���� ���� ����
    length(rtrim(' Oracle mania ')) --������ ���� ����
    from dual;
 
 -- Ư�� ���� �����Լ�
select 'Oracle mania',
    trim('O' from 'Oracle mania')
 from dual;
 
 --���� ��� (������, ����) �� �߶󳻱�
 select ' Oracle mania ',
        length(' Oracle mania '),
        trim(' Oracle mania '),
        length(trim(' Oracle mania '))
 from dual;     
 
 
 
 
 
 
 
 -- emp���̺���, �Ի����� '87/02/03' -> 1987�� 02�� 03�Ϸ� ���� �� ���
 -- empno, ename, hiredate from emp;
 
 --�����Լ�
--round, trunc ,mod

SELECT
    87.7654,
    round(87.7654), --�Ҽ��� ù°�ڸ����� �ݿø�
    round(87.7654,2), --�Ҽ��� ��° �ڸ��� �ݿø�
    round(98.7654,-1) --����1�ڸ����� �ݿø� -> round(9.87654)*10
    
FROM
    dual;
    
 --trunc()
SELECT
    98.7654,
    trunc(98.7654), 
    trunc(98.7654,2),
    trunc(98.7654,-1)
FROM
    dual;
 
 -- mod(��1, ��2)
 select mod(31,2),
        mod(31,5),
        mod(31,8)
    from dual;
    
 --��� �޿��� 500���� ���� ������
 select empno, ename, sal, mod(sal, 500)
  from emp;
    