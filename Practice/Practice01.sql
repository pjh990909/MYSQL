/*문제 1. 
전체직원의 다음 정보를 조회하세요. 정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터
 출력이 되도록 하세요. 이름(first_name last_name),  월급(salary),  전화번호(phone_number),
 입사일(hire_date) 순서이고 "이름", "월급", "전화번호", "입사일" 로 컬럼이름을 대체해 보세요.
 입사일이 같으면 abc순(오름차순)으로 출력합니다.
*/
select concat(first_name,last_name) 이름,
	   salary 월급,
       phone_number 전화번호,
       hire_date 입사일
from employees
order by 입사일 asc, 이름 asc;

/*문제2.
업무(jobs)별로 업무이름(job_title)과 최고월급(max_salary)을 월급의 내림차순(DESC)로 정렬하세요.
*/
select job_title 업무이름,
       max_salary 최고월급
from jobs
order by 최고월급 desc;

/*
문제3.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율,
 월급을 월급이 많은사람부터 출력하세요.
*/
select first_name 이름,
       manager_id 매니저아이디,
       commission_pct 커미션비율,
       salary 월급
from employees
where manager_id is not null and commission_pct is null
order by 월급 desc;

/*문제4.
최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을 
최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.
*/
select job_title 이름,
       max_salary 최고월급
from jobs
where max_salary >=10000
order by 최고월급 desc;


/*문제5.
월급이 14000 미만 10000 이상인 직원의 이름(first_name), 월급, 커미션퍼센트 를  월급순(내림차순) 
출력하세오. 단 커미션퍼센트 가 null 이면 0 으로 나타내시오
*/
select first_name 이름,
       salary 월급,
       commission_pct 커미션비율
from employees;
