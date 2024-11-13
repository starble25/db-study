--ddl03


--외래키 참조하는 테이블(부모)에 존재하는 값만 저장 가능 (+null 가능)
--외래키 설정된 테이블(부모)에서 자신을 참조하는 데이터가 존재(자식)하는 경우, 삭제 불가

--외래키 삭제조건
ON DELETE CASCADE;  --부모 데이터 삭제시, 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; --부모 데이터 삭제시, 참조하는 자식 데이터 NULL 로 변경

DROP TABLE T_MEMBER;

CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30),
    club_id REFERENCES T_CLUB(id)
    --club_id --REFERENCES T_CLUB(id)
    --club_id REFERENCES T_CLUB(id) ON DELETE CASCADE
    --club_id REFERENCES T_CLUB(id) ON DELETE SET NULL
);

CREATE TABLE T_CLUB
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30)
);

select * from t_club;

INSERT INTO T_CLUB
VALUES (1, '독서');

INSERT INTO T_CLUB
VALUES (2, '등산');

INSERT INTO T_CLUB
VALUES (3, '낚시');


INSERT INTO T_MEMBER
VALUES (1, '가이름', 3);

INSERT INTO T_MEMBER
VALUES (2, '나이름', 2);

select * from T_MEMBER;

select * 
from T_MEMBER m, t_club c
where m.club_id = c.id;

INSERT INTO T_MEMBER
VALUES (3, '다이름', 1);

INSERT INTO T_MEMBER
VALUES (4, '라이름', null);

select * from t_club;
select * from T_MEMBER;

select *
--delete 
from t_club
where id = 3;

select * 
--delete
from T_MEMBER
where id = 1;

update T_MEMBER
SET club_id = null
where id = 1;

-- 데이터 딕셔너리
-- USER_ / DBA_ / ALL_
-- INDEXES / CONSTRAINTS / TABLES / SEQUENCES / SYNONYMS 
-- VIEWS / ROLE_PRIVS 

SELECT *
FROM USER_ROLE_PRIVS;

SELECT *
FROM TAB; --테이블 이름 정보

select *
from tab
where tname like '%STU%';

----
CREATE TABLE tt05
(
    id number,
    no number,
    age number,
    CONSTRAINT tt05_pk PRIMARY KEY (id, no)  --id, no 두개 컬럼을 묶어서 PK
);