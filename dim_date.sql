DROP TABLE [PcSalesDW].[dbo].[DimDate];

CREATE TABLE [PcSalesDW].[dbo].[DimDate] (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    PurchaseDate DATE,
    ShipDate DATE
);

INSERT INTO [PcSalesDW].[dbo].[DimDate]
(
    PurchaseDate,
    ShipDate
)
SELECT DISTINCT
    TRY_CONVERT(DATE, Purchase_Date),
    ISNULL(
        TRY_CONVERT(DATE, NULLIF(Ship_Date, 'N/A')),
        '2099-12-31'
    )
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];