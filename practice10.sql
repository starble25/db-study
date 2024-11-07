--1.
--student , department
--이름이 'Anthony Hopkins' 인 학생과 1전공이 동일한 학생들의 정보 (이름, 학과번호, 학과이름) 출력하기.
select * from student;
select * from department;

SELECT s.name, s.deptno1, d.dname
FROM student s, department d
WHERE s.deptno1 = d.deptno
--AND s.deptno1 = 103;
AND s. deptno1 = (SELECT deptno1
                    FROM student
                    WHERE name = 'Anthony Hopkins');

SELECT deptno1
FROM student
WHERE name = 'Anthony Hopkins';


--2.
--professor, department 테이블 활용.
--이름이 'Meg Ryan' 인 교수보다 나중에 입사한 사람의 이름, 입사일, 학과명 을 출력하세요.
select * from professor;
select * from department;

SELECT p.name, p.hiredate, d.dname
FROM professor p, department d
WHERE p.deptno = d.deptno
AND p.hiredate > (SELECT hiredate
                    FROM professor
                   WHERE name = 'Meg Ryan')
;

SELECT hiredate
FROM professor
WHERE name = 'Meg Ryan';

--3.
--student 테이블, 1전공이 201번 학과의 평균 몸무게보다 몸무게가 많이 나가는 학생들의 이름과 몸무게 출력하세요.
select * from student;

SELECT name, weight
FROM student
WHERE weight > (SELECT AVG(weight)
                  FROM student
                 WHERE deptno1 = 201);

SELECT AVG(weight)
FROM student
WHERE deptno1 = 201;