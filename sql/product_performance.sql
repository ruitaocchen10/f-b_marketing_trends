-- Count how many customers bought each product category
SELECT
    'Wines' AS product_category,
    COUNT(*) AS customer_count,
    SUM(mntwines) AS total_sales
FROM marketing_data
WHERE mntwines > 0
UNION ALL
SELECT
    'Fruits' AS product_category,
    COUNT(*) AS customer_count,
    SUM(mntfruits) AS total_sales
FROM marketing_data
WHERE mntfruits > 0
UNION ALL
SELECT
    'Meat Products' AS product_category,
    COUNT(*) AS customer_count,
    SUM(mntmeatproducts) AS total_sales
FROM marketing_data
WHERE mntmeatproducts > 0
UNION ALL
SELECT
    'Fish Products' AS product_category,
    COUNT(*) AS customer_count,
    SUM(mntfishproducts) AS total_sales
FROM marketing_data
WHERE mntfishproducts > 0
UNION ALL
SELECT
    'Sweet Products' AS product_category,
    COUNT(*) AS customer_count,
    SUM(mntsweetproducts) AS total_sales
FROM marketing_data
WHERE mntsweetproducts > 0
UNION ALL
SELECT
    'Gold Products' AS product_category,
    COUNT(*) AS customer_count,
    SUM(mntgoldprods) AS total_sales
FROM marketing_data
WHERE mntgoldprods > 0
;
