create table dbo.salesheader (
  SalesOrderKey int not null
, CustomerKey int not null
, Active tinyint
, SalesOrderDate datetime
, LastUpdate datetime
)
