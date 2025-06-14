DROP TABLE IF EXISTS SalesOrders;

CREATE TABLE SalesOrders (
    OrderID INT,
    OrderDate DATE,
    Item VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price FLOAT,
    TotalAmount FLOAT
);