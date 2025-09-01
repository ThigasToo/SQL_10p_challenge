-- SQL Retail Sales Analysis - P1
--Create table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales(
	transactions_id INT PRIMARY KEY,	
	sale_date DATE,
	sale_time TIME,
	customer_id	INT,
	gender VARCHAR(15),
	age INT,	
	category VARCHAR(15), 
	quantiy INT,	
	price_per_unit FLOAT,	
	cogs FLOAT,
	total_sale FLOAT
) 

SELECT * FROM retail_sales
LIMIT 10

-- Data Cleaning
SELECT COUNT(*) FROM retail_sales

SELECT * FROM retail_sales
WHERE age IS NULL

SELECT * FROM retail_sales
WHERE 
		age IS NULL 
		OR
		gender IS NULL
		OR 
		category IS NULL
		OR
		quantiy IS NULL
		OR
		cogs IS NULL
		OR 
		total_sale IS NULL

DELETE FROM retail_sales
WHERE 
		age IS NULL 
		OR
		gender IS NULL
		OR 
		category IS NULL
		OR
		quantiy IS NULL
		OR
		cogs IS NULL
		OR 
		total_sale IS NULL


-- Data Exploration 
-- How many sales we have? 
SELECT COUNT (*) as total_sale FROM retail_sales

-- How many unique customers we have?
SELECT COUNT (DISTINCT customer_id) as total_sale FROM retail_sales

-- How many categories we have?
SELECT DISTINCT category FROM retail_sales

--Data analysis & Business Key Problems & Answers
--Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * 
FROM retail_sales
WHERE sale_date = '2022-11-05';


--Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more or equal than 4 in the month of Nov-2022
SELECT
	*
FROM retail_sales
WHERE category = 'Clothing'
	AND
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	AND
	quantiy >= 4

--Write SQL query to calculate the total sales for each category
SELECT 
	category,
	SUM(total_sale) as net_sale,
	COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

-- Write a SQL query to find the avarage age of customer who purchased items from the 'Beauty' category
SELECT 
	ROUND(AVG(age), 2) as avg_age 
FROM retail_sales
WHERE category = 'Beauty'

--WRITE A sql SERVER TO FIND ALL TRANSACTIONS WHERE THE TOTAL_VALUE IS GREATER THAN 1000
SELECT * FROM retail_sales
WHERE total_sale > 1000

--Write a SQL query to find the total number of transactions made by each gender in each category
SELECT 
	category,
	gender,
	COUNT(*) as total_trans
FROM retail_sales
GROUP
	BY
	category, 
	gender
ORDER BY 1

--Write a SQL query to calculate the avarage sale for each month, find out the best selling month each year
SELECT * FROM
(
SELECT 
	EXTRACT(YEAR FROM sale_date) as year,
	EXTRACT(MONTH FROM sale_date) as month,
	AVG(total_sale) as avg_total_sale,
	RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1

--Write SQL query to find the top 5 customers based on the highest total sales
SELECT 
	customer_id,
	SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

--Write a SQL query to find the number of unique customers
SELECT 
	category,
	COUNT(DISTINCT customer_id)
FROM retail_sales
GROUP BY category

-- Write SQL query to create each shift and number of orders
WITH hourly_sale
AS
(
SELECT *,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END as shift
FROM retail_sales
)
SELECT 
	shift,
	COUNT(*) as total_orders
FROM hourly_sale
GROUP BY shift

--End of project
	
