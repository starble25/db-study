단일행 함수

임시로 사용하는 테이블 dual


SELECT ename, INITCAP('ABCDE'), INITCAP(ename)
FROM emp;

SELECT LOWER(name), UPPER(name)
FROM student;

SELECT LENGTH('abcdasfqr'), LENGTHB('abcdasfqr'),
    LENGTH('점심'), LENGTHB('점심') -- LENGTHB : 바이트수
FROM dual;

SELECT *
FROM emp -- 이름 5글자 이상인 사람들
WHERE LENGTH(ename) >= 5;

SELECT '아침' || '점심', CONCAT('아침', '점심')
FROM dual;

SELECT '아침' || '점심' || '저녁', CONCAT( CONCAT('아침', '점심'), '저녁' )
FROM dual;

-- SUBSTR(대상, 시작지점, 자리수)
SELECT
    SUBSTR('abcdefg', 1, 3),
    SUBSTR('abcdefg', 3, 5),
    SUBSTR('abcdefg', -5, 2)
FROM dual;

SELECT 
    name, 
    SUBSTR(jumin, 3, 4) Birthday,
    SUBSTR(jumin, 3, 4) - 1 "Birthday - 1"
FROM student
WHERE deptno1 = 101;

SELECT
    INSTR('2024/11/04 10/45/45', '/', 1),
    INSTR('2024/11/04 10/45/45', '/', 6),
    INSTR('2024/11/04 10/45/45', '/', 1, 4),
    INSTR('2024/11/04 10/45/45', '/', 1, 5),
    INSTR('2024/11/04 10/45/45', '/', 16, 2)
FROM dual;

SELECT name, tel, INSTR(tel, ')') --INSTR(tel, ')', 1, 1)
FROM student
WHERE deptno1 = 201;


SELECT
    LPAD('문자', 10, '*'),
    LPAD(123, 5, 0),
    LPAD(33, 3, 0)
FROM dual;

SELECT
    LPAD(id, 10, '*'),
    RPAD(id, 10, '*')
FROM student;

SELECT LPAD(ename, 9, 123456789)
FROM emp;

-- TRIM -> 불필요한 요소 제거
-- 공백제거용
SELECT LTRIM('abcd', 'a'),
    LTRIM('abcd', 'd'),
    RTRIM('abcd', 'd'),
    RTRIM('abcd', 'b'),
    RTRIM('abcdbbbbbb', 'b'),
    LTRIM(' abcd '),
    RTRIM(' abcd '),
    TRIM(' abcd '),
    TRIM(' a b c d ')
FROM dual;


SELECT
    REPLACE('abcde', 'c', '*'),
    REPLACE('2024-11-04', '-', '/')
FROM dual;



-----------------
SELECT
    ROUND(1.66, 1),
    TRUNC(1.4567, 2),
    TRUNC(1.4567, 0),
    TRUNC(1.4567, -1),
    MOD(15, 4),
    CEIL(123.133),
    FLOOR(123.1333),
    POWER(3, 5)
FROM dual;

SELECT 
    rownum,
    CEIL(rownum/3),
    CEIL(rownum/4),
    empno,
    ename
FROM emp;
-- WHERE deptno = 30;


SELECT
    null,
    SYSDATE, -- 현재날짜시간
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-01-05', '2024,03,05'), -- 앞에날짜 - 뒤에날짜 (월로 환산)
    MONTHS_BETWEEN('2024-03-05', '2024,01,05'),
    ADD_MONTHS(SYSDATE, 3),  -- 11/4 -> 3개월수
    LAST_DAY(SYSDATE),   -- 28, 31, 30
    NEXT_DAY(SYSDATE, '수')
FROM dual;

SELECT 
    ROUND(SYSDATE),
    TRUNC(SYSDATE),
    TRUNC(123.113, 1),
    TRUNC(SYSDATE, 'MM'), -- YYMMDD
    TRUNC(SYSDATE, 'YY'),
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3,
    SYSDATE - 3,
    -- 다음달의 첫 날
    TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM'),
    LAST_DAY(SYSDATE) + 1,
    -- 전 월의 마지막 날
    TRUNC(SYSDATE, 'MM') - 1,
    LAST_DAY(ADD_MONTHS(SYSDATE, -1))
FROM dual;


---------------------------
SELECT 2 + '2' -- 자동형변환
FROM dual;

SELECT '2' || '123a'
FROM dual;

SELECT
    TO_CHAR(123),
    TO_CHAR(590493.238),
    TO_CHAR(SYSDATE),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD'),
    TO_CHAR(SYSDATE, 'YYYYMMDD'),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM dual;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR( ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS' )
FROM dual;


SELECT
    TO_CHAR(1234, '999999'), -- 9의 개수만큼 자리수
    TO_CHAR(1234, '099999'), -- 빈자리 0으로
    TO_CHAR(1234, '$99999'),
    '$' || 1234,
    TO_CHAR(1234, '999999.99'),
    TO_CHAR(1234, '99,999')
FROM dual;


SELECT 
    empno,
    ename,
    TO_CHAR(hiredate, 'YYYY-MM-DD') HIREDATE,
    TO_CHAR(sal * 12 + comm, '$99,999') SAL,
    TO_CHAR((sal * 12 + comm)* 1.15 , '$99,999') "15%인상"
FROM emp
WHERE comm IS NOT NULL;


SELECT
    TO_DATE('2024-06-02') + 3,
    TO_DATE('2024/06/02') + 3,
    TO_DATE('24/06/02') + 3,
    TO_DATE('20240602') + 3,
    LAST_DAY('2024-08-05'),
    TO_DATE('24:06:02') + 3,
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_DATE('2024-01-05', 'YYYY-MM-DD'),
    TO_DATE('2024,01,05', 'YYYY,MM,DD'),
    TO_DATE('12/10/20', 'MM/DD/YY') -- 12년 10월 20일 -> 12월 10일 20년도
FROM dual;




--NVL

SELECT
    sal,
    comm,
    sal * 12 + comm,     -- 숫자 * 12 + null
    sal * 12 + NVL(comm, 0)
FROM emp;


SELECT
    profno,
    name,
    pay,
    bonus,
    TO_CHAR( pay * 12 + NVL(bonus, 0), '999,999' ) TOTAL
FROM professor
WHERE deptno = 201;


SELECT
    NVL(null, 10),
    NVL2(123, '있다', '없다'),
    NVL2(null, '있다', '널이다')
FROM dual;


--2. 아래 화면과 같이 emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 comm 값이 있을 경우 'Exist' 을 출력하고
--   comm 값이 null 일 경우 'NULL' 을 출력하세요.
SELECT
    empno,
    ename,
    comm,
    NVL2(comm, 'Exist', 'NULL') NVL2
FROM emp
WHERE deptno = 30;

--sal*12 + comm = 총 연봉  NVL NVL2
SELECT
    empno,
    ename,
    comm,
    sal*12 + comm TOTAL,
    sal*12 + NVL(comm, 0) TOTAL2,
    sal*12 + NVL2(comm, comm, 0) TOTAL3,
    NVL2(comm, sal*12+comm, sal*12) TOTAL4
FROM emp
WHERE deptno = 30;

--DECODE
SELECT
    DECODE(10, 10, '같다', '다르다'),
    DECODE(10, 20, '같다', '다르다'),
    DECODE(10, 20, '같다'), --- DECODE(10, 20, '같다', null)
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다'),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다',  null),
    DECODE(10, 30, '30이다', 40, '40이다', 50, '50이다', 60, '60이다')
FROM dual;

SELECT
    deptno,
    name,
    DECODE(deptno, 101, '컴퓨터공학', '다른학과'),
    DECODE(deptno, 101, '컴퓨터공학'),
    DECODE(deptno, 101, '컴퓨터공학', null)
FROM professor;


SELECT
    deptno,
    name,
    DECODE(deptno, 101, '컴퓨터공학', 102, '멀티미디어', 103, '소프트웨어', 'ETC') DNAME
FROM professor;



--case
--1 1학년 2 2학년 3 3학년 4 4학년
select grade || '학년'
from student;
--1,2 저학년 3,4 고학년

SELECT 
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년') 구분,
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
    END AS "학년구분",
    CASE 
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END 학년구분
FROM student;



