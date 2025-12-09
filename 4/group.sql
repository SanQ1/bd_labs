-- GROUP
select categoryid, count(*)
from product_categories
group by categoryid;

-- GROUP HAVING
select orderid, count(*)
from order_items
group by orderid
having count(*) > 1;

-- MULTIPLE TABLES AGGREGATION
select o.orderid, sum(oi.cost)
from orders o left join order_items oi using(orderid)
group by orderid;

