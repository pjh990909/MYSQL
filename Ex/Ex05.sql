/****************************************
5일차 수업 SubQuery
****************************************/

select *
from employees
where first_name = 'Den';

select *
from employees
where salary >= 11000;

select *
from employees
where salary >= (select salary
				 from employees
                 where first_name = 'Den');


/*
월급을 가장 적게 받는 사람의 이름, 월급, 사원번호는?
1.직원테이블에서 월급 1000원 받는 사람을 구한다
2.1000<---직원테이블에서 최소월급
3.두개를 합친다
*/
select *
from employees
where salary = (최소월급);

select min(salary)
from employees;

select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
			    from employees);

/*
평균 월급보다 적게 받는 사람의 이름, 월급을 출력하세요?
*/
select *
from employees
where salary < (평균월급);

select avg(salary)
from employees;

select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees);
                
/*in
부서번호가 110인 직원의 급여와 같은 월급을 받는
모든 직원의 사번, 이름, 급여를 출력하세요
*/
select *
from employees
where salary = (부서번호110);

select salary
from employees
where department_id = 110;

select employee_id,
       first_name,
       salary
from employees
where salary in (select salary
			    from employees
                where department_id = 110);
                
/*                
각 부서별로 최고급여를 받는 사원의 이름과 월급을 출력하세요
*/
select *
from employees
where salary = (최고급여);

select max(salary)
from employees
group by department_id;

select first_name,
	   salary,
       department_id
from employees
where (department_id,salary) in (select department_id,max(salary)
                                 from employees
                                 group by department_id);


-- ANY
/*
부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(or연산--> 8300보다 큰)
*/
-- 월급이 15000보다 큰 직원의 이름,급여를 출력하세요
select first_name,
	   salary
from employees
where salary > 15000;

select salary
from employees
where department_id = 110;

select first_name,
	   salary
from employees
where salary > any (select salary
				from employees
				where department_id = 110);
                
/*부서번호가 110인 직원의 급여 보다 큰 모든 직원의
이름, 급여를 출력하세요.(and연산--> 12008보다 큰)            
*/    
select first_name,
	   salary
from employees
where salary > 15000;

select salary
from employees
where department_id = 110;    

select first_name,
	   salary
from employees
where salary > all (select salary
				from employees
				where department_id = 110);

/*
각 부서별로 최고급여를 받는 사원을 출력하세요
*/
select *
from employees
where salary = (최고급여);

select max(salary),department_id
from employees
group by department_id;

select department_id,
	   first_name,
       salary
from employees
where (salary,department_id) in (select max(salary),department_id
                                from employees
                                group by department_id);
                                
                                
                                
select e.department_id,e.employee_id,e.first_name,e.salary
from employees e ,(select max(salary) maxsalary,department_id
			       from employees
				   group by department_id) s
where e.department_id = s.department_id
and e.salary = s.maxsalary;

-- ---------------------------------------
# limit
-- ---------------------------------------
select *
from employees
order by employee_id asc
limit 1,5;

/*
07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
*/
select first_name,salary,hire_date
from employees
where hire_date >= '2007-01-01'
and hire_date <= '2007-12-31'
order by salary desc
limit 2,5;

select hire_date
from employees;