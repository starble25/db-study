--1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
--교수번호화 이름, 학과명을 출력하세요
--(입사일 순으로 오름차순 정렬)

select * from professor;
select * from department;

SELECT
    p.profno,
    p.name,
    p.hiredate,
    d.dname
FROM professor p, department d
WHERE (p.deptno, p.hiredate) IN (SELECT deptno, MIN(hiredate)
                    FROM professor
                    GROUP BY deptno)
AND
p.deptno = d.deptno
ORDER BY p.hiredate
;

--2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
--(연봉순으로 오름차순 정렬)
select * from emp2;

SELECT name, position, TO_CHAR(pay, '$999,999,999') PAY
FROM emp2
WHERE (position, pay) IN (SELECT position, MAX(pay)
                            FROM emp2
                            GROUP BY position)
ORDER BY pay
;

SELECT position, MAX(pay)
FROM emp2
GROUP BY position;