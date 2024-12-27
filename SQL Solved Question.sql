Create database Stock_data;
use Stock_data;

-- 1. Highest Closing Price
-- Question: Which stock had the highest closing price, and on which date?
SELECT Stock_Name, Date, Close_Price
FROM Stock_Data
WHERE Close_Price = (SELECT MAX(Close_Price) FROM Stock_Data);

-- 2. Most Traded Stock
-- Question: Which stock had the highest total trading volume over the entire period?
SELECT Stock_Name, SUM(Volume) AS Total_Volume
FROM Stock_Data
GROUP BY Stock_Name
ORDER BY Total_Volume DESC
LIMIT 1;

-- 3. Daily Price Range
-- Question: What is the daily price range (High Price - Low Price) for each stock?
SELECT Stock_Name, Date, (High_Price - Low_Price) AS Daily_Price_Range
FROM Stock_Data;

-- 4. Top 5 Most Volatile Stocks
-- Question: Which are the top 5 most volatile stocks (highest average daily price range)?
SELECT Stock_Name, AVG(High_Price - Low_Price) AS Avg_Volatility
FROM Stock_Data
GROUP BY Stock_Name
Order by Avg_Volatility desc limit 5;

-- 5. Monthly Average Closing Price
-- Question: What is the average closing price for each stock ?
SELECT Stock_Name, AVG(Close_Price) AS Avg_Closing_Price
FROM Stock_Data
GROUP BY Stock_Name
ORDER BY Stock_Name;

-- 6. Highest Percentage Price Change
-- Question: Which stock had the highest single-day percentage price change, and on which date?
SELECT Stock_Name, Date, ((Close_Price - Open_Price) / Open_Price) * 100 AS Percentage_Change
FROM Stock_Data
ORDER BY Percentage_Change DESC
LIMIT 1;

-- 7. Top 3 Stocks with Highest Average Closing Price
-- Question: Which are the top 3 stocks with the highest average closing price?
SELECT Stock_Name, AVG(Close_Price) AS Avg_Closing_Price
FROM Stock_Data
GROUP BY Stock_Name
ORDER BY Avg_Closing_Price DESC LIMIT 3;

-- 8. Trading Volume Analysis
-- Question: What is the average daily trading volume stock?
SELECT Stock_Name, AVG(Volume) AS Avg_Daily_Volume
FROM Stock_Data
GROUP BY Stock_Name
ORDER BY Avg_Daily_Volume DESC limit 1;

-- 9. Dates with Highest Trading Volume
-- Question: For each stock, which date had the highest trading volume?
SELECT Stock_Name, max(Volume) AS Avg_Daily_Volume
FROM Stock_Data
GROUP BY Stock_Name
ORDER BY Avg_Daily_Volume DESC;

-- 10. No. for stocks
SELECT COUNT(DISTINCT Stock_Name) AS Total_Stocks
FROM Stock_Data;



