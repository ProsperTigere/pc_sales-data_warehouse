 PC Sales Data Warehouse

 Project Overview

This project implements a dimensional data warehouse in Microsoft SQL Server to transform raw PC sales transactional data into a structured analytical repository.

The solution follows a **star schema architecture** consisting of one central fact table and multiple supporting dimension tables. The warehouse enables efficient reporting, data integration, and future business intelligence analysis.



 Objectives

* Design a star schema suitable for PC sales reporting
* Load raw CSV sales data into a SQL Server staging table
* Create dimension tables using ETL SQL scripts
* Populate a centralized fact table through key-based joins
* Manage the full project using Git and GitHub version control



 Data Warehouse Schema

 Fact Table

* **FactSales** – stores measurable sales transactions and foreign keys linking to all dimensions

 Dimension Tables

* **DimCustomer**
* **DimProduct**
* **DimStore**
* **DimSalesPerson**
* **DimDate**
* **DimPayment**
* **DimChannel**
* **DimLocation**



 ETL Process

The ETL implementation follows three major phases:

1. **Extract**
   Raw PC sales data is imported from `PC_Sales_Raw_Data.csv` into the SQL Server staging table.

2. **Transform**
   Data cleansing, date conversion, and dimensional separation are performed using standalone SQL scripts.

3. **Load**
   Cleaned records are inserted into dimension tables and finally loaded into the `FactSales` table using surrogate key mapping.



 Technologies Used

* Microsoft SQL Server Management Studio (SSMS)
* T-SQL
* Git Bash
* GitHub
* draw.io Star Schema Modelling



 Repository Files

* `dim_customer.sql`
* `dim_product.sql`
* `dim_store.sql`
* `dim_sales_person.sql`
* `dim_date.sql`
* `dim_payment.sql`
* `dim_channel.sql`
* `dim_location.sql`
* `fact_sales.sql`
* `PC_Sales_Raw_Data.csv`
* `PCSales_StarSchema.drawio.png`




 



