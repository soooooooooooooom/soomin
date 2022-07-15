-- single function

desc dual
select * from dual;

select lower('SQL Course') -- lower : �ҹ��ڷ� �����.
from dual;

select upper('SQL Course') -- upper : �빮�ڷ� �����.
from dual;

select initcap('SQL Course') -- initcap : �� �ܾ��� ù���ڸ� �빮�ڷ� �����
from dual;

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';

select concat('Hello', 'World') -- concat : �ܾ �ٿ��ش�.
from dual;

select substr('HelloWorld', 2, 5) -- substr : Ư�� ��ġ�� �ܾ �ڸ���.
from dual;
select substr('Hello', -1, 5)
from dual;

select length('Hello') -- length : �ܾ� ���̸� �˷��ش�.
from dual;

select instr('Hello', 'l')
from dual;
select instr('Hello', 'w') -- instr : Ư�� ���� �ִ��� ������ �˼��ִ�.
from dual;

select lpad(salary, 5, '*') -- lpad : �ʵ��� �ʺ� ���ϰ� ������ ä���. 
from employees;

select rpad(salary, 5, '*') -- rpad : �ʵ��� �ʺ� ���ϰ� �������� ä���. 
from employees;

select replace('JACK and JUE', 'J', 'BL') -- replace : Ư�� ���ڸ� �ٲ۴�.
from dual;

select trim('H' from 'Hello')
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;
-- ����] �� query���� ' '�� trim ������ ������ Ȯ��
select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id , concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'PROG';

-- ����] �Ʒ� ���忡��, where ���� like �� refactoring �϶�.
select employee_id , concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
from employees
where job_id like '%PROG';

-- ����] �̸��� J�� A�� M���� �����ϴ� ������� �̸�, �̸��� ���ڼ��� ��ȸ�϶�.
--      �̸��� �빮�� ����Ѵ�. 
select initcap(last_name), length(last_name)
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%';
-----------------------
    
select round(45.926, 2) -- round : �ݿø� (����, �ڸ���)
from dual;
select trunc(45.926, 2) -- trunc : ����
from dual;
select mod(1600, 300) -- mod : ������
from dual;

select round(45.923, 0), round(45.923)
from dual;
select trunc(45.923, 0), trunc(45.923)
from dual;

select last_name, salary, salary - mod(salary, 10000)
from employees;

-- ����] ������� �̸�, ����, 15.5% �̻�� ����(New Salary, ����), �λ��(Increase)�� ��ȸ�϶�.
select last_name, salary, round(salary * 1.155) "New Salary", round(salary * 1.155) - salary "Increase" 
from employees;
--------------------------

select sysdate  -- sysdate : ������ ����ð��� �˷��ش�.
from dual;

select sysdate + 1
from dual;
select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

-- ����] 90�� �μ� ������� �̸�, �ټӳ���� ��ȸ�϶�.
select last_name, trunc((sysdate - hire_date) / 365)
from employees
where department_id = 90;

select months_between('2022/12/31', '2022/12/31') -- months_between : ����������� �����ִ� API
from dual;

select add_months('2022/07/14', 1) -- add_months : ��� ���� ��¥�� �˼��ִ� AIP
from dual;

select next_day('2022/07/14', 6) -- next_day : �ش� ��¥ �� ù��° ������ �˷��ش�. (1~7 / ��~��)
from dual;

select next_day('2022/07/14', 'friday') -- next_day : �ش� ��¥ �� ù��° ������ �˷��ش�. (1~7 / ��~��)
from dual;

select last_day('2022/07/14') -- last_day : ���� ���ϱ�
from dual;

-- ����] 20�� �̻� ������ ������� �̸�, ù �������� ��ȸ�϶�.
--       ������ �ſ� ���Ͽ� �����Ѵ�.
select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 12 * 20;

-- ����] ������� �̸�, ���ޱ׷����� ��ȸ�϶�.
--      �׷����� $1000 �� * �ϳ��� ǥ���Ѵ�.
select last_name, lpad(' ', salary / 1000 + 1, '*') sal
from employees
order by sal desc;