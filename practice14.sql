--
연습문제 

1. Dept2 테이블에 아래와 같은 내용으로 새로운 부서정보를 입력하세요.
* 부서번호 : 9010
* 부서명 : temp_10
* 상위부서 : 1006
* 지역 : temp area

select *
from dept2;

INSERT INTO DEPT2
VALUES (9010, 'temp_10', 1006, 'temp area');

select *
--delete
from dept2
where dcode IN (9010, 9020);


2. Dept2 테이블에 아래와 같은 내용으로 특정 컬럼에만 정보를 입력하세요
* 부서번호 : 9020
* 부서명 : temp_20
* 상위부서 : Business Department ( 1006 번 부서 )

INSERT INTO DEPT2
VALUES (9020, 'temp_20', 1006, null);

INSERT INTO DEPT2 (dcode, dname, pdept)
VALUES (9020, 'temp_20', 1006);


3. professor 테이블에서 profno 가 3000 번 이하의 교수들의 profno , name , pay 를 가져와서
professor4 테이블에 한꺼번에 입력하는 쿼리를 쓰세요. ( ITAS 방법을 사용하세요 )

select * from professor4;

CREATE TABLE professor4        
AS 
select profno, name, pay
from professor
where profno <= 3000;

CREATE TABLE professor5
AS
select profno, name, pay
from professor
where 1=2;

select * from professor5;

INSERT INTO professor5
select profno, name, pay
from professor
where profno <= 3000;


4. Professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.

select *
from professor
where name = 'Sharon Stone';

UPDATE professor
SET bonus = 100
--select * from professor
where name = 'Sharon Stone';