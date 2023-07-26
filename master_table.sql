CREATE TABLE rakamin.master_table AS (
  SELECT
    c.CustomerID,
    o.OrderID,
    o.Date,
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName,
    c.CustomerEmail,
    c.CustomerPhone,
    c.CustomerAddress,
    c.CustomerCity,
    c.CustomerState,
    c.CustomerZip,
    o.ProdNumber,
    o.Quantity,
    pc.CategoryID,
    pc.CategoryName,
    pc.CategoryAbbreviation,
    p.ProdName,
    p.Category,
    p.Price
  FROM
    rakamin.customers c
  INNER JOIN
    rakamin.orders o ON c.CustomerID = o.CustomerID
  INNER JOIN
    rakamin.products p ON o.ProdNumber = p.ProdNumber
  INNER JOIN
    rakamin.productcategory pc ON p.Category = pc.CategoryID
);
ALTER TABLE rakamin.master_table ADD PRIMARY KEY (CustomerID, ProdNumber, OrderID, CategoryID);