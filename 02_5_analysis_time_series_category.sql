WITH yearly AS (
    SELECT
        substr("Order Date", 7, 4) AS year,
        Category,
        ROUND(SUM(Sales), 2) AS total_revenue
    FROM orders
    GROUP BY 
        substr("Order Date", 7, 4),
        Category
)

SELECT
    year,
    Category,
    total_revenue
FROM yearly
ORDER BY 
    year,
    Category;