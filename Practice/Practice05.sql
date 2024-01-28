/*문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
*/
select	 first_name,
		manager_id,
		commission_pct,
		salary
from employees e
where manager_id is not null
and salary >3000
and commission_pct is null
;

/*문제2. 
각 부서별로 최고의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name), 월급 (salary), 입사일(hire_date),
 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-월급의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select  employee_id 직원번호,
		first_name 이름,
        salary 월급,
        case when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Monday') then date_format(hire_date,'%Y년 %m월 %d일(월요일)')
			when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Tuesday') then date_format(hire_date,'%Y년 %m월 %d일(화요일)')
            when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Wednesday') then date_format(hire_date,'%Y년 %m월 %d일(수요일)')
            when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Thursday') then date_format(hire_date,'%Y년 %m월 %d일(목요일)')
            when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Friday') then date_format(hire_date,'%Y년 %m월 %d일(금요일)')
            when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Saturday') then date_format(hire_date,'%Y년 %m월 %d일(토요일)')
			when date_format(hire_date,'%Y년 %m월 %d일%W') = date_format(hire_date,'%Y년 %m월 %d일Sunday') then date_format(hire_date,'%Y년 %m월 %d일(일요일)')
        end '입사일',
        replace(phone_number,'.','-') 전화번호,
        department_id 부서번호
from employees
where (department_id,salary) in (select department_id,max(salary)
								from employees
                                group by department_id)
order by salary desc;

/*문제3
매니저별 담당직원들의 평균월급 최소월급 최대월급을 알아보려고 한다.
-통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
-매니저별 평균월급이 5000이상만 출력합니다.
-매니저별 평균월급의 내림차순으로 출력합니다.
-매니저별 평균월급은 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균월급, 매니저별최소월급, 매니저별최대월급 입니다.
(9건)
*/

select *
from employees e, employees m,(select manager_id,avg(salary) avgsalary
							   from employees
                               group by manager_id) p
where e.employee_id = p.manager_id
and