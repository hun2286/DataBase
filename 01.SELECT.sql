-- CHAPTER 01. SELECT

-- 주석 색깔 바꾸기 : 도수 > 환경설정 > 코드편집기 > PL/SQL 주석
-- 글자 크기 키우기 : 도구 > 환경설정 > 글꼴

-- 주석 형태(1) : --
-- 주석 형태(2) : /**/ -> 여러 줄을 한번에 주석처리

/*
1. SQL 문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 꼭 세미클론(;)을 찍어줘야 한다.
4. SQL 실행 단축키 : Ctrl + Enter , F9
*/

DESC EMPLOYEES;

SELECT FIRST_NAME FROM EMPLOYEES;

-- [ SELECT 절 기본 사용방법 ]

-- SELECT 조회 할 컬럼명
-- FROM   조회 할 테이블 이름

SELECT FIRST_NAME, EMAIL FROM EMPLOYEES;

-- 직원 테이블에서 직원ID, 전화번호 부서ID, LAST_NAME 을 출력
SELECT EMPLOYEE_ID
     , PHONE_NUMBER
     , DEPARTMENT_ID
     , LAST_NAME 
  FROM EMPLOYEES;

-- 직원 테이블에서 직원ID, 급여, 매니저아이디 출력
SELECT EMPLOYEE_ID,
       SALARY,
       MANAGER_ID
FROM   EMPLOYEES;

-- 부서 테이블에서 부서ID, 부서명, LOCATION_ID 를 출력
DESC DEPARTMENTS

SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
     , LOCATION_ID
FROM   DEPARTMENTS;

-- *(아스타리스크) : 전체를 의미, 전체 조회

-- 직원테이블의 모든 정보를 출력

SELECT *
FROM   EMPLOYEES ;

-- 부서테이블의 모든 정보를 출력, 몇개의 부서가 있는지
SELECT *
FROM   DEPARTMENTS;

-- 직업테이블의 모든 정보를 출력
SELECT *
  FROM JOBS;

-- 직원테이블에서 JOB_ID를 출력
SELECT * FROM EMPLOYEES;

SELECT JOB_ID
  FROM EMPLOYEES;

-- DISTINCT : 데이터 중복을 제거 해주는 명령어

-- SELECT [ALL/DISTINCT] 컬럼이름
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;

-- 직원테이블에서 부서ID를 중복을 제거하여 출력
SELECT * FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 직원테이블에서 입사일 정보를 중복을 제거하여 출력
SELECT * FROM EMPLOYEES;

SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES;
  
-- 직원테이블에서 JOB_ID와 부서ID를 중복을 제거하여 출력
SELECT * FROM EMPLOYEES;

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;

-- DISTINCT 뒤에 2개 이상의 컬럼을 적으면 
-- 한쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 다르게 취급되서 중복제거가 정상적으로 안된다.

DESC EMPLOYEES;

-- 컬럼의 자료형이 숫자형, 날짜형 이면 숫자 연산이 가능 (+, -, *, /)

-- 직원의 직원ID, 이름(FIRST_NAME), 급여정보를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 12
  FROM EMPLOYEES;
  
-- 별칠 사용하기
-- Alias 라고 하며 한눈에 보기 좋게 설정 할 수 있다.
-- AS 라는 키워드를 사용하여 별칭을 지정한다.

-- 별칭 사용 방법 <3번을 가장 많이 사용>
-- 1. SELECT 컬럼이름 별칭
-- 2. SELECT 컬럼이름 "별칭"
-- 3. SELECT 컬럼이름 AS 별칭
-- 4. SELECT 컬럼이름 AS "별칭"

-- 직원테이블에서 직원의 이름과 급여정보 연봉의 정보를 출력
-- 연봉은 직원연봉 이라는 별칭을 사용해서 출력
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY * 12 AS 직원연봉
  FROM EMPLOYEES;
  
-- 직원테이블에서 이름, 입사일, 입사일 다음날, 입사일 이튿날을 출력
-- 다만 입사일 다음날은 입사일_다음날로 별칭을 사용해서 출력
-- 입사일 이튿날은 입사일 이튿날로 별칭을 사용해서 출력
DESC EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE, 
       HIRE_DATE + 1 AS "입사일_다음날",
       HIRE_DATE + 2 AS "입사일 이튿날"
  FROM EMPLOYEES;
  
-- ORDER BY 절
-- 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할 때 사용한다.
-- SQL 실행순서에서 가장 마지막에 실행 된다.
-- 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순 (ASC)

-- ASC(Ascending) : 오름차순 정렬 (1,2,3,4,5 ...)
-- DESC(Descending) : 내림차순 정렬 (10,9,8,7 ...)

-- ORDER BY 기본 사용방법

-- SELECT 조회하고자 하는 컬럼 이름
-- FROM   조회하고자 하는 테이블 이름
-- ORDER BY 특정 컬럼을 이용해서 정렬

-- 직원의 모든 정보를 출력
-- 단 급여 기준으로 오름차순을 적용하여 출력
SELECT * 
  FROM EMPLOYEES
ORDER BY SALARY DESC;

-- 최근에 입사한 날짜를 기준으로 직원의 이름과 입사한 날짜를 출력
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- 직원 테이블에서 직원ID, 부서ID, 이름, 급여 순으로 출력
-- 단, 부서ID는 오름차순으로, 급여는 내림차순으로 출력
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;
-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 순서대로 내림차순 정렬이 된 것
-- 먼저 부서ID를 오름차순으로 정렬 한 후에 급여를 내림차순으로 정렬을 한 것이다.

-- NULL 이란?
-- NULL 값이란 데이터의 값이 완전히 비어있는 상태를 의미한다.
-- 값이 존재하지 않거나 정해지지 않는 것을 의미한다.
-- 숫자0과 빈 문자열 ' '은 NULL값이 아니다.
-- NULL은 연산하면 결과값은 무조건 NULL이 나온다.
-- NULL을 비교하면 결과값은 무조건 FALSE가 나온다.

SELECT * FROM EMPLOYEES;

-- 문제1) 직원테이블에서 직원ID, 보너스, 보너스 두배의 정보를 출력
-- 보너스 두배는 UP_BONUS라는 별칭을 사용해서 출력

SELECT EMPLOYEE_ID, COMMISSION_PCT, 
       COMMISSION_PCT * 2 AS UP_BONUS
  FROM EMPLOYEES
ORDER BY UP_BONUS ASC;

-- 문제2) 문제1에서 UP_BONUS의 결과 값을 출력을 해보고 결과 값을 확인
-- 왜 그렇게 결과 값이 나왔는지 설명




