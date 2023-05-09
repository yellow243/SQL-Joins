
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
/*ALIAS*/
 SELECT P.Name as ProductName, C.Name as Category
 FROM products as P
 INNER JOIN categories as C 
 ON C.CategoryID = P.CategoryID
 WHERE C.Name = "Computers";


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name as "Product Name", products.Price as "Product Price", reviews.Rating
 FROM products
 INNER JOIN reviews ON reviews.ProductID = products.ProductID
 WHERE reviews.Rating = 5;
 
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName as "Employee First Name", e.LastName as "Employee Last Name", Sum(s.Quantity) AS Total
FROM sales AS s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by Total desc
Limit 2; 

/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select d.Name as 'Department Name', c.Name as 'Category Name' FROM departments as d
INNER join categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.name, sum(s.Quantity) as 'Total Sold', sum(s.Quantity * s.PricePerUnit) as 'Total Price'
From products as p
Inner JOin sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;
-- To verify
select * from sales where ProductID = 97;
 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM products as p
INNER JOIN reviews as r on r.ProductID = p.ProductID
Where p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */