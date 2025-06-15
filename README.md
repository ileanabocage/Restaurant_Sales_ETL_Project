# Restaurant Sales ETL Pipeline (Azure Data Factory Project)

This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline built using **Azure Data Factory**, **Azure Blob Storage**, and **Azure SQL Database**, using mock restaurant sales data.

## Project Overview

- **Goal**: Load and process restaurant order data from a CSV file into a structured SQL database for reporting and analysis.
- **Tools**: Azure Data Factory, Azure Blob Storage, Azure SQL Database, GitHub

## Features

- Extracted data from a CSV file hosted in Azure Blob Storage  
- Transformed and validated data using Azure Data Factory  
- Loaded data into an Azure SQL table  
- Designed SQL queries to generate basic sales summary reports

## Technologies Used

- **Azure Data Factory (ADF)** – for pipeline orchestration  
- **Azure Blob Storage** – to store the input CSV file  
- **Azure SQL Database** – as the data sink  
- **GitHub** – for version control and project tracking

## Folder Structure

```
.
├── data/                   # Contains the mock CSV file
│   └── restaurant_sales.csv
├── sql/                    # SQL scripts for table creation and analysis
│   ├── create_table.sql
│   ├── query_all_orders.sql
│   ├── query_sales_by_category.sql
│   └── query_sales_by_date.sql
├── dataflow/               # (If applicable) for calculated columns
├── dataset/                # Source and sink dataset definitions
├── factory/                # ADF factory config metadata
├── linkedService/          # Linked service configs (Blob + SQL)
├── pipeline/               # ADF pipeline JSON
├── publish_config.json     # GitHub publishing config for ADF
└── README.md               # This project description
```

## Data Schema

**restaurant_sales.csv**

| Column     | Type    | Description                   |
|------------|---------|-------------------------------|
| OrderID    | INT     | Unique order ID               |
| OrderDate  | DATE    | Date of the order             |
| Item       | STRING  | Name of the menu item         |
| Category   | STRING  | Category (Entree, Drink, etc) |
| Quantity   | INT     | Number of items ordered       |
| Price      | FLOAT   | Unit price in USD             |

## SQL Table Definition

```sql
CREATE TABLE SalesOrders (
    OrderID INT,
    OrderDate DATE,
    Item VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    Price FLOAT
);
```

## Sample SQL Queries

```sql
-- View all sales orders
SELECT * FROM SalesOrders;

-- Total sales per category
SELECT Category, SUM(TotalAmount) AS TotalSales
FROM SalesOrders
GROUP BY Category;

-- Sales by day
SELECT OrderDate, SUM(TotalAmount) AS DailySales
FROM SalesOrders
GROUP BY OrderDate;
```

## How to Reproduce

1. Upload `restaurant_sales.csv` to a container in Azure Blob Storage  
2. Create a SQL Database and run the `create_table.sql` script  
3. Set up linked services for Blob and SQL in ADF  
4. Create source and sink datasets  
5. Build a pipeline to copy the data  
6. (Optional) Use a Data Flow to calculate `TotalAmount`  
7. Run and monitor your pipeline in ADF Studio

## Status

- Functional  
- GitHub-connected Azure Data Factory  
- Tested with SQL queries  
- Data + Code fully versioned in this repo  

## Author

Created by Ileana Bocage as a self-directed ETL learning project using Microsoft Azure.

## License

This project is licensed for educational and demonstration purposes.
