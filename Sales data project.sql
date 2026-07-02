select* from sales_data 
SELECT DB_NAME();
--total orders 
SELECT COUNT(*) AS Total_Orders
FROM sales_data;

--Total sales 
SELECT SUM(SALES) AS Total_Sales
FROM sales_data;

--Average orders
SELECT AVG(SALES) AS Average_Order_Value
FROM sales_data;

--distinct product lines 
SELECT DISTINCT PRODUCTLINE
FROM sales_data;

--SELECT PRODUCTLINE,
  SELECT PRODUCTLINE,
   SUM(SALES) AS Total_Sales
 FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY Total_Sales DESC; 

--sales by country
SELECT COUNTRY,
 SUM(SALES) AS Total_Sales
FROM sales_data
GROUP BY COUNTRY
ORDER BY Total_Sales DESC;

--order by status 
SELECT STATUS,
 COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY STATUS;

--Monthly sales 
SELECT YEAR_ID,
       MONTH_ID,
 SUM(SALES) AS Total_Sales
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

--Top 10 customers
SELECT TOP 10
  CUSTOMERNAME,
 SUM(SALES) AS Total_Sales
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY Total_Sales DESC;

--customer with highest orders
SELECT TOP 10
  CUSTOMERNAME,
 COUNT(DISTINCT ORDERNUMBER) AS Orders
FROM sales_data
GROUP BY CUSTOMERNAME
ORDER BY Orders DESC;

--best selling product line 
SELECT PRODUCTLINE,
 SUM(QUANTITYORDERED) AS Quantity_Sold
FROM sales_data
GROUP BY PRODUCTLINE
ORDER BY Quantity_Sold DESC;

--Highest revenue product code 

SELECT TOP 10
  PRODUCTCODE,
 SUM(SALES) AS Revenue
FROM sales_data
GROUP BY PRODUCTCODE
ORDER BY Revenue DESC;

--sales by year
SELECT YEAR_ID,
SUM(SALES) AS Revenue
FROM sales_data
GROUP BY YEAR_ID
ORDER BY YEAR_ID;

--best sales month
SELECT MONTH_ID,
 SUM(SALES) AS Revenue
FROM sales_data
GROUP BY MONTH_ID
ORDER BY Revenue DESC;

--rank customers by revenue 
SELECT CUSTOMERNAME,
 SUM(SALES) AS Revenue,
RANK() OVER(ORDER BY SUM(SALES) DESC) AS Customer_Rank
FROM sales_data
GROUP BY CUSTOMERNAME;

--Top product line 
SELECT *
FROM
(
SELECT PRODUCTLINE,
       PRODUCTCODE,
       SUM(SALES) AS Revenue,
       RANK() OVER(PARTITION BY PRODUCTLINE ORDER BY SUM(SALES) DESC) AS rn
FROM sales_data
GROUP BY PRODUCTLINE, PRODUCTCODE
)t
WHERE rn = 1;

--Average sales by deal size
SELECT DEALSIZE,
 AVG(SALES) AS Average_Sales
FROM sales_data
GROUP BY DEALSIZE;

--top 5 cities by revenue 
SELECT TOP 5
  CITY,
 SUM(SALES) AS Revenue
FROM sales_data
GROUP BY CITY
ORDER BY Revenue DESC;

--running total sales 
SELECT YEAR_ID,
 MONTH_ID,
SUM(SALES) AS MonthlySales,
SUM(SUM(SALES)) OVER(ORDER BY YEAR_ID, MONTH_ID) AS RunningTotal
FROM sales_data
GROUP BY YEAR_ID, MONTH_ID;

--repeat customers
SELECT CUSTOMERNAME,
 COUNT(DISTINCT ORDERNUMBER) AS Orders
FROM sales_data
GROUP BY CUSTOMERNAME
HAVING COUNT(DISTINCT ORDERNUMBER) > 1;
