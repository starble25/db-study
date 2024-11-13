--seq01

CREATE TABLE seq_test
(
    no NUMBER(3) PRIMARY KEY,
    name VARCHAR2(32)
);

select * from seq_test;

--보고 수동으로 일일이 저장
INSERT INTO seq_test VALUES(1, '가이름');

--다음 가입자 이름 '나이름' 저장
INSERT INTO seq_test VALUES(2, '나이름');

--서브쿼리로 갯수 활용
select COUNT(*) from seq_test; -- 현재 저장된 갯수
select COUNT(*)+1 from seq_test; -- 다음 저장할 차례 값

INSERT INTO seq_test VALUES ( (select COUNT(*)+1 from seq_test) , '다이름');
INSERT INTO seq_test VALUES ( (select COUNT(*)+1 from seq_test) , '라이름');
INSERT INTO seq_test VALUES ( (select COUNT(*)+1 from seq_test) , '마이름');

--테이블 관리
    --데이터 삭제로 관리하는 테이블
    select * from seq_test;
    --다 탈퇴 -> 삭제
    delete from seq_test
    where no = 3;

INSERT INTO seq_test VALUES ( (select COUNT(*)+1 from seq_test) , '바이름');

--서브쿼리로 갯수 -> no PK 값을 따져보고 활용
SELECT no from seq_test;    --pk 따지겠다
SELECT MAX(no) from seq_test;    --제일 큰 pk값
SELECT MAX(no)+1 from seq_test;    --제일 큰 pk값 다음 값

INSERT INTO seq_test VALUES ( (SELECT MAX(no)+1 from seq_test) , '바이름');
INSERT INTO seq_test VALUES ( (SELECT MAX(no)+1 from seq_test) , '사이름');

delete from seq_test
where no = 7;

INSERT INTO seq_test VALUES ( (SELECT MAX(no)+1 from seq_test) , '아이름');

delete from seq_test;

INSERT INTO seq_test VALUES ( (SELECT MAX(no)+1 from seq_test) , '자이름');

SELECT NVL(MAX(no), 0)+1 from seq_test;

INSERT INTO seq_test VALUES ( (SELECT NVL(MAX(no), 0)+1 from seq_test) , '자이름');

select * from seq_test;

INSERT INTO seq_test VALUES ( (SELECT NVL(MAX(no), 0)+1 from seq_test) , '차이름');
INSERT INTO seq_test VALUES ( (SELECT NVL(MAX(no), 0)+1 from seq_test) , '카이름');

delete from seq_test
where no = 2;

INSERT INTO seq_test VALUES ( (SELECT NVL(MAX(no), 0)+1 from seq_test) , '타이름');

--
--순차적으로 중복되지 않는 값을 사용 -> 시퀀스

CREATE SEQUENCE seq_test_pk_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 10
CYCLE
CACHE 5;
--NOCYCLE(기본값);
--(CACHE 20)

-- 시퀀스 삭제
DROP SEQUENCE seq_test_pk_seq;

--시퀀스명.nextval 다음값 호출(사용)
--시퀀스명.currval 현재값 확인

select seq_test_pk_seq.nextval from dual;
select seq_test_pk_seq.currval from dual;

CREATE SEQUENCE seq_test_pk_seq
INCREMENT BY 1
START WITH 1;
--MIN/MAX 체크X
--NOCYCLE
--CACHE 20

SELECT * FROM seq_test;
--delete from seq_test;
select seq_test_pk_seq.nextval from dual;

INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'A이름');

INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'B이름');
INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'C이름');
INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'D이름');


--시퀀스 값 확인
select seq_test_pk_seq.currval from dual; --현재값4 nextval 5, 1씩증가
--1이 될 수 있도록 증가값을 변경
ALTER SEQUENCE seq_test_pk_seq INCREMENT BY -4;
ALTER SEQUENCE seq_test_pk_seq MINVALUE 0;
--시퀀스 1회 실행
select seq_test_pk_seq.nextval from dual;
--다시 증가값 설정 변경
ALTER SEQUENCE seq_test_pk_seq INCREMENT BY 1;


