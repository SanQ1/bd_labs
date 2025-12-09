-- COUNT()
select orderid, count(*)
from order_items
group by orderid;

-- AVG()
select avg(sum)
from payments;

-- MIN()
select min(cost_for_one)
from products;

-- MAX()
select max(cost_for_one)
from products;

-- SUM()
select sum(cost)
from orders;

