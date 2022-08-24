-- ================================================
-- the procedure returns the most popular products for the selected period
-- ================================================
-- =============================================
-- Author:		<Tarynin,,Iliya>
-- Create date: <24-08-22>
-- Description:	<Get Product>
-- =============================================
ALTER PROCEDURE [dbo].[sp_getProduct] 

	@dateFrom datetime2(7) 
	,@dateTo datetime2(7) 
	,@productTypeId uniqueidentifier
AS
BEGIN
	select p.Name, p.Id, od.Amount 
from dbo.Orders as o 
	join dbo.OrderDetails as od on o.Id = od.OrderId  
	join dbo.Products as p on p.Id = od.ProductId
where o.OrderStatus = 3 and o.CreatedDate >  @dateFrom and  o.CreatedDate < @dateTo and p.ProductTypeId = @productTypeId
group by p.Id, p.Name, od.Amount
order by od.Amount
END
GO
