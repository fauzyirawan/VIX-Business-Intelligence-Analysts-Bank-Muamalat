CREATE TABLE rakamin.master_table2 AS(
  SELECT
    Date AS order_date,
    CategoryName AS category_name,
    ProdName AS product_name,
    Price AS product_price,
    Quantity AS order_qty,
    SUM (Quantity * Price) AS total_sales,
    CustomerEmail AS cust_email,
    CustomerCity AS cust_city, 
  FROM
    rakamin.master_table
  GROUP BY
    order_date,
    category_name,
    product_name,
    product_price,
    order_qty,
    cust_email,
    cust_city
);