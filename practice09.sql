--1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 학생이름,
--1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.

SELECT s.name, s.deptno1, d.dname
FROM student s, department d
WHERE s.deptno1 = d.deptno
ORDER BY s.deptno1;

--2. emp2 테이블과 p_grade 테이블을 조회하여
--현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
--해당 직급의 연봉의 하한금액과
--상한 금액을 아래 결과 화면과 같이 출력하세요.
select * from emp2;
select * from p_grade;

SELECT
    e.name,
    e.position,
    TO_CHAR(e.pay, '999,999,999') PAY,
    TO_CHAR(p.s_pay, '999,999,999') LOWPAY,
    TO_CHAR(p.e_pay, '999,999,999') HIGHPAY
FROM emp2 e, p_grade p
WHERE e.position IS NOT null
      AND
      e.position = p.position(+);

--3. Emp2 테이블과 p_grade 테이블을 조회하여
--사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
--예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
--나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.
select * from emp2;
select * from p_grade;

SELECT
    e.name,
    TRUNC( (MONTHS_BETWEEN('2010-05-30', e.birthday) / 12) + 1 ) 한국나이,
    e.position 지금포지션,
    p.position 나이포지션
FROM emp2 e, p_grade p
WHERE TRUNC( (MONTHS_BETWEEN('2010-05-30', e.birthday) / 12) + 1 ) BETWEEN p.s_age AND p.e_age;



select
    MONTHS_BETWEEN('2010-05-30', '2000-01-01'),
    MONTHS_BETWEEN('2024-01-05', '2024,03,05')
from dual;

select
    birthday,
    '2010-05-30',
    TO_CHAR(birthday, 'YYYY') d1,
    2010 - TO_CHAR(birthday, 'YYYY') d2,
    -- DATE - DATE
    -- TRUNC( ('2010-05-30' - birthday)/365, 0 )
    --             CHAR     -  DATE
    TRUNC( (TO_DATE('2010-05-30') - birthday)/365, 0 )
from emp2;


--4 . customer 테이블과 gift 테이블을 Join하여
--고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때
--Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.
select * from customer;
select * from gift;

SELECT
    c.gname,
    c.point,
    g.gname
FROM customer c, gift g
WHERE c.point > g.g_start
      AND
      g.gno = 7;
      --g.gname = 'Notebook';

SELECT
    c.gname,
    c.point,
    'Notebook' GNAME_1
FROM customer c, gift g
WHERE c.point BETWEEN g.g_start AND g.g_end
      AND
      g.gno >= 7;

--5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요.
--단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
select * from professor;

SELECT
    profno,
    name,
    hiredate,
    RANK() OVER (ORDER BY hiredate) - 1 COUNT
FROM professor;

SELECT
    p1.profno, p1.name, p1.hiredate, COUNT(p2.profno) COUNT
    -- COUNT(*) : OUTER JOIN > Audie Murphy 행 1개 추가됨 > COUNT = 1
FROM professor p1, professor p2
WHERE p1.hiredate > p2.hiredate(+)
GROUP BY p1.profno, p1.name, p1.hiredate
ORDER BY hiredate;

--6. emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요.
--단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
select * from emp;

SELECT
    empno,
    ename,
    hiredate,
    RANK() OVER (ORDER BY hiredate) - 1 COUNT
FROM emp;

SELECT
    e1.empno,
    e1.ename,
    e1.hiredate,
    COUNT(e2.empno) COUNT
FROM emp e1, emp e2
WHERE e1.hiredate > e2.hiredate(+)
GROUP BY e1.empno, e1.ename, e1.hiredate
ORDER BY e1.hiredate;

