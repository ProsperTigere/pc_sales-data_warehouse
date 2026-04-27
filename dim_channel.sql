DROP TABLE [PcSalesDW].[dbo].[DimChannel];

CREATE TABLE [PcSalesDW].[dbo].[DimChannel] (
    ChannelKey INT IDENTITY(1,1) PRIMARY KEY,
    Channel VARCHAR(100)
);

INSERT INTO [PcSalesDW].[dbo].[DimChannel]
(
    Channel
)
SELECT DISTINCT
    Channel
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];