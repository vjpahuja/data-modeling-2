INSERT INTO [dbo].[D_Corporation]([CorpLocName])
       SELECT [CorpLocName]
       FROM [dbo].[HRCorporateLocations];
GO

-------------

INSERT INTO [dbo].[D_Customer]
([Customer_Name],
 [Customer_Address_1],
 [Customer_Address_2],
 [Customer_City],
 [Customer_State],
 [Customer_Zip]
)
       SELECT DISTINCT
              [Customer Name],
              [Customer Address 1],
              [Customer Address 2],
              [Customer City],
              [Customer State],
              [Customer Zip]
       FROM [dbo].[Orders all v3];
GO

--------------------------
INSERT INTO [dbo].[D_Employee]
([FirstName],
 [MI],
 [LastName],
 [PreferredName],
 [StartDate],
 [TerminatedDate],
 [CurrRole]
)
       SELECT [FirstName],
              [MI],
              [LastName],
              [PreferredName],
              [CorpLocID],
              [StartDate],
              [TerminatedDate],
              [CurrRole]
       FROM [dbo].[HREmployees];
GO
-----------------------------

INSERT INTO [dbo].[D_Item]
([ItemName],
 [ItemPriceUSD]
)
       SELECT [ItemName],
              [ItemPriceUSD]
       FROM [dbo].[tblPriceList];
GO

---------------------------

INSERT INTO [dbo].[F_EmployeeGoal]
([Sales_goal_volume],
 [Sales_goal_profit],
 [Sales_goal_date]
)
       SELECT [Sales goal volume],
              [Sales goal profit],
              [Sales goal date]
       FROM [dbo].[Goal mapping v3];
GO

---------------------------------
INSERT INTO [dbo].[F_OrderItem]
([CorporationId],
 [EmployeeId],
 --[DateId],
 [ItemID],
 [CustomerId],
 [OrderQuantity],
 [OrderAmount],
 [ProfitAmount]
)
       SELECT corp.CorporationId,
              emp.EmployeeId,
              --Need to resolve Date as its not there in the source table, but should be.
              item.ItemId,
              cust.CustomerId,
              oi.[Item Quantity],
              oi.[Item Quantity] * pl.ItemPriceUSD,
              apm.itemProfitDollars
       FROM [Order items all v3] oi
            INNER JOIN [dbo].[Orders all v3] o ON oi.[Parent Order Number] = o.[Order Number]
            INNER JOIN D_Item item ON oi.[Item ID] = item.SourceItemId
            INNER JOIN [AccountingProfitModel12019] apm ON oi.[Item ID] = apm.ItemID
            INNER JOIN D_Customer cust ON o.[Customer Name] = cust.customer_name
            INNER JOIN D_Employee emp ON o.[Employee Number] = emp.EmpNum
            INNER JOIN D_Corporation corp ON emp.corplocid = corp.corplocid
            INNER JOIN [dbo].[tblPriceList] pl ON pl.ItemID = oi.[Item ID];