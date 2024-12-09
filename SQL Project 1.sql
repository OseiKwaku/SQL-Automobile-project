--Basic SQL Project -- Automobile Sales Dataset

-- Add firstname and lastname column as fullname
-- Round PRICE_EACH and SALES column to two decimal places
--Total Revenue and round to two decimal places
--Total Distinct Country
-- Total Products
-- Total Sales by country
-- Product by total sales
--Year by Sales
--Quater by Sales
--Month by Sales
--Average sales of products
--Top 50 customers by sales
--Top 5 city for total sales
--Total orders that have been shipped
--Most profitable productline

SELECT *
FROM AutoSalesdata

-- Add firstname and lastname column as fullname
SELECT CONCAT(FIRSTNAME,' ',LASTNAME) AS FULLNAME
FROM AutoSalesdata

-- Round PRICE_EACH and SALES column to two decimal places
SELECT ROUND(PRICE_EACH,2) AS PRICES
FROM AutoSalesdata

SELECT ROUND(SALES,2) AS SALES
FROM AutoSalesdata

--Total Revenue and round to two decimal places
SELECT SUM(SALES) AS Total_Revenue
FROM AutoSalesdata


--Total Distinct Country
SELECT COUNT(DISTINCT COUNTRY) AS TotalDistinctCountry
FROM AutoSalesdata

-- Total Products
SELECT COUNT(DISTINCT PRODUCTLINE) AS TotalDistinctCountry
FROM AutoSalesdata

-- Total Distinct City
SELECT COUNT(DISTINCT CITY) AS TotalDistinctCountry
FROM AutoSalesdata

-- Total Sales by country
SELECT COUNTRY, SUM(SALES) AS Total_Sales_Per_Country
FROM AutoSalesdata
GROUP BY COUNTRY

-- Product by total sales
SELECT PRODUCTLINE, SUM(SALES) AS Total_Products
FROM AutoSalesdata
GROUP BY PRODUCTLINE

--Year by Sales
SELECT YEAR(ORDER_DATE) AS YEARS, SUM(SALES) AS Total_Revenue
FROM AutoSalesdata
GROUP BY YEAR(ORDER_DATE)
ORDER BY YEAR(ORDER_DATE) DESC

--Quater by Sales
SELECT DATENAME(QUARTER,ORDER_DATE) AS Quarters, SUM(SALES) AS Total_Revenue
FROM AutoSalesdata
GROUP BY DATENAME(QUARTER,ORDER_DATE)
ORDER BY DATENAME(QUARTER,ORDER_DATE) DESC


--Month by Sales
SELECT DATENAME(MONTH,ORDER_DATE) AS Months, SUM(SALES) AS Total_Revenue
FROM AutoSalesdata
GROUP BY DATENAME(MONTH,ORDER_DATE)
ORDER BY DATENAME(MONTH,ORDER_DATE) DESC

--Average sales of products
SELECT PRODUCTLINE, AVG(SALES) AS avg_sales
FROM AutoSalesdata
GROUP BY PRODUCTLINE

--Top 50 customers by sales
SELECT TOP 50 CUSTOMERNAME, SALES AS Revenue_from_top_customers
FROM AutoSalesdata
ORDER BY SALES DESC

--Top 5 city for total sales
SELECT TOP 5 CITY, SALES AS Revenue_from_top_customers
FROM AutoSalesdata
ORDER BY SALES DESC

--Total orders that have been shpped
SELECT COUNT(STATUS) AS Shipped_Orders
FROM AutoSalesdata
WHERE STATUS = 'Shipped'
GROUP BY ORDER_NUMBER

--Most profitable productline
SELECT PRODUCTLINE, SUM(SALES * PRICE_EACH) AS Total_Revenue
FROM AutoSalesdata
GROUP BY PRODUCTLINE
ORDER BY SUM(SALES * PRICE_EACH) DESC 
