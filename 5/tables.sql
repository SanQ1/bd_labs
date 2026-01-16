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
	way_of_payment 	ways_of_payment,
	orderID 		int unique not null references orders(orderID)
);

