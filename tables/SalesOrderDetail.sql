CREATE TABLE SaleOrderDetail (
  SaleOrderDetailKey int not null
, SaleOrderKey int not null
, OrderQuantity int
, Price numeric(10,4)
, DiscountPercentage numeric(10,4)
, fulfilled tinyint
, TaxAmount numeric(10,4)
)
