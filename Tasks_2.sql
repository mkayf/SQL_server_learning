-- SQL TASKS 2


create table products(
	p_ID int primary key identity,
	p_name varchar(120),
)

create table sales(
	s_ID int primary key identity,
	s_p_ID int foreign key references products(p_ID),
	s_amount int,
	s_date date default(getdate())
)

create table customers(
	c_ID int primary key identity,
	c_name varchar(100),
	c_region varchar(50)
)

create table orders(
	o_ID int primary key identity,
	o_c_ID int foreign key references customers(c_ID),
	o_amount int
)

-- question 1 - sales report with rollup and having

select coalesce(p_name, 'Grand') as product_name, coalesce(s_region, 'Total') as Region, sum(s_amount) as total_sales from sales
inner join products
on products.p_ID = sales.s_p_ID
group by rollup(p_name, s_region) having sum(s_amount) > 5000


-- question 2 - customer orders with join

select customers.c_name, sum(orders.o_amount) as order_amount from customers
inner join orders
on customers.c_ID = orders.o_c_ID
where customers.c_region = 'Lahore'
group by customers.c_name


-- question 3 - Product views

create view TopSellingProducts
as
select s_p_ID as Product_ID, s_region, sum(s_amount) as total_sales_amount from sales
group by s_p_ID, s_region having sum(s_amount) > 1000

select * from TopSellingProducts

-- question 4 - stored procedure for monthly sales

select * from sales
