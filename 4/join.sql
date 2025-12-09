-- INNER JOIN
select * from
customers c inner join orders o using (customerid);

-- LEFT JOIN	
select * from
orders o left join order_items oi using (orderid);

-- LEFT JOIN 2
select * from
orders o left join payments p using (orderid);

