--1.
--emp2 테이블 활용
--직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.
select * from emp2;

SELECT name, position, pay
FROM emp2
WHERE pay >ANY (SELECT pay
                FROM emp2
                WHERE position = 'Section head')
;

SELECT name, position, pay
FROM emp2
WHERE pay > (SELECT MIN(pay)
            FROM emp2
            WHERE position = 'Section head')
;

SELECT MIN(pay)
FROM emp2
WHERE position = 'Section head';

--2.
--Student 테이블.
--전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적게 나가는 학생보다
--몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력
select * from student;

SELECT name, grade, weight
FROM student
WHERE weight <ALL (SELECT weight
                    FROM student
                    WHERE grade = 2);

SELECT name, grade, weight
FROM student
WHERE weight < (SELECT MIN(weight)
                FROM student
                WHERE grade = 2)
;

SELECT MIN(weight)
FROM student
WHERE grade = 2;

--3.
--emp2, dept2 활용
--각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
--부서명, 직원명, 연봉 출력
select * from emp2;
select * from dept2;


SELECT e.name, d.dname, e.pay
FROM emp2 e, dept2 d
WHERE pay <ALL ( SELECT AVG(pay)
                 FROM emp2
                 GROUP BY deptno )
AND e.deptno = d.dcode;


SELECT e.name, d.dname, e.pay
FROM emp2 e, dept2 d
WHERE
pay < (SELECT MIN(avg(pay))
       FROM emp2 e, dept2 d
       WHERE e.deptno = d.dcode
       GROUP BY dname)
AND
e.deptno = d.dcode
;

SELECT MIN(avg(pay))
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode
GROUP BY dname;
