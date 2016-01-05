What database system do you recommend? Why do you recommend this system?
=>I recommend a SQL Server Database.  
==>Its one of the most popular and affordable one.  
==>The skill set required is easily available.
==>Its scalable and can take of the client's needs for a long time in the future.
----------------------------------------------------------------------------------------

What KPIs would you recommend for the client?
=>Number of Orders booked by an Employee (Total and Per Customer)
=>Number of Orders booked by Corporation
=>Top n Customers
=>Top n Selling Items
=>Total Sales 
=>Year over Year Sales Comparison (There is no date in the source tables.  I've modeled it to handle -1 for now, which will be used to indicate missing value)
----------------------------------------------------------------------------------------

What data model would you recommend for the client? Describe both the model selected and the reasons for choosing this model.
=>I recommend a Dimensional Model which create a Data Mart.  Please refer to the data-modeling-2_ERD.jpg 
=>Dimensional models are designed to answer the type of Business Intelligence questions the client has
=>Dimensional models are very efficient as they use key based joins 
=>The Model gives a clear picture to the users as to what kind of slicing and dicing they can do and the Measures that are considered
----------------------------------------------------------------------------------------

Write the SQL statements to generate tables you are recommending.
=>The file PiraeusDimensionalModel.sql has the DDL script which will create the tables for the Data Mart
----------------------------------------------------------------------------------------

Write SQL statements to populate your tables.
=>The file DimensionalModelETL.sql has the insert statements which populate the Dimensions and Fact tables
----------------------------------------------------------------------------------------

Write SQL statements to be used by the analytics team to identify top performers by volume and profitability.
=>The file DimensionalModelQueries.sql has two queries to answer the specific questions.  
