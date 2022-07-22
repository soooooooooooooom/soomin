--view
--system user
grant all on hr.employees to you;

-- you user

drop view empvu80;

create view empvu80 as 
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80;

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);
    
create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;
    
desc empvu80
-----------------

drop table teams;
drop view team50;

create table teams as 
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select *
    from teams
    where team_id = 50;
    
select * from team50;

select count(*) from teams;
insert into team50
values(300, 'Marketing');
select count(*) from teams;

create or replace view team50 as
    select *
    from teams
    where team_id = 50
    with check option;
    
insert into team50 values(50, 'IT Support');
select count(*) from teams;
insert into team50 values(301, 'IT Support'); -- error/view WITH CHECK OPTION where-clause violation

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only;
    
insert into empvu10 values(501, 'abel', 'Sales');--error cannot perform a DML operation on a read-only view
--����] 50���μ������� ���, �̸�, �μ���ȣ�� ���� dept50 view�� ������,
--view�����ؼ� 50�� �μ� ������� �ٸ� �μ��� ��ġ���� �ʵ����Ѵ�. 

create or replace view dept50 as 
    select employee_id EMPNO, last_name EMPLOYEE, department_id DEPNO
    from employees
    where department_id = 50;
    with check option constraint dept50_ck;

--����[ dept50 view �� ������ ��ȸ�϶�
desc dept50

-- ����] dept view�� data�� ��ȸ�϶�.

select * from dept50;

insert into dept50 values(500, 'soom', '60');
------

drop sequence team_teamid_seq;

create sequence team_teamid_seq;

select team_teamid_seq.nextval from dual;
select team_teamid_seq.nextval from dual;
select team_teamid_seq.currval from dual;

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id = 3;

create sequence x_xid_seq
    start with 10
    increment by 5
    maxvalue 20
    nocache --�̸� �̾Ƴ��� �ʰڴ�
    nocycle;
    
select x_xid_seq.nextval from dual; -- nocycle ȿ���� �����Ѵ�. 

--����] dept ���̺��� DEPTID Į���� field value�� ����� sequence�� ������.
--      sequence �� 300�̻�, 1000���ϷΤ� �����Ѵ�. 
drop sequence dept_deptid_seq;

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000
    nocycle;
    
select dept_deptid_seq.nextval from dual;

--����] �� sequence��, dept���̺��� education �μ��� insert �϶�.

insert into dept (department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

select * from dept;
------------------

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABK';

select index_name, index_type, table_owner, table_name
from user_indexes;

--����] detp���̺��� department_name �� ���� index �� ������.
drop index dep_deptname_idx;
create index dept_deptname_idx
on departments(department_name);
--------------------

drop synonym team;

create synonym team
for departments;

select * from team;

--����] EMPLOYEES ���̺� EMPS SYSNONYM�� ������.

create synonym emps
for employees;

select * from emps