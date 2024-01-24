-- ----------------------------
# left outer join
-- ----------------------------

select e.department_id,
       e.first_name,
       d.department_name
from employees e
left outer join departments d
     on e.department_id =d.department_id;

-- ---------------------------
# righr outer join
-- ---------------------------
select e.first_name,
       e.employee_id,
       e.department_id
from employees e
right outer join departments d
      on e.department_id = d.department_id;

-- ----------------------------
#full outer join
-- ----------------------------      
     
(select e.employee_id,
        e.department_id,
        e.first_name,
        d.department_name
from employees e
left join departments d
     on e.department_id = d.department_id
)     
union   
(select e.employee_id,
        e.department_id,
        e.first_name,
        d.department_name
from employees e
right join departments d
      on e.department_id=d.department_id
);

select employee_id,
       first_name,
       manager_id,
       department_id,
       job_id
from employees;

select e.first_name,
       d.department_name
from employees e,departments d
where  e.department_id=d.department_id;

select e.employee_id,
       e.first_name,
       m.first_name manager_id
from employees e,employees m
where e.manager_id = m.manager_id;
 
 select e.first_name,
        e.salary,
        l.location_id,
        l.street_address,
        l.city
 from employees e,locations l
 where e.salary = l.location_id
 ;
 -- --------------------------
 # subquery
 -- --------------------------
 -- 딘의 월급
 select salary
 from employees
 where first_name = 'Den';
 
-- 전체
select first_name,
       salary
from employees
where salary >= 11000;

-- 합치기
select first_name,
       salary
from employees
where salary >= (select salary
 from employees
 where first_name = 'Den');