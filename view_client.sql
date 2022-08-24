-- ================================================
-- View to display the most active customers
-- ================================================
-- =============================================
-- Author:		<Tarynin,,Iliya>
-- Create date: <24-08-22>
-- Description:	<view client>
-- =============================================
ALTER VIEW dbo.view_client
AS  
select c.Name, c. Surname, od.Amount
from dbo.Clients as c 
	join dbo.Orders as o on c.Id = o.ClientId 
	join dbo.OrderDetails as od on o.Id = od.OrderId
where od.Amount > 1
GO  


