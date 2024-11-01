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

create table employees(
	e_ID int primary key identity,
	e_name varchar(120),
	e_salary int,
	e_hiredate date
)

insert into employees values ('Kayf', 50000, '2022-11-24'),
('Samad', 60000, '2023-07-05'),
('Atiq', 40000, '2021-05-17'),
('Salman', 70000, '2022-01-10'),
('Zarhan', 35000, '2023-10-20'),
('Hamza', 45000, '2021-03-02'),
('Ahsan', 75000, '2023-08-06'),
('Azmeer', 25000, '2023-12-30'),
('Noman', 55000, '2024-07-06'),
('Ali', 65000, '2023-06-10'),
('Imtiaz', 75000, '2020-01-23'),
('Anwar', 80000, '2020-04-19')




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

alter procedure GetMonthlySales
@year varchar(4)
with encryption
as
begin
	select s_date as Sale_date, sum(s_amount) as sale_amount from sales
	where s_date like @year + '%'
	group by rollup(s_date)
end

exec GetMonthlySales '2023'


-- question 5 - Filter results with TOP and BETWEEN

select top 5 e_name, e_salary, e_hiredate from employees
where e_hiredate between '2020-01-01' and '2022-12-31'
order by e_salary desc
