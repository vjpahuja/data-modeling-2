
DROP TABLE [F_OrderItem]
go

DROP TABLE [D_Item]
go

DROP TABLE [D_Date]
go

DROP TABLE [D_Corporation]
go

DROP TABLE [F_EmployeeGoal]
go

DROP TABLE [F_OrderSummary]
go

DROP TABLE [D_Customer]
go

DROP TABLE [D_Employee]
go

CREATE TABLE [D_Corporation]
( 
	[CorporationId]      integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[CorpLocName]        nvarchar(50)  NULL ,
	[CorpLocId]          int  NULL 
)
go

ALTER TABLE [D_Corporation]
	ADD CONSTRAINT [XPK_D_Corporation] PRIMARY KEY  CLUSTERED ([CorporationId] ASC)
go

CREATE TABLE [D_Customer]
( 
	[CustomerId]         integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[Customer_Name]      nchar(70)  NULL ,
	[Customer_Address_1] nchar(150)  NULL ,
	[Customer_Address_2] nchar(150)  NULL ,
	[Customer_City]      nchar(100)  NULL ,
	[Customer_State]     nchar(30)  NULL ,
	[Customer_Zip]       nchar(20)  NULL 
)
go

ALTER TABLE [D_Customer]
	ADD CONSTRAINT [XPK_D_Customer] PRIMARY KEY  CLUSTERED ([CustomerId] ASC)
go

CREATE TABLE [D_Date]
( 
	[DateId]             integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[CalenderDate]       datetime  NULL ,
	[CalendarYear]       smallint  NULL ,
	[CalenderMonth]      smallint  NULL ,
	[CanderDay]          smallint  NULL 
)
go

ALTER TABLE [D_Date]
	ADD CONSTRAINT [XPKD_Date] PRIMARY KEY  CLUSTERED ([DateId] ASC)
go

CREATE TABLE [D_Employee]
( 
	[EmployeeId]         integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[FirstName]          nvarchar(50)  NULL ,
	[MI]                 nvarchar(10)  NULL ,
	[LastName]           nvarchar(50)  NULL ,
	[PreferredName]      nvarchar(150)  NULL ,
	[StartDate]          datetime  NULL ,
	[TerminatedDate]     datetime  NULL ,
	[CurrRole]           integer  NULL ,
	[EmpNum]             int  NULL ,
	[CorpLocID]          int  NULL 
)
go

ALTER TABLE [D_Employee]
	ADD CONSTRAINT [XPK_D_Employee] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC)
go

CREATE TABLE [D_Item]
( 
	[ItemID]             integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[ItemName]           nvarchar(100)  NULL ,
	[ItemPriceUSD]       float  NULL ,
	[SourceItemId]       int  NULL 
)
go

ALTER TABLE [D_Item]
	ADD CONSTRAINT [XPK_D_Item] PRIMARY KEY  CLUSTERED ([ItemID] ASC)
go

CREATE TABLE [F_EmployeeGoal]
( 
	[EmployeeId]         integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[Sales_goal_volume]  float  NULL ,
	[Sales_goal_profit]  float  NULL ,
	[Sales_goal_date]    decimal(18)  NULL 
)
go

ALTER TABLE [F_EmployeeGoal]
	ADD CONSTRAINT [XPKF_EmployeeGoal] PRIMARY KEY  CLUSTERED ([EmployeeId] ASC)
go

CREATE TABLE [F_OrderItem]
( 
	[OrderItemId]        integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[CorporationId]      integer  NOT NULL ,
	[EmployeeId]         integer  NOT NULL ,
	[DateId]             integer  NOT NULL 
	CONSTRAINT [Default_Value_349_650399565]
		 DEFAULT  -1,
	[ItemID]             integer  NOT NULL ,
	[CustomerId]         integer  NOT NULL ,
	[OrderQuantity]      integer  NULL ,
	[OrderAmount]        double precision  NULL ,
	[ProfitAmount]       double precision  NULL ,
	[OrderNumber]        int  NOT NULL ,
	[OrderItemNumber]    int  NOT NULL 
)
go

ALTER TABLE [F_OrderItem]
	ADD CONSTRAINT [XPKF_OrderItem] PRIMARY KEY  CLUSTERED ([OrderItemId] ASC,[CorporationId] ASC,[EmployeeId] ASC,[DateId] ASC,[ItemID] ASC,[CustomerId] ASC,[OrderNumber] ASC,[OrderItemNumber] ASC)
go

CREATE TABLE [F_OrderSummary]
( 
	[OrderSummaryId]     integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[EmployeeId]         integer  NOT NULL ,
	[CustomerId]         integer  NOT NULL ,
	[OrderNumber]        integer  NULL ,
	[OrderAmount]        double precision  NULL 
)
go

ALTER TABLE [F_OrderSummary]
	ADD CONSTRAINT [XPKF_OrderSummary] PRIMARY KEY  CLUSTERED ([OrderSummaryId] ASC,[EmployeeId] ASC,[CustomerId] ASC)
go


ALTER TABLE [F_EmployeeGoal]
	ADD CONSTRAINT [R_5] FOREIGN KEY ([EmployeeId]) REFERENCES [D_Employee]([EmployeeId])
go


ALTER TABLE [F_OrderItem]
	ADD CONSTRAINT [R_6] FOREIGN KEY ([CorporationId]) REFERENCES [D_Corporation]([CorporationId])
go

ALTER TABLE [F_OrderItem]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([EmployeeId]) REFERENCES [D_Employee]([EmployeeId])
go

ALTER TABLE [F_OrderItem]
	ADD CONSTRAINT [R_8] FOREIGN KEY ([DateId]) REFERENCES [D_Date]([DateId])
go

ALTER TABLE [F_OrderItem]
	ADD CONSTRAINT [R_9] FOREIGN KEY ([ItemID]) REFERENCES [D_Item]([ItemID])
go

ALTER TABLE [F_OrderItem]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([CustomerId]) REFERENCES [D_Customer]([CustomerId])
go


ALTER TABLE [F_OrderSummary]
	ADD CONSTRAINT [R_2] FOREIGN KEY ([EmployeeId]) REFERENCES [D_Employee]([EmployeeId])
go

ALTER TABLE [F_OrderSummary]
	ADD CONSTRAINT [R_4] FOREIGN KEY ([CustomerId]) REFERENCES [D_Customer]([CustomerId])
go
