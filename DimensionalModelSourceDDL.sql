
CREATE TABLE [AccountingProfitModel12019]
( 
	[APMKey]             int  NOT NULL  IDENTITY ( 1,1 ) ,
	[ItemID]             int  NULL ,
	[ItemMarginPct]      float(53)  NULL ,
	[ItemProfitDollars]  float(53)  NULL 
)
go

ALTER TABLE [AccountingProfitModel12019]
	ADD CONSTRAINT [PK__Accounti__9F71DB55A499CFBF] PRIMARY KEY  CLUSTERED ([APMKey] ASC)
go

CREATE TABLE [F_EmployeePerformance]
( 
	[EmployeePerformanceKey] char(18)  NOT NULL ,
	[EmployeeKey]        char(18)  NULL ,
	[OrderKey]           char(18)  NULL ,
	[ItemKey]            char(18)  NULL ,
	[OrderQuantity]      char(18)  NULL ,
	[OrderAmount]        char(18)  NULL ,
	[ProfitAmount]       char(18)  NULL 
)
go

ALTER TABLE [F_EmployeePerformance]
	ADD CONSTRAINT [XPKF_EmployeePerformance] PRIMARY KEY  CLUSTERED ([EmployeePerformanceKey] ASC)
go

CREATE TABLE [Goal_mapping_v3]
( 
	[Employee_Number]    bigint  NULL ,
	[Sales_goal_volume]  float(53)  NULL ,
	[Sales_goal_profit]  float(53)  NULL ,
	[Sales_goal_date]    decimal(18)  NULL 
)
go

CREATE TABLE [HRCorporateLocations]
( 
	[CorpLocID]          int  NOT NULL  IDENTITY ( 1,1 ) ,
	[CorpLocName]        nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

ALTER TABLE [HRCorporateLocations]
	ADD CONSTRAINT [PK__HRCorpor__311018786667BD2D] PRIMARY KEY  CLUSTERED ([CorpLocID] ASC)
go

CREATE TABLE [HREmployees]
( 
	[EmpNum]             int  NOT NULL  IDENTITY ( 1,1 ) ,
	[FirstName]          nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[MI]                 nvarchar(10) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[LastName]           nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[PreferredName]      nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[CorpLocID]          int  NULL ,
	[StartDate]          datetime  NULL ,
	[TerminatedDate]     datetime  NULL ,
	[CurrRole]           int  NULL 
)
go

ALTER TABLE [HREmployees]
	ADD CONSTRAINT [PK__HREmploy__D383B277D529F6A9] PRIMARY KEY  CLUSTERED ([EmpNum] ASC)
go

CREATE TABLE [Order_items_all_v3]
( 
	[Order_Item_Number]  int  NOT NULL  IDENTITY ( 1,1 ) ,
	[Parent_Order_Number] int  NULL ,
	[Item_ID]            int  NULL ,
	[Item_Quantity]      int  NULL 
)
go

ALTER TABLE [Order_items_all_v3]
	ADD CONSTRAINT [PK__Order_it__7240AE6199EA836D] PRIMARY KEY  CLUSTERED ([Order_Item_Number] ASC)
go

CREATE TABLE [Orders_all_v3]
( 
	[Order_Number]       int  NOT NULL  IDENTITY ( 1,1 ) ,
	[Order_Amount_US_Dollars] money  NULL ,
	[Customer_Name]      nchar(70) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Customer_Address_1] nchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Customer_Address_2] nchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Customer_City]      nchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Customer_State]     nchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Customer_Zip]       nchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Employee_Number]    int  NOT NULL 
)
go

ALTER TABLE [Orders_all_v3]
	ADD CONSTRAINT [PK__Orders_a__F7046B8B169767A5] PRIMARY KEY  CLUSTERED ([Order_Number] ASC)
go

CREATE TABLE [tblInventoryCategories]
( 
	[ICID]               int  NULL ,
	[ICCatName]          nvarchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[MarketID]           int  NULL 
)
go

CREATE TABLE [tblPriceList]
( 
	[ItemID]             int  NOT NULL  IDENTITY ( 1,1 ) ,
	[ItemName]           nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[ItemPriceUSD]       float(53)  NULL 
)
go

ALTER TABLE [tblPriceList]
	ADD CONSTRAINT [PK__tblPrice__727E83EB9920BC45] PRIMARY KEY  CLUSTERED ([ItemID] ASC)
go


ALTER TABLE [Order_items_all_v3] WITH CHECK 
	ADD CONSTRAINT [Order_items_all_v3_FK] FOREIGN KEY ([Parent_Order_Number]) REFERENCES [Orders_all_v3]([Order_Number])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Order_items_all_v3]
	  WITH CHECK CHECK CONSTRAINT [Order_items_all_v3_FK]
go
