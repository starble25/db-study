--ddl

CREATE TABLE new_table
(
    no NUMBER(3),
    name VARCHAR2(10),
    birth DATE
);

select * from new_table;

desc new_table;

select sysdate from dual;


CREATE TABLE tt02
(
    no  NUMBER(3,1) DEFAULT 0,
    name VARCHAR2(10) DEFAULT 'NO Name',
    hiredate DATE DEFAULT SYSDATE
);

select * from tt02;


-- 테이블 복사
CREATE TABLE dept3
AS
select * from dept2;            -- 구조 + 데이터 전체 복사

select * from dept3;


CREATE TABLE dept4
AS
select dcode, area from dept2;  -- 컬럼 2개 + 데이터 복사

select * from dept4;


CREATE TABLE dept5
AS
select *                        -- 컬럼구조만 복사 (데이터 X)
from dept2
where 1=2;  --거짓 조건

select * from dept5;


-- 테이블 변경

--컬럼 추가
ALTER TABLE dept4
ADD (location VARCHAR2(10));

ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office');

--임시부터 여부를 체크   컬럼명 temp_code   'Y' 임시부서,   'N' 정식부서
ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');


select * from dept4;

--컬럼 삭제
ALTER TABLE dept4
DROP COLUMN location;


--컬럼 삭제
CREATE TABLE dept6
AS
select * from dept4;

select * from dept5;
select * from dept6;


--테이블 삭제 (rollback 불가 : 자동 commit)
DROP TABLE dept5;

TRUNCATE TABLE dept6;

