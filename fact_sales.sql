DROP TABLE [PcSalesDW].[dbo].[FactSales];

CREATE TABLE [PcSalesDW].[dbo].[FactSales] (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerKey INT,
    ProductKey INT,
    StoreKey INT,
    SalesPersonKey INT,
    PurchaseDateKey INT,
    ShipDateKey INT,
    PaymentKey INT,
    ChannelKey INT,
    LocationKey INT,
    SalePrice DECIMAL(10,2),
    CostPrice DECIMAL(10,2),
    DiscountAmount DECIMAL(10,2),
    FinanceAmount DECIMAL(10,2),
    RepairCost DECIMAL(10,2),
    MarketPrice DECIMAL(10,2)
);

INSERT INTO [PcSalesDW].[dbo].[FactSales]
(
    CustomerKey,
    ProductKey,
    StoreKey,
    SalesPersonKey,
    PurchaseDateKey,
    ShipDateKey,
    PaymentKey,
    ChannelKey,
    LocationKey,
    SalePrice,
    CostPrice,
    DiscountAmount,
    FinanceAmount,
    RepairCost,
    MarketPrice
)
SELECT
    c.CustomerKey,
    p.ProductKey,
    s.StoreKey,
    sp.SalesPersonKey,

    (SELECT TOP 1 DateKey
     FROM [PcSalesDW].[dbo].[DimDate] d1
     WHERE d1.PurchaseDate = TRY_CONVERT(DATE, stg.Purchase_Date)),

    (SELECT TOP 1 DateKey
     FROM [PcSalesDW].[dbo].[DimDate] d2
     WHERE d2.ShipDate = ISNULL(
            TRY_CONVERT(DATE, NULLIF(stg.Ship_Date, 'N/A')),
            '2099-12-31'
          )),

    pm.PaymentKey,
    ch.ChannelKey,
    l.LocationKey,

    stg.Sale_Price,
    stg.Cost_Price,
    stg.Discount_Amount,
    stg.Finance_Amount,
    stg.Cost_of_Repairs,
    stg.PC_Market_Price

FROM [PcSalesDW].[dbo].[Stg_PC_Sales] stg
JOIN [PcSalesDW].[dbo].[DimCustomer] c
    ON stg.Customer_Name = c.CustomerName
   AND stg.Customer_Surname = c.CustomerSurname
JOIN [PcSalesDW].[dbo].[DimProduct] p
    ON stg.PC_Model = p.PCModel
JOIN [PcSalesDW].[dbo].[DimStore] s
    ON stg.Shop_Name = s.ShopName
JOIN [PcSalesDW].[dbo].[DimSalesPerson] sp
    ON stg.Sales_Person_Name = sp.SalesPersonName
JOIN [PcSalesDW].[dbo].[DimPayment] pm
    ON stg.Payment_Method = pm.PaymentMethod
JOIN [PcSalesDW].[dbo].[DimChannel] ch
    ON stg.Channel = ch.Channel
JOIN [PcSalesDW].[dbo].[DimLocation] l
    ON stg.Province_or_City = l.Province_or_City;