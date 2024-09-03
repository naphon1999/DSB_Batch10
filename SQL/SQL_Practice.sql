/* 
CREATE AT LEASE 3 TABLES
  - TRANSACTIONS
  - STAFF
  - MENU
  - INGREDIENT

  WRITE SQL QUERIES AT LEAST 3 QUERIES
  - WITH CLAUSE SUBQUERY 
  - Where Cause 
  - AGG FUNCTION & GROUP BY
*/

create table staff (
  staff_id int,
  staff_name text,
  age int,
  position text
)

insert INTO staff VALUES
  (01, 'Euro', 25, 'Owner'),
  (02, 'Fluk', 26, 'Waiter'),
  (03, 'Taung', 26, 'Receptionist'),
  (04, 'Bird', 25, 'Cook'),
  (05, 'Fia', 26, 'All rounder')

create table restaurant (
  menu text,
  description text,
  price int
)

insert INTO restaurant VALUES
  (Chilli Bacon, grilled bacon with chilli on top, $23),
  (French Toast, Australian egg with toast, $15),
  (Chipolate, french fries and chicken, $28),
  (Hamburger, American beef cheese hamburger, $26),
  (Gelato, Italian milk ice cream, $13)

create table transaction (
  transaction_id int,
  transaction_date date,
  menu text,
  quantity int,
  staff_name text
)

insert into transaction values 
  (20300101001, '2030-01-01', 'Chipolate', 2, 'Euro'),
  (20300101002, '2030-01-01', 'Hamburger', 1, 'Fluk'),
  (20300101003, '2030-01-01', 'Gelato', 4, 'Fia'),
  (20300101004, '2030-01-01', 'Chipolate', 1, 'Fluk'),
  (20300101005, '2030-01-01', 'French Toast', 1, 'Euro'),

.mode table
.header on

-- Join table in order to get overall transaction
select 
  t.transaction_id,
  t.transaction_date,
  t.menu,
  t.quantity,
  t.menu*t.quantity as total_price,
  r.price,
  t.staff_name,
  s.staff_id
from transaction as t
join restautant as r on t.menu = r.menu
join staff as s on t.staff_name = s.staff_name
;

-- with clause
with overall_transaction as (
  select 
    t.transaction_id,
    t.transaction_date,
    t.menu,
    t.quantity,
    t.menu*t.quantity as total_price,
    r.price,
    t.staff_name,
    s.staff_id
  from transaction as t
  join restautant as r on t.menu = r.menu
  join staff as s on t.staff_name = s.staff_name
  )

select sum(total_price) as daily_income_2030_01_01
from overall_transaction
;

-- subquery
select
  t.staff_name
from
  select
    t.menu,
    r.price,
    t.staff_name,
  from overall_transaction
where t.staff_name like 'F%'
order by r.price desc
;

--group by
select
  menu,
  quantity,
from restuarant
group by menu
order by quantity desc
;
