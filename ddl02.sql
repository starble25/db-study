--ddl02 제약조건

CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE,
    name VARCHAR2(10) NOT NULL,
    hiredate DATE
);

INSERT INTO tt01
VALUES (1, '이름1', SYSDATE);

INSERT INTO tt01
VALUES (2, '이름2', SYSDATE);

select * from tt01;

INSERT INTO tt01
VALUES (3, null, SYSDATE);


CREATE TABLE tt03
(
    no NUMBER(3)
        CONSTRAINT tt03_no_uk UNIQUE,
    name VARCHAR2(10)
        CONSTRAINT tt03_name_nn NOT NULL,
--    score NUMBER(3) CHECK (score BETWEEN 0 AND 100)
    score NUMBER(3)
        CONSTRAINT tt03_score_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR2(2)
        CONSTRAINT tt03_pass_ch CHECK (pass IN ('Y', 'N'))
);

/*
Oracle DB 숫자/문자/날짜    boolean X

1:true 0:false
Y:true N:false
T:true F:false
true:true   false:false
*/

INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y');

select * from tt03;

INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y'); --중복 unique

INSERT INTO tt03
VALUES (2, null, 50, 'Y'); --이름 not null

INSERT INTO tt03
VALUES (2, '이름2', 500, 'Y'); --score 범위 0~100

INSERT INTO tt03
VALUES (2, '이름2', 50, 'T'); --pass 'Y' 'N'


