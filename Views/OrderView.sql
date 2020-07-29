create view CompleteOrder
as
select *
 from SalesOrderHeader sh
inner join SaleOrderDetail sd
on sh.SaleOrderKey = sd.SaleOrderKey
go
