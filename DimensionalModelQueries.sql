--Query to get Salesman performance by Volume

SELECT e.PreferredName,
       e.FirstName,
       e.LastName,
       e.CurrRole,
       SUM(oi.OrderQuantity) 'Sales_Volume'
FROM D_Employee e
     JOIN F_OrderItem oi ON e.EmployeeId = oi.EmployeeId
GROUP BY e.PreferredName,
         e.FirstName,
         e.LastName,
         e.CurrRole
order by Sales_Volume desc


--Query to get Salesman performance by Profitability

SELECT e.PreferredName,
       e.FirstName,
       e.LastName,
       e.CurrRole,
       SUM(oi.ProfitAmount) 'Profit_Amount'
FROM D_Employee e
     JOIN F_OrderItem oi ON e.EmployeeId = oi.EmployeeId
GROUP BY e.PreferredName,
         e.FirstName,
         e.LastName,
         e.CurrRole
order by Profit_Amount desc