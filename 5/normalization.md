Лабораторна робота №5

Оригінальний дизайн таблиць:

create table if not exists customers
(
	customerID		serial primary key,
	name			varchar(32) not null,
	surname		varchar(32) not null,
	email			varchar(32) not null,
	phone_number	varchar(32)
);

create table if not exists orders
(
	orderID	serial primary key,
	cost		decimal(10,2) not null 	check (cost >= 0),
	address	varchar(256) not null,
	customerID 	int not null references customers(customerID)
);

create table if not exists products
(
	productID	serial primary key,
	name		varchar(32) not null,
	description	text,
	quantity	int not null			check (quantity >= 0),
	cost_for_one 	decimal(10,2) not null		check (cost_for_one  >= 0)
);

create table if not exists order_items
(
	productID	int not null references products(productID),
	orderID	int not null references orders(orderID),
	cost		decimal(10,2) not null		check (cost >= 0),
	quantity	int not null			check (quantity > 0),
    primary key (productID, orderID)
);

create table if not exists categories
(
	categoryID	serial primary key,
	name		varchar(32) not null
);


create table if not exists product_categories
(
	productID 	int not null references products(productID),
	categoryID 	int not null references categories(categoryID),
	primary key (productID, categoryID)
);

create type ways_of_payment as enum('cash', 'card');

create table if not exists payments
(
	paymentID		serial primary key,
	sum			decimal(10,2) not null 	check (sum >= 0),
	way_of_payment 	ways_of_payment,
	orderID 		int unique not null references orders(orderID)
);


Команди для переробки таблиць:

ALTER TABLE orders DROP COLUMN cost;
ALTER TABLE payments DROP COLUMN sum;
ALTER TABLE order_items DROP COLUMN cost;






Функціональні залежності:

customers:
Первинний ключ: customerID 
customerID -> name
customerID -> surname
customerID -> email
customerID -> phone_number 

orders:
Первинний ключ: orderID
orderID -> cost
orderID -> address 

products:
Первинний ключ: productID
productID -> name
productID -> description
productID -> quantity
productID -> cost_for_one 

order_items:
Первинний ключ: primary key (productID, orderID)
(productID, orderID) -> cost
(productID, orderID) -> quantity

categories:
Первинний ключ: categoryID
categoryID -> name

payments:
Первинний ключ: paymentID
categoryID -> sum
categoryID -> way_of_payment 




Оцінка таблиць

customers, products, categories:
Всі атрибути є атомарними(номер телефону та пошта може бути тільки одна) та однозначно залежать від первинного ключа. Ніякі не ключові атрибути не залежать від інших не ключових атрибутів. Тож таблиці знаходиться в 3НФ.

orders:
Всі атрибути є атомарними та однозначно залежать від первинного ключа. Ніякі не ключові атрибути не залежать від інших не ключових атрибутів. Тож таблиця знаходиться в 3НФ.
Атрибут cost не є необхідним і ускладнює оновлення даних. Можна прибрати цей атрибут і рахувати ціну замовлення кожного разу динамічно.

Стара таблиця:
create table if not exists orders
(
	orderID	serial primary key,
	cost		decimal(10,2) not null 	check (cost >= 0),
	address	varchar(256) not null,
	customerID 	int not null references customers(customerID)
);
Нова таблиця:
create table if not exists orders
(
	orderID	serial primary key,
	address	varchar(256) not null,
	customerID 	int not null references customers(customerID)
);

payments:
Атрибут sum дублює атрибут cost в orders, тому його можна також видалити, а ціну рахувати динамічно через зовнішній ключ orderID .

Стара таблиця:
create table if not exists payments
(
	paymentID		serial primary key,
	sum			decimal(10,2) not null 	check (sum >= 0),
	way_of_payment 	ways_of_payment,
	orderID 		int unique not null references orders(orderID)
);
Нова таблиця:
create table if not exists payments
(
	paymentID		serial primary key,
	way_of_payment 	ways_of_payment,
	orderID 		int unique not null references orders(orderID)
);

За вийнятком цього таблиця payments знаходиться в 3НФ.

order_items:
Атрибут cost дублює атрибут cost_for_one в products, тому його можна видалити, а ціну брати через зовнішній ключ productID.

Стара таблиця:
create table if not exists order_items
(
	productID	int not null references products(productID),
	orderID	int not null references orders(orderID),
	cost		decimal(10,2) not null		check (cost >= 0),
	quantity	int not null			check (quantity > 0),
    primary key (productID, orderID)
);
Нова таблиця:
create table if not exists order_items
(
	productID	int not null references products(productID),
	orderID	int not null references orders(orderID),
	quantity	int not null			check (quantity > 0),
    primary key (productID, orderID)
);

За вийнятком цього таблиця order_items знаходиться в 3НФ.
