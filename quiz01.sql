SELECT
    DEPTNO 부서번호,
    DNAME 부서이름,
    LOC 위치
FROM dept;

/*
SELECT
    DEPTNO AS "부서번호",
    DNAME "부서이름",
    LOC 위치
FROM dept;
*/


SELECT
    NAME || '(' || ID || ')' 교수정보,
    POSITION,
    HIREDATE 입사일자,
    EMAIL 이메일
FROM professor;


SELECT *
FROM professor;

