DROP TABLE [PcSalesDW].[dbo].[DimCustomer];

CREATE TABLE [PcSalesDW].[dbo].[DimCustomer] (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerSurname VARCHAR(100),
    ContactNumber VARCHAR(50)
);

INSERT INTO [PcSalesDW].[dbo].[DimCustomer]
SELECT DISTINCT
    Customer_Name,
    Customer_Surname,
    Customer_Contact_Number
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];