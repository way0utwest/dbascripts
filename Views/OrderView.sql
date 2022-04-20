create view CompleteOrder
as
select sh.*, sd.*
 from SalesOrderHeader sh
inner join SaleOrderDetail sd
on sh.SaleOrderKey = sd.SaleOrderKey
go
