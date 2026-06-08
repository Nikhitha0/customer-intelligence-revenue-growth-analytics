-- Top 5 Countries by Revenue

SELECT
Country,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;

-- Top 10 Products by Revenue

SELECT
Description,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

-- Top 10 Customers by Revenue

SELECT
CustomerID,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

-- Customer Segmentation

SELECT
CASE
WHEN Revenue >= 1000 THEN 'High Value'
WHEN Revenue >= 500 THEN 'Medium Value'
ELSE 'Low Value'
END AS Customer_Segment,
COUNT(*) AS Customers
FROM
(
SELECT
CustomerID,
SUM(Revenue) AS Revenue
FROM online_retail
GROUP BY CustomerID
) t
GROUP BY Customer_Segment;