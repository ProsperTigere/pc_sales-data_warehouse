DROP TABLE [PcSalesDW].[dbo].[DimPayment];

CREATE TABLE [PcSalesDW].[dbo].[DimPayment] (
    PaymentKey INT IDENTITY(1,1) PRIMARY KEY,
    PaymentMethod VARCHAR(100)
);

INSERT INTO [PcSalesDW].[dbo].[DimPayment]
(
    PaymentMethod
)
SELECT DISTINCT
    Payment_Method
FROM [PcSalesDW].[dbo].[Stg_PC_Sales];