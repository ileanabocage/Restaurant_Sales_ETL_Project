-- Total sales per category
SELECT Category, SUM(TotalAmount) AS TotalSales
FROM SalesOrders
GROUP BY Category;