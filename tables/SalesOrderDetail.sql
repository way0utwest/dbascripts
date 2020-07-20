CREATE TABLE SaleOrderDetail (
  SaleOrderDetailKey int not null
, SaleOrderKey int not null
, Quantity int
, Price numeric(10,4)
, DiscountPercentage numeric(10,4)
, fulfilled tinyint
, TaxAmount numeric(10,4)
, ShippedDate date
)
