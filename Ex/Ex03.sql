-- 그룹함수

-- ex)단일행함수
select first_name,
       salary,
       round(salary,2)
from employees;
-- 그룹함수
select sum(salary)
from employees;

-- -----------------------------------
#count()
-- -----------------------------------
select count(*)
from employees;

select count(first_name)
from employees;

select count(manager_id)
from employees;
-- null인거를 카운터하지 않는다
select count(commission_pct)
from employees;

select count(*),count(commission_pct)
from employees;

select count(*)
from employees
where salary > 16000;

-- --------------------------
# sum()
-- --------------------------
select count(*),
       sum(salary),
       sum(employee_id)
from employees;

-- --------------------------
# avg()
-- --------------------------
select count(*),
       sum(salary),
       avg(salary)
from employees;

-- --------------------------
# max()/min()
-- --------------------------
select count(*),
	   max(salary),
       min(salary)
from employees;

select max(salary)
from employees;

-- --------------------------
# GROUP BY 절
-- --------------------------
select department_id,sum(salary),max(salary)
from employees
group by department_id
order by department_id asc;

select department_id,job_id,count(*)
from employees
group by department_id,job_id;

-- --------------------------
# HAVING 절
-- --------------------------
select department_id,count(*),sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

-- --------------------------
# IF~ELSE문/CASE~END문
-- --------------------------
select first_name,
       commission_pct,
       if(commission_pct is null,0,1) as state
from employees;

-- ---------------------------
/*•직원아이디, 월급, 업무아이디, 실제월급(realSalary)을 출력하세요.
실제월급은 job_id 가 'AC_ACCOUNT' 면 월급+월급*0.1,
'SA_REP' 월급+월급*0.2,
'ST_CLERK' 면 월급+월급*0.3
그외에는 월급으로 계산하세요
*/
select employee_id,
       salary,
       job_id,
       case when job_id = 'AC_ACCOUNT'then salary+salary*0.1
            when job_id ='SA_REP' then salary+salary*0.2
            when job_id = 'ST_CLERK' then salary+salary*0.3
            else salary
       end realsalary     
from employees;

/*직원의 이름, 부서번호, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가
10~50 이면 'A-TEAM'
60~100이면 'B-TEAM'
110~150이면 'C-TEAM'
나머지는 '팀없음' 으로
출력하세요.
*/
select first_name,
       department_id,
       case when department_id between 10 and 50 then 'A-TEAM'
            when department_id between 60 and 100 then 'B-TEAM'
            when department_id between 110 and 150 then 'C-TEAM'
            else '팀없음'
       end 팀     
from employees;

-- ---------------------------
# join
-- ---------------------------
-- 사원이름,부서번호
select first_name,department_id
from employees;
-- 부서명
select *
from departments;
-- join
select e.first_name,
       d.department_name,
       e.department_id,
       d.department_id
from employees e,departments d
where e.department_id = d.department_id;

select first_name,department_name
from employees,departments;

-- inner join
select e.first_name,
       d.department_name,
       e.department_id,
       d.department_id
from employees e
inner join departments d
on e.department_id = d.department_id;

select e.first_name,
       d.department_name,
       j.job_title
from employees e
inner join departments d
	  join jobs j
on e.department_id = d.department_id
and e.job_id = j.job_id
;

# 이름, 부서번호, 부서명, 업무아이디, 업무명, 도시아이디, 도시명

select *
from 




