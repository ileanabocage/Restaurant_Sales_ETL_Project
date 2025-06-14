-- Sales by day
SELECT OrderDate, SUM(TotalAmount) AS DailySales
FROM SalesOrders
GROUP BY OrderDate;