WITH LatestPrice AS (
    SELECT
        product_id,
        new_price,
        change_date
    FROM Products
    WHERE change_date <= '2019-08-16'
),
RankedPrices AS (
    SELECT
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rnk
    FROM LatestPrice
)
SELECT
    p.product_id,
    COALESCE(rp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) p
LEFT JOIN RankedPrices rp
  ON p.product_id = rp.product_id AND rp.rnk = 1;

