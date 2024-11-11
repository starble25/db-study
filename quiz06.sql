--emp2 dept2 테이블을 참고하여,
--
--'AL Pacino'와 "같은 지역"에서
--근무하는 직원들의 평균 연봉보다
--많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.
select * from emp2;
select * from dept2;


select empno, name, deptno,
(select dname from dept2 where dcode = deptno) dname,
(select area from dept2 where dcode = deptno) area,
pay
from emp2
where pay > (select AVG(pay)
                from emp2
                where deptno IN (select dcode
                                    from dept2
                                    where area = (select area
                                                    from dept2
                                                    where dcode = (select deptno
                                                                    from emp2
                                                                    where name = 'AL Pacino'))))
;



SELECT
    e.empno,
    e.name,
    e.deptno,
    d.dname,
    d.area,
    e.pay
FROM emp2 e, dept2 d
WHERE pay > (SELECT AVG(e.pay)
                FROM emp2 e, dept2 d
                WHERE area = (SELECT area
                                FROM emp2 e, dept2 d
                                WHERE e.deptno = d.dcode
                                AND
                                name = 'AL Pacino')
                AND
                e.deptno = d.dcode)
AND
e.deptno = d.dcode
;


SELECT AVG(pay)
FROM emp2 e, dept2 d
WHERE area IN (SELECT area
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode
AND
name = 'AL Pacino')
AND
e.deptno = d.dcode
;

SELECT area
FROM emp2 e, dept2 d
WHERE e.deptno = d.dcode
AND
name = 'AL Pacino'
;