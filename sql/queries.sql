SELECT * FROM marketing_data;

-- Query for customer segmentation
SELECT
    income,
    (2015 - year_birth) AS age,
    education,
    marital_status,
    (kidhome + teenhome) AS num_kids,
    (mntwines + mntfruits + mntmeatproducts + mntfishproducts + 
     mntsweetproducts + mntgoldprods) AS total_spending,
    (numdealspurchases + numwebpurchases + numcatalogpurchases + 
     numstorepurchases) AS total_purchases,
    recency
FROM marketing_data
WHERE income IS NOT NULL
;