--JOIN 01

select *
from emp;

select *
from dept;

--조인기준 deptno가 같은

SELECT e.empno, e.ename, d.dname, d.loc, d.deptno
FROM emp e, dept d
WHERE e.deptno = d.deptno;


SELECT e.empno, e.ename, d.dname, d.loc, d.deptno
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;

SELECT *
FROM emp e, dept d;


SELECT *
FROM student;

SELECT *
FROM professor;

SELECT *
FROM student s, professor p
WHERE s.profno = p.profno;

--INNER JOIN vs OUTER JOIN
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno(+);
--WHERE s.profno(+) = p.profno;
--WHERE p.profno = s.profno(+);

SELECT *
FROM student s LEFT OUTER JOIN professor p
--FROM student s RIGHT OUTER JOIN professor p
--FROM professor p LEFT OUTER JOIN student s
ON s.profno = p.profno;


----
SELECT
    s.name STU_NAME,
    d.dname DEPT_NAME,
    p.name PROF_NAME
FROM student s, professor p, department d
WHERE s.profno = p.profno
      AND
      s.deptno1 = d.deptno
;


SELECT
    s.name STU_NAME,
    d.dname DEPT_NAME,
    p.name PROF_NAME
FROM
    student s
    INNER JOIN professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno
;


--교수학과이름, 학생학과이름
SELECT s.name, s.deptno1, d.dname, s.profno, p.profno, p.name, p.deptno, d2.dname
FROM student s, professor p, department d, department d2
WHERE s.profno = p.profno
    AND s.deptno1 = d.deptno
    AND p.deptno = d2.deptno;


SELECT *
FROM customer;

SELECT *
FROM gift;

SELECT c.gname, c.point, g.gname
FROM customer c, gift g
WHERE c.point BETWEEN g.g_start AND g.g_end;


-- 1:1 / 1:n / n:1 / n:m
-- INNER JOIN
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno;

-- OUTER JOIN
SELECT *
FROM student s, professor p
WHERE s.profno = p.profno(+);

SELECT *
FROM student s, professor p
WHERE p.profno = s.profno(+);
--WHERE s.profno(+) = p.profno;


