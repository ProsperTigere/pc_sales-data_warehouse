DROP TABLE [PcSalesDW].[dbo].[DimSalesPerson];

CREATE TABLE [PcSalesDW].[dbo].[DimSalesPerson] (
    SalesPersonKey INT IDENTITY(1,1) PRIMARY KEY,
    SalesPersonName VARCHAR(100),
    Department VARCHAR(100)
);

INSERT INTO [PcSalesDW].[dbo].[DimSalesPerson]
(
    SalesPersonName,
    Department
)
SELECT DISTINCT
    Sales_Person_Name,
    Sales_Person_Department
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];