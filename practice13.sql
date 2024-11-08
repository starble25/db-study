--1.
--student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
select * from student;
select * from department;

--1) 다중컬럼 비교

--1-1) join
select d.dname, s.height MAX_HEIGHT, s.name, s.height
from student s, department d
where (s.deptno1, s.height) IN (select deptno1, MAX(height)
                                from student
                                group by deptno1)
AND s.deptno1 = d.deptno
;
--1-2) subquery
select (select dname
        from department
        where deptno = deptno1) DNAME,
        height MAX_HEIGHT, name, height
from student
where (deptno1, height) IN (select deptno1, MAX(height)
                            from student
                            group by deptno1)

;

--2) 인라인뷰

select t.max_height, s.name, s.height
from(select deptno1, MAX(height) max_height
        from student
        group by deptno1) t, student s
where t.deptno1 = s.deptno1
AND t.max_height = s.height;

--2-1)join
select d.dname, t.max_height, s.name, s.height
from(select deptno1, MAX(height) max_height
        from student
        group by deptno1) t, student s, department d
where t.deptno1 = s.deptno1
AND t.max_height = s.height
AND d.deptno = t.deptno1;

--2-2)subquery
select (select dname
        from department
        where deptno = t.deptno1) dname,
    t.max_height, s.name, s.height
from (select deptno1, MAX(height) max_height
            from student
            group by deptno1) t, student s
where t.deptno1 = s.deptno1
AND t.max_height = s.height;
/*
SELECT d.dname, max_height, s2.name, s2.height
FROM (SELECT deptno1, MAX(height) max_height
        FROM student s, department d
        GROUP BY s.deptno1) s, department d, student s2
WHERE s.deptno1 = d.deptno AND s2.height = max_height
;

SELECT deptno1, MAX(height) max_height
FROM student s, department d
GROUP BY s.deptno1;
*/


--2.
--student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)
select * from student;

SELECT
    s1.grade,
    s2.name,
    s2.height,
    avg_height
FROM (SELECT grade, AVG(height) avg_height
        FROM student
        GROUP BY grade) s1, student s2
WHERE s2.height > avg_height
AND s1.grade = s2.grade
ORDER BY grade
;

SELECT grade, AVG(height)
FROM student
GROUP BY grade;



select s.grade, s.name, s.height,
        (select AVG(t.height)
         from student t
         where t.grade = s.grade) avg_height
from student s
where s.height > (select AVG(t.height)
                  from student t
                  where t.grade = s.grade)
;