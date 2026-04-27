DROP TABLE [PcSalesDW].[dbo].[DimLocation];

CREATE TABLE [PcSalesDW].[dbo].[DimLocation] (
    LocationKey INT IDENTITY(1,1) PRIMARY KEY,
    Continent VARCHAR(50),
    Country_or_State VARCHAR(50),
    Province_or_City VARCHAR(100)
);

INSERT INTO [PcSalesDW].[dbo].[DimLocation]
(
    Continent,
    Country_or_State,
    Province_or_City
)
SELECT DISTINCT
    Continent,
    Country_or_State,
    Province_or_City
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];