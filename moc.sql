
CREATE TABLE Customer(
id serial PRIMARY KEY,name varchar(20),email text,phone varchar(10),
address text, created_at Timestamp default Current_timestamp);

Create table product(id serial Primary key, name varchar(20),
description text,price integer check (price>0),stock varchar(20),category varchar(20));

drop table product;
drop table orderItem;
drop table order1;
drop table payment;
drop table customer; 



Create table order1(id serial Primary key, customer_id integer,
order_date date,status text ,total_ammount Integer,
foreign key (customer_id )references customer(id));

create table orderItem (id serial,order_id Integer,
product_id Integer,Quantity Integer,unit_price Integer,
foreign key (order_id )references Order1 (id),
foreign key (product_id )references product(id));

Alter table  orderItem add column 
loyalty_points Integer Default 0;

create table Payment (id serial, order_id Integer,
payment_mode text,amount_paid Integer,
payment_status varchar(20),paid_on date,
foreign key (order_id )references Order1 (id));

Alter table product Rename category to product_category;

-- Insert data into Customer table
INSERT INTO Customer (name, email, phone, address) VALUES
('John Doe', 'john.doe@example.com', '1234567890', '123 Elm Street'),
('Jane Smith', 'jane.smith@example.com', '9876543210', '456 Oak Avenue'),
('Alice Johnson', 'alice.johnson@example.com', '5556667777', '789 Pine Road');

-- Insert data into Product table
INSERT INTO Product (name, description, price, stock, product_category) VALUES
('Laptop', 'High-performance laptop', 1000, 'In Stock', 'Electronics'),
('Smartphone', 'Latest model smartphone', 800, 'In Stock', 'Electronics'),
('Headphones', 'Noise-cancelling headphones', 200, 'Out of Stock', 'Accessories');

-- Insert data into Order1 table
INSERT INTO Order1 (customer_id, order_date, status, total_ammount) VALUES
(1, '2023-10-01', 'Completed', 1200),
(2, '2023-10-02', 'Pending', 800),
(3, '2023-10-03', 'Shipped', 200);

-- Insert data into OrderItem table
INSERT INTO OrderItem (order_id, product_id, quantity, unit_price, loyalty_points) VALUES
(1, 1, 1, 1000, 100),
(1, 3, 1, 200, 20),
(2, 2, 1, 800, 80),
(3, 3, 1, 200, 20);

-- Insert data into Payment table
INSERT INTO Payment (order_id, payment_mode, amount_paid, payment_status, paid_on) VALUES
(1, 'Credit Card', 1200, 'Paid', '2023-10-01'),
(2, 'PayPal', 800, 'Pending', NULL),
(3, 'Debit Card', 200, 'Paid', '2023-10-03');

INSERT INTO Product (name, description, price, stock, product_category) VALUES
('Watch', 'High-performance watch', 1000, 'In Stock', 'Electronics')

INSERT INTO Order1 (customer_id, order_date, status, total_ammount) VALUES
(1, '2023-10-01', 'placed', 1200);


ALTER TABLE OrderItem
ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES 
Order1(id) ON DELETE CASCADE;

INSERT INTO Payment (order_id, payment_mode, amount_paid, payment_status, paid_on) VALUES
(4, 'Credit Card', 1200, 'Paid', '2023-10-01');

select*from order1;

update order1 set status= 'Shipped' where status='Pending';

select * from customer;
select*from order1;

select O.*,C.name
from Order1 O left join Customer C
on O.customer_id=C.id;

select * from product
where stock='Out of Stock';

select C.name
from Order1 O left join Customer C
on O.customer_id=C.id
where C.id not in (O.customer_id) ;

select C.name,total_ammount
from customer C join order1 O on C.id=O.customer_id
order by total_ammount DESC
limit 3;

select * from order1
order by total_ammount DESC
limit 1;




