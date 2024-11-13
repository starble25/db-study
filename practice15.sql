--테이블 생성시, product_quiz 테이블명으로 생성

CREATE TABLE product_quiz
(
product_id INTEGER NOT NULL,
product_code VARCHAR(8) NOT NULL,
price INTEGER NOT NULL
);

INSERT INTO product_quiz VALUES (1, 'A1000011', 10000);
INSERT INTO product_quiz VALUES (2, 'A1000045', 9000);
INSERT INTO product_quiz VALUES (3, 'C3000002', 22000);
INSERT INTO product_quiz VALUES (4, 'C3000006', 15000);
INSERT INTO product_quiz VALUES (5, 'C3000010', 30000);
INSERT INTO product_quiz VALUES (6, 'K1000023', 17000);


select * from product_quiz;


--1.단순 계산먼저
select 0 PRICE_GROUP, COUNT(*) PRODUCTS
from product_quiz
where price BETWEEN 0 AND 9999
UNION ALL
select 10000, COUNT(*)
from product_quiz
where price BETWEEN 10000 AND 19999
UNION ALL
select 20000, COUNT(*)
from product_quiz
where price BETWEEN 20000 AND 29999
UNION ALL
select 30000, COUNT(*)
from product_quiz
where price BETWEEN 30000 AND 39999;

select 30000 PRICE_GROUP, (select COUNT(*)
                            from product_quiz
                            where price BETWEEN 30000 AND 39999) PRODUCTS
from dual;


--2. group by
select TRUNC(price/10000), price/10000
from product_quiz;

select TRUNC(price/10000)*10000 price_group, COUNT(*) products
from product_quiz
group by TRUNC(price/10000)
order by price_group;


--3. subquery
select price price_group, count(*) products
from (
        select TRUNC(price/10000)*10000 price
        from product_quiz)
group by price
order by price;

