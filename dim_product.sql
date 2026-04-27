DROP TABLE [PcSalesDW].[dbo].[DimProduct];

CREATE TABLE [PcSalesDW].[dbo].[DimProduct] (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    PCMake VARCHAR(50),
    PCModel VARCHAR(100),
    StorageType VARCHAR(50)
);

INSERT INTO [PcSalesDW].[dbo].[DimProduct]
(
    PCMake,
    PCModel,
    StorageType
)
SELECT DISTINCT
    PC_Make,
    PC_Model,
    Storage_Type
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];