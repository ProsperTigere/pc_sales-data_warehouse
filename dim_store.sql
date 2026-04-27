DROP TABLE [PcSalesDW].[dbo].[DimStore];

CREATE TABLE [PcSalesDW].[dbo].[DimStore] (
    StoreKey INT IDENTITY(1,1) PRIMARY KEY,
    ShopName VARCHAR(100),
    ShopAge INT
);

INSERT INTO [PcSalesDW].[dbo].[DimStore]
(
    ShopName,
    ShopAge
)
SELECT DISTINCT
    Shop_Name,
    Shop_Age
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];