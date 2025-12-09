select *
from orders
where customerid = (
    select customerid
    from customers
    where name = 'Ivan' and surname = 'Petrenko');


select *
from product_categories
where categoryid = (
    select categoryid
    from categories
    where name = 'Audio');


select *
from order_items
where orderid = (
    select orderid
    from orders
    where orderid = 1);

