-- find all products --
 select *
 from products;
-- find all products that cost $1400
 select *
 from products
 where price = 1400;
-- find all products that cost $11.99 or $13.99
 select *
 from products
 where price = 13.99 or price = 11.99;
-- find all products that do NOT cost 11.99 - using NOT
 select *
 from products
 where not price = 11.99;
 
-- find  all products and sort them by price from greatest to least
select *
from products
order by price desc;
 
-- find all employees who don't have a middle initial
 select *
 from employees
 where MiddleInitial is null;
 
-- find distinct product prices
 select distinct price
 from products;
 
-- find all employees whose first name starts with the letter ‘j’
 select *
 from employees
 where firstname like 'j%';
 
-- find all Macbooks --
 select *
 from products
 where name = 'Macbook';
 
-- find all products that are on sale
select *
from products
where onsale = 1;
 
-- find the average price of all products --
 select avg(price)
 from products;
 
-- find all Geek Squad employees who don't have a middle initial --
 select *
 from employees
 where title = 'Geek Squad' and MiddleInitial is null;
 
-- find all products from the products table whose stock level is in the range  -- of 500 to 1200. 
-- Order by Price from least to greatest. **Try this with the -- between keyword** 
select *
from products
where stocklevel between 500 and 1200
order by price;

-- PART 2 W JOINS
-- joins: select all the computers from the products table:
 -- using the products table and the categories table, 
 -- return the product name and the category name
select p.name as Product, 
	c.Name as Category
from products as p 
inner join categories as c ON p.CategoryID = c.CategoryID;
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 select p.Name as Product, 
	p.Price as Price, 
	r.Rating as Rating
 from products as p
 inner join reviews as r ON p.ProductID	= r.ProductID
 where r.Rating = 5;
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
select sum(s.Quantity) as total,
	e.FirstName,
    e.LastName
from employees as e
inner join sales as s ON e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc;
-- -----------------------------------------------------------------
-- joins: find the name of the department, 
-- and the name of the category for Appliances and Games
select d.Name, c.Name
from departments as d
inner join categories as c on d.DepartmentID =  c.DepartmentID
where c.Name = 'Appliances' or c.Name = 'Games';

-- joins: find the product name, total # sold, and total price sold,
-- for Eagles: Hotel California --You may need to use SUM()
select p.Name, 
	Count(s.Quantity) as Quantity,
    Sum(s.Quantity * p.Price) as Price
from products as p
inner join sales as s on p.ProductID = s.ProductID
where p.name= 'Eagles: Hotel California';


-- joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
-- (only return for the lowest rating!)
select p.Name,
    r.Rating as review_rating,
    r.Comment
from products as p
inner join reviews as r on p.ProductID = r.ProductID
where p.Name = 'Visio TV' and r.rating = 1;






-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */

select e.EmployeeID,
	e.FirstName,
    e.LastName,
    p.Name,
    sum(s.Quantity) as products_sold
from employees as e
inner join sales as s on e.EmployeeID = s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;

