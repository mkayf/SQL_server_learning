use Kababjees

select * from customers
select * from orders

-- cross join in sql

select * from customers
cross join orders


select * from customers
cross join orders
where o_amount between 5000 and 12000
order by o_amount asc


-- self join in sql

create table employees(
	id int primary key identity,
	name varchar(50) not null,
	supervisor_id int
)

insert into employees values
('Samad', 1),
('Atiq', 2),
('Salman', 2),
('Zarhan', 2),
('Hateem', 2)

select * from employees

select emp1.id, emp1.name, emp2.name as supervisor_name from employees as emp1
left join employees as emp2
on emp1.supervisor_id = emp2.id
