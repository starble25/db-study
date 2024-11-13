--dml02 merge

-- 신발가게 날짜별 매출
DROP TABLE SHOE_M;
CREATE TABLE SHOE_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10)
);

-- 옷가게 날짜별 매출
DROP TABLE CLOT_M;
CREATE TABLE CLOT_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10)
);

-- 본사 전체 매출
DROP TABLE COMP_M;
CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10)
);

CREATE TABLE COMP_M
(
    w_date DATE,
    s_code NUMBER(3), --매장고유코드
    sales NUMBER(10),
    type VARCHAR2(2) --가게 구분 코드 'C' 옷가게 , 'S' 신발가게
);


INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 1, 5000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 1, 10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 1, 20000)
select * from dual;

UPDATE SHOE_M
SET sales = 9000
WHERE w_date = '2024-11-02';

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 50, 9000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 50, 13000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 50, 95000)
select * from dual;

UPDATE CLOT_M
SET sales = 94000
WHERE w_date = '2024-11-06';



select * from SHOE_M;

select * from CLOT_M;

select * from COMP_M;

--DELETE -> 다시 새로 INSERT  통으로 교체

--DELETE FROM COMP_M;

INSERT INTO COMP_M
select * from SHOE_M;

INSERT INTO COMP_M
select * from CLOT_M;

select s_code, SUM(Sales)
from comp_m
group by s_code;

select SUM(Sales)
from comp_m
where TO_CHAR(w_date, 'MM') = 11;


--하나의 가게 + 날짜 중복X
MERGE INTO comp_m m
USING SHOE_M s
ON (m.w_date = s.w_date)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);

MERGE INTO comp_m m
USING CLOT_M s
ON (m.w_date = s.w_date)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);


select * from COMP_M;
    
--날짜별 여러가게

--날짜별 데이터 추가
INSERT ALL
INTO SHOE_M VALUES (TO_DATE('2024-11-01'), 2, 15000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'), 2, 20000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'), 2, 80000)
select * from dual;

INSERT ALL
INTO CLOT_M VALUES (TO_DATE('2024-11-04'), 60, 19000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'), 60, 33000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'), 60, 62000)
select * from dual;

select * from SHOE_M;

select * from CLOT_M;

select * from COMP_M;

MERGE INTO comp_m m
USING SHOE_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);

MERGE INTO comp_m m
USING CLOT_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales);


select s_code, SUM(Sales)
from comp_m
group by s_code;

select w_date, SUM(Sales)
from comp_m
group by w_date
order by w_date;

select SUM(Sales)
from comp_m
where TO_CHAR(w_date, 'MM') = 11;

--가게구분 코드

select * 
from comp_m;        --신발가게 매출만 or 옷가게 매출 

select *
from SHOE_M;

MERGE INTO comp_m m
USING SHOE_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales, 'S');

MERGE INTO comp_m m
USING CLOT_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN   --조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN --조건에 일치하는게 없으면
    INSERT VALUES (s.w_date, s.s_code, s.sales, 'C');


select type, s_code, sum(sales)
from comp_m
group by type, s_code;