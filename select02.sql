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


