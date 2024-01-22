select now();
-- 여기(MYSQL)는 두개다 지원 다른 프로그램은 밑에만 지원하는 경우가 있다.
select now()
from dual;

select first_name,'남' as '성 별'
from employees;

-- 비교연산자, 조건이 여러개일때, between,insert

-- ---------------------------------------------
select *
from employees
where binary first_name = 'John';

-- 이름에 이 글자만 포함된걸 찾고 싶을때

select first_name,
       last_name,
       salary
from employees
where first_name like 'L%';
-- 이름에 am 을 포함한 사원의 이름과 월급을 출력하세요
select first_name,
       salary
from employees
where first_name like '%am%';
-- 이름의 두번째 글자가 a 인 사원의 이름과 월급을 출력하세요
select first_name,
       salary
from employees
where first_name like '_a%'
;
-- 이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%'
;
-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '_a__'
;

-- null
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where salary between 13000 and 15000;


select *
from employees
where commission_pct is null;

select *
from employees
where commission_pct is not null;

# 커미션비율이 있는 사원의 이름과 월급 커미션비율을 출력하세요
select first_name,
       commission_pct
from employees
where commission_pct is not null
;

#담당매니저가 없고 커미션비율이 없는 직원의 이름과 매니저아이디 커미션 비율을 출력하세요
select first_name,
       commission_pct,
       manager_id
from employees
where manager_id is null and commission_pct is null;

#부서가 없는 직원의 이름과 월급을 출력하세요
select first_name,
       salary
from employees
where department_id is null;

-- ORDER BY
select first_name,
       salary
from employees
where salary > 10000
order by salary desc      -- 큰거부터 작은거는 desc
;                         -- 작은거부터 큰거는 asc

select *
from employees
order by employee_id asc
;

select first_name,
	   salary
from employees
order by first_name asc
;

select first_name,
       hire_date,
       salary
from employees
order by hire_date desc
;

-- 1.최근 입사한 순, 2.입사일이 같으면 월급이 많은 사람부터

select first_name,
       hire_date,
       salary
from employees
order by hire_date desc, salary desc
;

#부서번호를 오름차순으로 정렬하고 부서번호, 월급, 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc
;
#월급이 10000 이상인 직원의 이름 월급을 월급이 큰직원부터 출력하세요
select first_name,
       salary
from employees
where salary >= 10000
order by salary desc
;
#부서번호를 오름차순으로 정렬하고 부서번호가 같으면 월급이 높은 사람부터 부서번호 월급 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc, salary desc
;
#직원의 이름, 급여, 입사일을 이름의 알파벳 올림차순으로 출력하세요
select first_name,
	   salary,
       hire_date
from employees
order by first_name asc
;
#직원의 이름, 급여, 입사일을 입사일이 빠른 사람 부터 출력하세요
select first_name,
       salary,
       hire_date
from employees
order by hire_date asc
;

select first_name,
       hire_date date,
       department_id
from employees
where hire_date >= '2007-01-01'
order by date desc
;

# ******************************************************
# 단일형 함수
# ******************************************************
-- 숫자함수
select round(123.123,2),
       round(123.126,2),
       round(123.567,0),
       round(123.456),
       round(123.126,-1),
       round(123.126,-2)
from dual;       

-- 올림
select ceil(123.456)
	  ,ceil(123.789)
      ,ceil(123.7892313)
      ,ceil(987.1234)
;
-- 내림
select floor(123.456)
	  ,floor(123.789)
      ,floor(123.7892313)
      ,floor(987.1234)
;

-- truncate

 select truncate(1234.34567, 2),
		truncate(1234.34567, 3),
		truncate(1234.34567, 0),
		truncate(1235.34567, -2)
;
 
 select first_name,
        salary,
        ceil(salary/30) as 일당
 from employees
 order by salary desc;
 -- POWER(숫자, n), POW(숫자, n): 숫자의 n승
 select pow(12,2), power(12,2);
 -- SQRT(숫자): 숫자의 제곱근
 
 select sqrt(144);
 -- SIGN(숫자): 숫자가 음수이면 -1, 0이면 0, 양수이면 1
 select sign(123),
        sign(0),
        sign(-123)
;

-- ABS(숫자): 절대값
select abs(123),
	   abs(0),
       abs(-123)
;

-- GREATEST(x, y, z, ...): 괄호안의 값중 가장 큰값
 select greatest(2, 0, -2),
        greatest(4, 3.2, 5.25),
        greatest('B', 'A', 'C', 'c')
;
 
 select employee_id,
        manager_id,
        department_id,
        greatest(employee_id,manager_id,department_id)
 from employees;
 
 select max(salary)
 from employees;
 
 
 -- LEAST(x, y, z, ...): 괄호안의 값중 가장 작은값
 select least(2, 0, -2),
least(4, 3.2, 5.25),
least('B', 'A', 'C', 'c')
;
 
 -- max()
 -- min()
 -- ------------------------------------------------------------
 
 -- 문자 함수
 
 -- CONCAT(str1, str2, ..., strn): str1, str2, ..., strn을 연결
 select concat('안녕',',하세요')
 from dual;
 
 select concat('안녕','-',"'하'세여")
 from dual;
 
 select concat(first_name,' ',last_name)
 from employees;
 
 -- CONCAT_WS(s, str1, str2, ..., strn): str1, str2, ..., strn을 연결할때 사이에 s 로 연결
 select concat_ws('-','abc','123','가나다')
 from dual;
 
 select concat_ws("-", first_name, last_name, salary)
 from employees;
 
 -- LCASE(str) 또는 LOWER(str): str의 모든 대문자를 소문자로 변환
 select first_name,
        lcase(first_name),
        lower(first_name),
        lower('ABCDabc!@#$'),
        lower('가나다라마바사아자')
 from employees;
 
 -- UCASE(str) 또는 UPPER(str): str의 모든 소문자를 대문자로 변환
 select first_name,
        ucase(first_name),
        upper(first_name),
        upper('ABFCRafaf@#!'),
        upper('가나다')
 from employees;
 
 -- 문자갯수
select first_name,
       length(first_name),
       char_length(first_name),
       character_length(first_name)
from employees; 

select length('a'),
       char_length('a'),
       character_length('a')
from dual;

select length('가'),
       char_length('가'),
       character_length('가')
from dual;

-- SUBSTRING(str, pos, len) 또는 SUBSTR(str, pos, len):
select first_name,
       substr(first_name,1,3),
       substr(first_name,-3,2)
from employees
where department_id = 100;

select substr('901112-1234567',8,1),
       substr('901112-4234567',8,1)
from dual;

-- LPAD(str, len, padstr):    - RPAD(str, len, padstr): len은 총글자길이 padstr은 len-str만큼 찍어냄(오른쪽,왼쪽 R,L)
select first_name,
       lpad(first_name,10,'*'),
       rpad(first_name,10,'*')
from employees;

-- TRIM(str), - LTRIM(str), - RTRIM(str): 공배 지우기
select concat('|','          안녕하세요          ','|'),
       concat('|',trim('          안녕하세요          '),'|'),
       concat('|',ltrim('          안녕하세요          '),'|'),
       concat('|',rtrim('          안녕하세요          '),'|')
from dual;

-- REPLACE(str, from_str, to_str):str에서 from_str을 to_str로 변경
select first_name,
       replace(first_name,'a','*'),
	   replace(first_name, substr(first_name,2,3), '***')
from employees
where department_id =100;

# 날짜함수
-- CURRENT_DATE() 또는 CURDATE(): 현재 날짜를 반환
-- CURRENT_TIME() 또는 CURTIME(): 현재 시간을 반환
-- CURRENT_TIMESTAMP() 또는 NOW(): 현재 날짜와시간을 반환

select current_date(), curdate();

select current_time(), curtime();

select current_timestamp(), now();

-- ADDDATE() 또는 DATE_ADD(): 날짜 시간 더하기
-- SUBDATE() 또는 DATE_SUB(): 날짜 시간 빼기

select adddate('2021-06-20 00:00:00', INTERVAL 1 YEAR),
       adddate('2021-06-20 00:00:00', INTERVAL 1 MONTH),
       adddate('2021-06-20 00:00:00', INTERVAL 1 WEEK),
       adddate('2021-06-20 00:00:00', INTERVAL 1 DAY),
       adddate('2021-06-20 00:00:00', INTERVAL 1 HOUR),
       adddate('2021-06-20 00:00:00', INTERVAL 1 MINUTE),
       adddate('2021-06-20 00:00:00', INTERVAL 1 SECOND)
;

-- DATEDIFF(): 두 날짜간 일수차
-- TIMEDIFF(): 두 날짜시간 간 시간차
select datediff('2021-06-21 01:05:05', '2021-06-21 01:00:00'),
       timediff('2021-06-21 01:05:05', '2021-06-20 01:00:00')
;
select first_name,
       hire_date,
       round(datediff(now(), hire_date)/365,1) workday
from employees
order by workday desc;

-- ------------------------------------------------------
-- 변환함수
#변환함수: 날짜(시간)문자열
-- DATE_FORMAT(date, format): date를 format형식으로 변환
select now(),
       date_format(now(),'%y-%m-%d %H:%i:%s'),
       date_format(now(),'%Y-%m-%d(%a) %H:%i:%s %p')
from dual;

#변환함수: 문자열날짜(시간)
-- STR_TO_DATE(str, format): str를 format형식으로 변환
select datediff('2021-Jun-04', '2021-06-01')
from dual;

select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d')
from dual;

select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
from dual;

select datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'),str_to_date('2021-06-01 12:30:05', '%Y-%m-%d'))
from dual;

-- FORMAT(숫자, p): 숫자에 콤마(,) 를 추가, 소수점 p자리까지 출력
select format(1234567.89,2),
       format(1234567.89,0),
       format(1234567.89,-5)
from dual;

-- CAST(expression AS type): expression을 type형식으로 변환
-- 숫자-->문자열
select cast(1234567.89 as char);
-- 날짜-->문자열
select cast('2024-01-10' as char);
-- 문자열-->숫자 unsigned
select cast('1234' as unsigned);
-- 문자열-->날짜
select cast('2024-01-10' as date);

-- IFNULL(컬럼명, null일때값): 컬럼의 값이 null일때 정해진값을 출력
select first_name,ifnull(commission_pct,'없음')
from employees;