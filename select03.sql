--복수행 함수

COUNT(대상) 갯수

SELECT count(*)
FROM emp;

SELECT count(empno), count(*)
FROM emp;

SELECT count(job), count(mgr), count(hiredate), count(comm)
FROM emp;

SELECT count(*)
FROM emp
WHERE comm IS NOT NULL;


SELECT SUM(sal), COUNT(*)
FROM emp;

-- 10번, 20번 부서 총 몇명, 총 급여
SELECT COUNT(*), SUM(sal)
FROM emp
WHERE deptno IN (10, 20);


SELECT AVG(height), MAX(height), MIN(height), STDDEV(height), VARIANCE(height)
FROM student;


SELECT '1학년' 학년, AVG(height) 평균키
FROM student
WHERE grade = 1
UNION ALL
SELECT '2학년', AVG(height)
FROM student
WHERE grade = 2
UNION ALL
SELECT '3학년', AVG(height)
FROM student
WHERE grade = 3
UNION ALL
SELECT '4학년', AVG(height)
FROM student
WHERE grade = 4;


SELECT...
FROM...
WHERE...
GROUP BY
ORDER BY

-- GROUP BY 특정 컬럼을 기준으로 그룹지어서 계산
-- GROUP BY 에 명시된 컬럼은 같이 조회 가능
SELECT grade, AVG(height)
FROM student
GROUP BY grade;





