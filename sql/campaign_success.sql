-- Which campaign had the most total purchases?
SELECT
    'Campaign 1' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS total_purchases,
    AVG(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS avg_purchases_per_customer
FROM marketing_data
WHERE acceptedcmp1 = 1
UNION
SELECT
    'Campaign 2' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS total_purchases,
    AVG(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS avg_purchases_per_customer
FROM marketing_data
WHERE acceptedcmp2 = 1
UNION
SELECT
    'Campaign 3' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS total_purchases,
    AVG(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS avg_purchases_per_customer
FROM marketing_data
WHERE acceptedcmp3 = 1
UNION
SELECT
    'Campaign 4' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS total_purchases,
    AVG(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS avg_purchases_per_customer
FROM marketing_data
WHERE acceptedcmp4 = 1
UNION
SELECT
    'Campaign 5' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS total_purchases,
    AVG(numdealspurchases + numwebpurchases + numcatalogpurchases + numstorepurchases) AS avg_purchases_per_customer
FROM marketing_data
WHERE acceptedcmp5 = 1
ORDER BY total_purchases DESC;

-- Which campaign made the most sales?
SELECT
    'Campaign 1' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS total_spent_on_purchases,
    AVG(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS avg_spent_per_customer
FROM marketing_data
WHERE acceptedcmp1 = 1
UNION
SELECT
    'Campaign 2' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS total_spent_on_purchases,
    AVG(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS avg_spent_per_customer
FROM marketing_data
WHERE acceptedcmp2 = 1
UNION
SELECT
    'Campaign 3' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS total_spent_on_purchases,
    AVG(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS avg_spent_per_customer
FROM marketing_data
WHERE acceptedcmp3 = 1
UNION
SELECT
    'Campaign 4' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS total_spent_on_purchases,
    AVG(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS avg_spent_per_customer
FROM marketing_data
WHERE acceptedcmp4 = 1
UNION
SELECT
    'Campaign 5' AS campaign,
    COUNT(*) AS num_accepted,
    SUM(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS total_spent_on_purchases,
    AVG(mntwines + mntsweetproducts + mntmeatproducts + mntgoldprods + mntfruits + mntfishproducts) AS avg_spent_per_customer
FROM marketing_data
WHERE acceptedcmp5 = 1
ORDER BY total_spent_on_purchases DESC;