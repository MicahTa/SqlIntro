/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT * FROM BestBuy.Products
WHERE Products.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT products.Name, products.Price, reviews.Rating
FROM BestBuy.products
INNER JOIN BestBuy.reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;



/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
WITH SalesTotals AS (
	SELECT Sales.EmployeeID, SUM(Sales.Quantity) AS TotalQuantity, Sales.PricePerUnit
	FROM BestBuy.Sales
	GROUP BY Sales.EmployeeID
	ORDER BY TotalQuantity DESC
	LIMIT 1
)
SELECT FirstName, LastName
FROM bestbuy.employees
LEFT JOIN SalesTotals ON employees.EmployeeID = SalesTotals.EmployeeID
WHERE SalesTotals.EmployeeID IS NOT NULL;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name, categories.Name
FROM BestBuy.departments
INNER JOIN BestBuy.categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Games" OR categories.Name = "Appliances";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
WITH SalesTotals AS (
	SELECT Sales.ProductID, SUM(Sales.Quantity) AS TotalQuantity, Sales.PricePerUnit
	FROM BestBuy.Sales
	GROUP BY Sales.ProductID
)
SELECT products.Name, SalesTotals.TotalQuantity,
SalesTotals.TotalQuantity * SalesTotals.PricePerUnit AS TotalPriceSold
FROM SalesTotals
INNER JOIN bestbuy.products ON products.ProductID = SalesTotals.ProductID
WHERE products.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.Reviewer, reviews.rating, reviews.comment
FROM BestBuy.reviews
INNER JOIN bestbuy.products ON products.ProductID = reviews.ProductID
where products.name = "Visio TV"
ORDER BY reviews.rating ASC
LIMIT 1;