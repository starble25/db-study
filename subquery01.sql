--subquery

select * from emp;

--사번이 7844인 사원과 같은 부서 사람들 조회

select *
from emp
where deptno = (select deptno
                from emp
                where empno = 7844);

select deptno
from emp
where empno = 7844;


--Emp2 테이블과 Dept2 테이블을 참조하여 근무지역(dept2 테이블의 area 컬럼)이
--'Pohang Main Office' 인 모든 사원들의 사번과 이름, 부서번호를 출력하세요
select * from emp2;
select * from dept2;

SELECT dcode
FROM dept2
WHERE area = 'Pohang Main Office';

SELECT *
FROM emp2
WHERE deptno IN (SELECT dcode
                FROM dept2
                WHERE area = 'Pohang Main Office');
--           IN (1001, 1003, 1006, 1007)

SELECT *
FROM emp2
WHERE deptno = &dno;

SELECT *
FROM emp2
WHERE deptno = :dno;


SELECT *
FROM emp2
WHERE deptno IN (SELECT dcode
                FROM dept2
                WHERE area = 'Pohang Main Office');

select dcode
from dept2
where area = 'Pohang Main Office'
AND dcode = 1003;

SELECT *
FROM emp2
WHERE EXISTS (SELECT dcode
                FROM dept2
                WHERE area = 'Pohang Main Office'
                AND dcode = deptno);


SELECT *
FROM student
WHERE (grade, weight) IN (SELECT grade, MAX(weight)
                          FROM student
                          GROUP BY grade)
;


select * from emp2;
SELECT *
FROM emp2 e1
WHERE e1.pay >= (SELECT AVG(pay)
                 FROM emp2 e2
                 WHERE e1.position = e2.position)
;

SELECT AVG(pay)
FROM emp2
WHERE position = 'Section head'; --'Department', 'Deputy Section'...


select * from emp2;
select * from dept2;

--join
SELECT e.name, d.dname
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode;

--sbuquery
SELECT dname
FROM dept2
WHERE dcode = 1006;

SELECT
    name,
    (SELECT dname
     FROM dept2
     WHERE dcode = deptno) dname
     -- WHERE (dcode > deptno) dname : 다중행 결과를 만들어서 X
FROM emp2;


          --컬럼들의 평균값
select MIN(avg_pay) -- 컬럼명 AVG(pay)
from (select deptno, AVG(pay) avg_pay
        from emp2
        group by deptno);

-- emp테이블과 dept테이블을 조회하여 부서번호와 부서별 최대급여및 부서명을 출력하세요

--group by -> join
select e.deptno, e.max_sal, d.dname
from (select deptno, MAX(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno;

--join -> group by
select deptno, max(sal), dname
from (select e.sal, e.deptno, d.dname
        from emp e, dept d
        where e.deptno = d.deptno )
group by deptno, dname;


