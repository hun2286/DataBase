-- CHAPTER 01. SELECT

-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ������� > PL/SQL �ּ�
-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �۲�

-- �ּ� ����(1) : --
-- �ּ� ����(2) : /**/ -> ���� ���� �ѹ��� �ּ�ó��

/*
1. SQL ���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �� ����Ŭ��(;)�� ������ �Ѵ�.
4. SQL ���� ����Ű : Ctrl + Enter , F9
*/

DESC EMPLOYEES;

SELECT FIRST_NAME FROM EMPLOYEES;

-- [ SELECT �� �⺻ ����� ]

-- SELECT ��ȸ �� �÷���
-- FROM   ��ȸ �� ���̺� �̸�

SELECT FIRST_NAME, EMAIL FROM EMPLOYEES;

-- ���� ���̺��� ����ID, ��ȭ��ȣ �μ�ID, LAST_NAME �� ���
SELECT EMPLOYEE_ID
     , PHONE_NUMBER
     , DEPARTMENT_ID
     , LAST_NAME 
  FROM EMPLOYEES;

-- ���� ���̺��� ����ID, �޿�, �Ŵ������̵� ���
SELECT EMPLOYEE_ID,
       SALARY,
       MANAGER_ID
FROM   EMPLOYEES;

-- �μ� ���̺��� �μ�ID, �μ���, LOCATION_ID �� ���
DESC DEPARTMENTS

SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
     , LOCATION_ID
FROM   DEPARTMENTS;

-- *(�ƽ�Ÿ����ũ) : ��ü�� �ǹ�, ��ü ��ȸ

-- �������̺��� ��� ������ ���

SELECT *
FROM   EMPLOYEES ;

-- �μ����̺��� ��� ������ ���, ��� �μ��� �ִ���
SELECT *
FROM   DEPARTMENTS;

-- �������̺��� ��� ������ ���
SELECT *
  FROM JOBS;

-- �������̺��� JOB_ID�� ���
SELECT * FROM EMPLOYEES;

SELECT JOB_ID
  FROM EMPLOYEES;

-- DISTINCT : ������ �ߺ��� ���� ���ִ� ��ɾ�

-- SELECT [ALL/DISTINCT] �÷��̸�
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;

-- �������̺��� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT * FROM EMPLOYEES;

SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- �������̺��� �Ի��� ������ �ߺ��� �����Ͽ� ���
SELECT * FROM EMPLOYEES;

SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES;
  
-- �������̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���
SELECT * FROM EMPLOYEES;

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;

-- DISTINCT �ڿ� 2�� �̻��� �÷��� ������ 
-- ���� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ��޵Ǽ� �ߺ����Ű� ���������� �ȵȴ�.

DESC EMPLOYEES;

-- �÷��� �ڷ����� ������, ��¥�� �̸� ���� ������ ���� (+, -, *, /)

-- ������ ����ID, �̸�(FIRST_NAME), �޿������� ���
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, SALARY * 12
  FROM EMPLOYEES;
  
-- ��ĥ ����ϱ�
-- Alias ��� �ϸ� �Ѵ��� ���� ���� ���� �� �� �ִ�.
-- AS ��� Ű���带 ����Ͽ� ��Ī�� �����Ѵ�.

-- ��Ī ��� ��� <3���� ���� ���� ���>
-- 1. SELECT �÷��̸� ��Ī
-- 2. SELECT �÷��̸� "��Ī"
-- 3. SELECT �÷��̸� AS ��Ī
-- 4. SELECT �÷��̸� AS "��Ī"

-- �������̺��� ������ �̸��� �޿����� ������ ������ ���
-- ������ �������� �̶�� ��Ī�� ����ؼ� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY * 12 AS ��������
  FROM EMPLOYEES;
  
-- �������̺��� �̸�, �Ի���, �Ի��� ������, �Ի��� ��Ʊ���� ���
-- �ٸ� �Ի��� �������� �Ի���_�������� ��Ī�� ����ؼ� ���
-- �Ի��� ��Ʊ���� �Ի��� ��Ʊ���� ��Ī�� ����ؼ� ���
DESC EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE, 
       HIRE_DATE + 1 AS "�Ի���_������",
       HIRE_DATE + 2 AS "�Ի��� ��Ʊ��"
  FROM EMPLOYEES;
  
-- ORDER BY ��
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ����Ѵ�.
-- SQL ����������� ���� �������� ���� �ȴ�.
-- ������ ���� ����� �������� ������ �⺻������ �������� (ASC)

-- ASC(Ascending) : �������� ���� (1,2,3,4,5 ...)
-- DESC(Descending) : �������� ���� (10,9,8,7 ...)

-- ORDER BY �⺻ �����

-- SELECT ��ȸ�ϰ��� �ϴ� �÷� �̸�
-- FROM   ��ȸ�ϰ��� �ϴ� ���̺� �̸�
-- ORDER BY Ư�� �÷��� �̿��ؼ� ����

-- ������ ��� ������ ���
-- �� �޿� �������� ���������� �����Ͽ� ���
SELECT * 
  FROM EMPLOYEES
ORDER BY SALARY DESC;

-- �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի��� ��¥�� ���
SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- ���� ���̺��� ����ID, �μ�ID, �̸�, �޿� ������ ���
-- ��, �μ�ID�� ������������, �޿��� ������������ ���
SELECT EMPLOYEE_ID, DEPARTMENT_ID, FIRST_NAME, SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;
-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������� �������� ������ �� ��
-- ���� �μ�ID�� ������������ ���� �� �Ŀ� �޿��� ������������ ������ �� ���̴�.

-- NULL �̶�?
-- NULL ���̶� �������� ���� ������ ����ִ� ���¸� �ǹ��Ѵ�.
-- ���� �������� �ʰų� �������� �ʴ� ���� �ǹ��Ѵ�.
-- ����0�� �� ���ڿ� ' '�� NULL���� �ƴϴ�.
-- NULL�� �����ϸ� ������� ������ NULL�� ���´�.
-- NULL�� ���ϸ� ������� ������ FALSE�� ���´�.

SELECT * FROM EMPLOYEES;

-- ����1) �������̺��� ����ID, ���ʽ�, ���ʽ� �ι��� ������ ���
-- ���ʽ� �ι�� UP_BONUS��� ��Ī�� ����ؼ� ���

SELECT EMPLOYEE_ID, COMMISSION_PCT, 
       COMMISSION_PCT * 2 AS UP_BONUS
  FROM EMPLOYEES
ORDER BY UP_BONUS ASC;

-- ����2) ����1���� UP_BONUS�� ��� ���� ����� �غ��� ��� ���� Ȯ��
-- �� �׷��� ��� ���� ���Դ��� ����




