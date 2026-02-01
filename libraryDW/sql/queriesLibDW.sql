--1.δανεισμοί ανά τμήμα (department = depcode) και φύλο (sex)
select
  m.depcode,
  m.sex,
  count(*) as loans
from loans l
join members m on m.bid = l.bid
group by m.depcode, m.sex
order by m.depcode, m.sex;

--2.δανεισμοί ανά τοποθεσία (copyloc) και είδος  (material)
select
  c.copyloc,
  b.material,
  count(*) as loans
from loans l
join copy  c on c.copyno = l.copyno
join books b on b.bibno  = l.bibno
group by c.copyloc, b.material
order by c.copyloc, b.material;

--3.δανεισμοί ανά μήνα και φύλο για το έτος 2000

select
  d.[month] as month_num,
  m.sex,
  count(*) as loans
from loans l
join dates   d on d.loandate = l.loandate
join members m on m.bid      = l.bid
where d.[year] = 2000
group by d.[month], m.sex
order by d.[month], m.sex;

--4.με rollup
select 
  d.[year],
  d.[quarter],
  d.[month],
  count(*) as loans
from loans l
join dates d on d.loandate = l.loandate
group by rollup (d.[year], d.[quarter], d.[month])
order by d.[year], d.[quarter], d.[month];

--5. cube

select
  d.[year],
  m.depcode,
  count(*) as loans
from loans l
join dates   d on d.loandate = l.loandate
join members m on m.bid      = l.bid
group by cube (d.[year], m.depcode)
order by d.[year], m.depcode;
