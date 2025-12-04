insert into customers (name, surname, email, phone_number) values
('Ivan', 'Petrenko', 'ivan.p@gmail.com', '380991112233'),
('Oksana', 'Shevchenko', 'oks.shev@gmail.com', '380932224455'),
('Dmytro', 'Bondar', 'd.bondar@ukr.net', '380673335577'),
('Anna', 'Melnyk', 'anna.melnyk@gmail.com', '380503331122');

insert into products (name, description, quantity, cost_for_one) values
('Laptop', '15-inch lightweight laptop', 20, 29999.00),
('Headphones', 'Wireless noise-cancelling', 50, 2999.00),
('Keyboard', 'Mechanical RGB keyboard', 35, 1999.00),
('Smartphone', '6.5-inch OLED, 128GB', 15, 19999.00);

insert into categories (name) VALUES
('Electronics'),
('Computers'),
('Accessories'),
('Audio');

insert into product_categories (productID, categoryID) values
(1, 2),
(2, 4),
(3, 3),
(4, 1);

insert into orders (cost, address, customerID) values
(32998.00, 'Kyiv, Khreshchatyk 10', 1),
(22998.00, 'Lviv, Svobody Ave 5', 2),
(4998.00, 'Odesa, Deribasivska 7', 3),
(19999.00, 'Kharkiv, Sumska 15', 4);

insert into order_items (productID, orderID, cost, quantity) values
(1, 1, 29999.00, 1),
(2, 1, 2999.00, 1),
(4, 2, 19999.00, 1),
(3, 3, 1999.00, 1),
(2, 4, 2999.00, 1);

insert into payments (sum, way_of_payment, orderID) values
(32998.00, 'card', 1),
(22998.00, 'cash', 2),
(4998.00, 'card', 3),
(19999.00, 'card', 4);

