--group function
select avg(salary), max(salary), min(salary), sum(salary)
from employees;

select min(hire_date), max(hire_date)
from employees;

--과제] 최고월급과 최소월급의 차액을 조회하라.
select max(salary)- min(salary)
from employees;

select count(*)
from employees;

--과제] 70번 부서원이 몇명인지 조회하라.

select count(*)
from employees
where department_id = 70;

select count(employee_id)
from employees;

select count(manager_id)
from employees;
--그룹펑션에서는 null값은 무시한다 .

select avg(commission_pct)
from employees;

--과제]조직의 평균 커미션율을 조회하라 .

select avg(nvl(commission_pct, 0))
from employees;-

------------------------------

select avg(salary)
from employees;

select avg(distinct salary)
from employees;

select avg(all salary)
from employees;

--과제] 직원이 배치된 부서 개수를 조회하라.
select count(distinct department_id)
from employees;

-- all , distinct 다시 알아보기 

select count (distinct manager_id)
from employees;
-----------------------------

select department_id, count(employee_id)
from employees
group by department_id
order by department_id;

select employee_id
from employees
where department_id = 30;

select department_id, job_id, count(employee_id)
from employees
group by department_id
order by department_id; --error

--과제] 직업별 사원수를 조회하라
select job_id, count(employee_id)
from employees
group by job_id
order by job_id;
---------------------------

select department_id, max(salary)
from employees
group by department_id
having department_id > 50;

select department_id, max(salary) max_sal
from employees
group by department_id
having max_sal>10000;---error 별명 못씀 

select department_id, max(salary)
from employees
where department_id > 50
group by department_id;

select department_id, max(salary)
from employees
where max(salary) > 10000
group by department_id; --error having은 그룹을 골라내는것 

select job_id, sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by payroll;
----------------------
select max(avg(salary))
from employees
group by department_id;

select sum(max(avg(salary))
from employees
group by department_id; ---error , to deeply

select department_id, round(avg(salary))
from employees
group by department_id;

select department_id, avg(round(salary))
from employees; -- error 싱글+ 그룹 쓸때는 그룹바이 쓰세여

--과제] 매니저별 담당 관리직원들 중 최소월급을 조회하라.
-- 최소월급이 $6,000 초과여야한다.

select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having min(salary) > 6000
order by 2 desc;

--과제] 200년, 2001년, 2002년, 2003년도별 입사자 수를 찾는다

select sum(decode(to_char(hire_date, 'yyyy'),'2001',1,0)) "2001",
        sum(decode(to_char(hire_date, 'yyyy'),'2002',1,0)) "2002",
        sum(decode(to_char(hire_date, 'yyyy'),'2003',1,0)) "2003"
    from employees;
    
select count(case when hire_date like '2001%' then 1 else null end)"2001",
         count(case when hire_date like '2002%' then 1 else null end)"2002",
         count(case when hire_date like '2003%' then 1 else null end)"2003"
from employees;

--직업별, 부서별 월급합을 조회하라.
--        부서는 20, 50, 80이다.
select job_id, sum(decode(department_id, 20, salary))"20",
            sum(decode(department_id, 20, salary))"50",
            sum(decode(department_id, 20, salary))"80"
from employees
group by job_id;
