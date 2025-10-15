-- Query 2: Count how many customers bought each product category
SELECT
    'Wines' AS product_category,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE MntWines > 0

UNION ALL

SELECT
    'Fruits' AS product_category,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE MntFruits > 0

UNION ALL

SELECT
    'Meat Products' AS product_category,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE MntMeatProducts > 0

UNION ALL

SELECT
    'Fish Products' AS product_category,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE MntFishProducts > 0

UNION ALL

SELECT
    'Sweet Products' AS product_category,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE MntSweetProducts > 0

UNION ALL

SELECT
    'Gold Products' AS product_category,
    COUNT(*) AS customer_count
FROM marketing_data
WHERE MntGoldProds > 0

ORDER BY customer_count DESC;