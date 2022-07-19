--subquerry
select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'Abel');

--과제] Kochhar 에게 보고하는 사원들의 이름, 직업, 부서번호 을 조회하라.
select last_name, job_id, department_id
from employees
where manager_id = (select employee_id
                    from employees
                    where last_name = 'Kochhar');

select last_name, job_id, salary
from employees
where job_id = (select job_id
                from employees
                where last_name = 'Ernst')
and salary > (select salary
            from employees
            where last_name = 'Ernst');
            
--과제] able 과 같은 부서에서 일하는 동료들의 이름, 입사일을 조회하라.

select last_name, hire_date
from employees
where department_id = (select department_id
                        from employees
                        where last_name = 'Abel')
and last_name <> 'Abel'
order by 1;

--과제] IT부서에서 일하는 사원들의 부서번호, 이름, 직업을 조회하라
select department_id, last_name, job_id
from employees
where department_id = (select department_id
                        from departments
                        where department_name = 'IT');

select last_name, salary
from employees
where salary > (select salary
                from employees
                where last_name = 'King');--error/서브값의 리턴값은
                                        --하나여야한다.
                                        
select last_name, jpb_id, salary
from employees
where salary = (select min(salary)
                from employees);
                
select department_id, min(salary)
from employees
group by department_id
having min(salary)> (select min(salary)
                        from employees
                        where departmemt_id = 50);
                        
--과제] 회사 평균 월급 이상 버는 사원들의 사번, 이름, 월급을 조회하라.
-- 월급 내림차순 정렬한다
select employee_id, last_name, salary
from employees
where salary >= (select avg(salary)
                from employees)
order by 3;

select employee_id, last_name
from employees
where salary = (select min(salary)
                from emplyees)
                group by department_id);--error
                
                
select employee_id, last_name
from employees
where salary in(select min(salary)
                from employees
                group by department_id);
                
--과제] 이름에 u가 포함된 사원과 같은 부서에서 일하는 동료들의 사번,
--이름을 조회하라.

select employee_id, last_name,
from employees
where department_id in(select department_id
                        from employees
                        where last_name like'%u%');
 --비교할 대상이 n개일때 in 사용
 
 --과제] 1700번 지역에 위치한 부서에서 일하는 사원들의 이름, 직업
 -- 부서번호를 조회하라.
 
select last_name, job_id, department_id
from employees
where department_id in(select department_id
                    from departments
                    where location_id = 1700);

select employee_id, last_name
from employees
where salary = any(select min(salary)
                from employees
                group by department_id);
                
select employee_id, last_name, job_id, salary
from employees
where salary < any(select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <>'IT_PROG';

select employee_id, last_name, job_id, salary
from employees
where salary < all(select salary
                    from employees
                    where job_id = 'IT_PROG')
and job_id <>'IT_PROG';

--과제] 60번 부서의 일부사원보다 급여가 많은 사원들의 이름을 조회하라.
select last_name
from employees
where salary > any(select salary
                    from employees
                    where department_id = 60);
                    
--과제] 회사평균 월급보다, 그리고 모든 프로그래머보다 월급을 더 받는
-- 사원들의 이름, 직업, 월급을 조회하라
select last_name, job_id, salary
from employees
where salary > all(select salary
                from employees
                where job_id ='IT_PROG')
and salary > (select avg(salary)
                from employees);
-----------

--no row
select last_name
from employees
where salary in (select salary
                from employees
                where job_id = 'IT'); -- sub에서 리턴되는값이없으면 main도없음
--null
select last_name
from employees
where employee_id in (select manager_id
                        from employees);
                        
select last_name
from employees
where employee_id not in (select manager_id
                        from employees);

--과제] 위 문장으로 all 연산자로 refactoring하라

select last_name
from employees
where employee_id <>all(select manager_id
                    from employees);
-----------------------------

select count(*)
from departments;

select count(*)
from departments d
where exists (select *
                from employees e
                where e.department_id = d.department_id);
                
                select count(*)
from departments d
where not exists (select *
                from employees e
                where e.department_id = d.department_id); --이부분 이해안됨

--과제] 직업을 바꾼 적이 있는 사원들의 사번, 이름, 직업을 조회하라.
select * 
from job_history 
order by employee_id;               
