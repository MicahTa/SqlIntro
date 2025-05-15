-- find all products
SELECT * FROM bestbuy.products;

-- find all products that cost $1400
SELECT * FROM bestbuy.products
WHERE products.price = 1400;

-- find all products that cost $11.99 or $13.99
SELECT * FROM bestbuy.products
WHERE products.price = 11.99 OR products.price = 13.99;

-- find all products that do NOT cost 11.99 - using NOT
SELECT * FROM bestbuy.products
WHERE NOT products.price = 11.99;

-- find all products and sort them by price from greatest to least
SELECT * FROM bestbuy.products
order by products.price;

-- find all employees who don't have a middle initial
SELECT * FROM bestbuy.employees
where MiddleInitial is null;

-- find distinct product prices
SELECT DISTINCT bestbuy.products.price
FROM bestbuy.products;


-- find all employees whose first name starts with the letter ‘j’
SELECT * FROM bestbuy.employees
WHERE FirstName LIKE 'j%';

-- find all Macbooks
SELECT * FROM bestbuy.products
WHERE products.name = "Macbook";

-- find all products that are on sale
SELECT * FROM bestbuy.products
WHERE OnSale = 1;

-- find the average price of all products
SELECT avg(products.price) FROM bestbuy.products;

-- find all Geek Squad employees who don't have a middle initial
SELECT * FROM bestbuy.employees
where MiddleInitial is null AND
Title = "Geek Squad";

-- find all products from the products table whose stock level is in the range -- of 500 to 1200. Order by Price from least to greatest. Hint: Use the between keyword
SELECT * FROM bestbuy.products
where price between 500 AND 1200
order by price;