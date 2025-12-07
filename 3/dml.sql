-- process of creating a new order, add some products, then create a payment and delete the order.

-- create a new order
insert into orders(cost, address, customerID) values (0.00, 'Kyiv, Pivnichna 74', 0);
-- create an order_item
insert into order_items(productID, orderID, cost, quantity) values (1, 5, 29999.00, 1);

-- check before update
select * from orders
where orderID = 5;

-- update the order’s cost with a new order_item
update orders
set cost = (select sum(cost) from order_items where orderID = 5)
where orderID = 5;

-- create a new order_item
insert into order_items(productID, orderID, cost, quantity) values (2, 5, 2999.00, 1);

-- update the order’s cost again
update orders
set cost = (select sum(cost) from order_items where orderID = 5)
where orderID = 5;

-- check before delete
select * from order_items
where orderID = 5 and productID = 1;

-- delete an order_item that we don’t need anymore
delete from order_items
where orderID = 5 and productID = 1;

-- update the order’s cost
update orders
set cost = (select sum(cost) from order_items where orderID = 5)
where orderID = 5;

-- create a new payment
insert into payments(sum, way_of_payment, orderID)
values ((select cost from orders where orderID = 5), 'card', 5);

-- check before delete
select * from order_items
where orderID = 5;

-- delete an order_item
delete from order_items
where orderID = 5;

-- check before delete
select * from payments
where orderID = 5;

-- delete payment (if the order is paid)
delete from payments
where orderID = 5;

-- check before delete
select * from orders
where orderID = 5;

-- delete the order
delete from orders
where orderID = 5;

