use hrdb;

select*from employees;

select*from departments;
/**************************
-- select 문 주석
# 주석
***************************/
select*from locations;

select*from countries;

select*from regions;

select*from jobs;

select*from job_history;


select first_name,salary
from employees;

-- 모든 직원의 직원아이디(employee_id),이름 (fisrt_name), 성(last_name)
-- 을 출력하세요
select employee_id,fisrt_name,last_name from employees;

select first_name,phone_number,hire_date,salary from employees;

select first_name,last_name,salary,phone_number,email,hire_date from employees;

select employee_id as empNO,
       first_name as 'f-name',
       salary as '월 급'
from employees;


select first_name as 이름,
       phone_number as 전화번호,
       hire_date as 입사일,
       salary as 월급
from employees;

select job_id as '사 번',
       first_name as 이름,
       last_name as 성,
       salary as 월급,
       phone_number as 전화번호,
       email as 이메일,
       hire_date as 입사일
from employees;


select first_name,
       salary 월급,
       salary-100 '월급-식대',
       salary*12 연봉,
       salary*12+5000 보너스포함,
       salary/30 일급,
       employee_id%3 '워크샵 팀'
from employees;

select job_id*12
from employees;

-- 컬럼합치기
select first_name,
	   last_name,
concat(first_name,' ',last_name) name,
concat(first_name,' ',last_name,' hire date is ', hire_date) name2
from employees;


select first_name,
       salary*12 연봉,
       '(주)개발자' company,
       3 상태
from employees;

-- 테이블 명 생략
select now();

select now()
from dual;

select 123*5;


-- where 절

select first_name, department_id
from employees
where department_id = 10;

select first_name,
       salary
from employees
where salary >= 15000;

select first_name,
       hire_date
from employees
where hire_date >= '2007-01-01';

select first_name,
       salary
from employees
where first_name = 'Lex';

select first_name,
       salary
from employees
where salary >= 14000
and salary <= 17000;

select first_name,
       hire_date
from employees
where hire_date >= '2004-01-01'
and hire_date <= '2005-12-31';

select first_name,
	   salary
from employees
where salary between 14000 and 17000;


select first_name,
       last_name,
       salary
from employees
where first_name = 'Neena'
or first_name = 'Lex'
or first_name = 'John';

select first_name,
       last_name,
       salary
from employees
where first_name in('Neena','Lew','John','David');


select first_name,
       salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100
;

select first_name,
       salary
from employees
where salary in(2100,3100,4100,5100)
;



