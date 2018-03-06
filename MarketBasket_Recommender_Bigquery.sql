SELECT
  hits.transaction.transactionId AS InvoiceNo,
  hits.product.productSKU AS StockCode,
  hits.product.v2ProductName AS AirlineDescription,
  hits.product.productQuantity AS Quantity,
  date AS InvoiceDate,
  hits.product.productPrice AS UnitPrice,
  fullVisitorId AS CustomerID,
  geoNetwork.country AS Country
FROM
  TABLE_DATE_RANGE([airnz-ga-bigquery:125557395.ga_sessions_], TIMESTAMP('2018-03-02'), TIMESTAMP('2018-03-05'))
  where hits.transaction.transactionId is not null and hits.product.productQuantity is not null
GROUP BY
  InvoiceNo,
  StockCode,
  AirlineDescription,
  Quantity,
  InvoiceDate,
  UnitPrice,
  CustomerID,
  Country