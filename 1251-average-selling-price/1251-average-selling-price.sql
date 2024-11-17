# Write your MySQL query statement below
WITH PriceMatch AS (
    SELECT
        u.product_id,
        u.units,
        p.price,
        u.units * p.price AS total_price
    FROM
        UnitsSold u
    JOIN
        Prices p
    ON
        u.product_id = p.product_id
        AND u.purchase_date BETWEEN p.start_date AND p.end_date
),
Aggregated AS (
    SELECT
        product_id,
        SUM(total_price) AS total_price,
        SUM(units) AS total_units
    FROM
        PriceMatch
    GROUP BY
        product_id
)
SELECT
    p.product_id,
    ROUND(COALESCE(a.total_price / a.total_units, 0), 2) AS average_price
FROM
    (SELECT DISTINCT product_id FROM Prices) p
LEFT JOIN
    Aggregated a
ON
    p.product_id = a.product_id;
