 PC Sales Data Warehouse

 Overview
This project implements a dimensional data warehouse using a star schema in SQL Server.

The solution transforms raw sales data into a structured format suitable for reporting and analysis.



 Data Model
The warehouse follows a **star schema** design:

- **Fact Table:** FactSales  
- **Dimension Tables:**  
  - DimCustomer  
  - DimProduct  
  - DimStore  
  - DimSalesPerson  
  - DimDate  
  - DimPayment  
  - DimChannel  
  - DimLocation  

---

Process (ETL)
The following steps were performed:

1. Data loaded into a staging table  
2. Data cleaned and transformed  
   - Handled missing values (e.g. 'N/A')  
   - Converted date formats using TRY_CONVERT  
3. Dimension tables created using DISTINCT values  
4. Fact table built using joins across all dimensions  



Key Features
- Star schema design for efficient querying  
- Surrogate keys for all dimensions  
- Cleaned and standardized data  
- Fully reproducible SQL script  



Tools Used
- SQL Server Management Studio (SSMS)  
- Draw.io (for schema design)  



 How to Run
1. Open the SQL script in SSMS  
2. Execute the script from top to bottom  
3. The database, tables, and data will be created automatically  



