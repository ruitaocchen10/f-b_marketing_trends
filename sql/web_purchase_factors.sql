-- Avg number of web purchases by income bracket
SELECT 
ROUND(AVG(numwebpurchases), 2) as average_web_purchases,
CASE 
    WHEN income > 80000 THEN 'high income'
    WHEN income BETWEEN 60000 AND 80000 THEN 'average income'
    WHEN income BETWEEN 40000 AND 60000 THEN 'lower income'
    WHEN income < 40000 THEN 'broke'
END AS income_bracket
FROM marketing_data
WHERE income IS NOT NULL
GROUP BY income_bracket
ORDER BY average_web_purchases DESC
;

-- Average number of web purchases by education bracket
SELECT 
ROUND(AVG(numwebpurchases), 2) AS average_web_purchases, 
education,
COUNT(education) AS amount_of_people
FROM marketing_data
GROUP BY education
ORDER BY average_web_purchases DESC
;

-- Average number of web puchases by amount of web visits per month
SELECT 
ROUND(AVG(numwebpurchases), 2) AS average_web_purchases, 
CASE 
    WHEN numwebvisitsmonth > 6 THEN 'high visits'
    WHEN numwebvisitsmonth BETWEEN 4 AND 6 THEN 'medium visits'
    WHEN numwebvisitsmonth BETWEEN 2 AND 4 THEN 'low visits'
    WHEN numwebvisitsmonth < 2 THEN 'rare visits'
END AS amtofvisits,
COUNT(numwebvisitsmonth) AS amount_of_people
FROM marketing_data
GROUP BY amtofvisits
ORDER BY average_web_purchases DESC
;

-- Average web purchases by children owner status
SELECT
    ROUND(AVG(numwebpurchases), 2) as average_web_purchases, 
    CASE
        WHEN kidhome >=1 THEN 'kid owner'
        WHEN teenhome >= 1 THEN 'teen owner'
        ELSE 'no kids'
    END AS customer_children
FROM marketing_data
GROUP BY customer_children
;

-- Average web purchases by campaign accepted
SELECT
    ROUND(AVG(numwebpurchases), 2) AS average_web_purchases, 
    CASE
        WHEN acceptedcmp1 = 1 THEN 'Accepted Campaign 1'
        WHEN acceptedcmp2 = 1 THEN 'Accepted Campaign 2'
        WHEN acceptedcmp3 = 1 THEN 'Accepted Campaign 3'
        WHEN acceptedcmp4 = 1 THEN 'Accepted Campaign 4'
        WHEN acceptedcmp5 = 1 THEN 'Accepted Campaign 5'
        ELSE 'Did not accept campaign'
    END AS marketing_campaign
FROM marketing_data
GROUP BY marketing_campaign
ORDER BY average_web_purchases DESC
;

-- Union queries for Tableau Visualization
SELECT 
    'Income' AS factor_category,
    CASE 
        WHEN income > 70000 THEN 'high income'
        WHEN income BETWEEN 50000 AND 70000 THEN 'average income'
        WHEN income BETWEEN 30000 AND 50000 THEN 'lower income'
        WHEN income < 30000 THEN 'very low'
    END AS factor_level,
    ROUND(AVG(numwebpurchases), 2) AS avg_web_purchases,
    COUNT(*) AS count_customers
FROM marketing_data
WHERE income IS NOT NULL
GROUP BY factor_level

UNION ALL

SELECT 
    'Education' AS factor_category,
    education AS factor_level,
    ROUND(AVG(numwebpurchases), 2) AS avg_web_purchases,
    COUNT(*) AS count_customers
FROM marketing_data
GROUP BY education

UNION ALL

SELECT 
    'Web Visits' AS factor_category,
    CASE 
        WHEN numwebvisitsmonth > 6 THEN 'high visits'
        WHEN numwebvisitsmonth BETWEEN 4 AND 6 THEN 'medium visits'
        WHEN numwebvisitsmonth BETWEEN 2 AND 4 THEN 'low visits'
        WHEN numwebvisitsmonth < 2 THEN 'rare visits'
    END AS factor_level,
    ROUND(AVG(numwebpurchases), 2) AS avg_web_purchases,
    COUNT(*) AS count_customers
FROM marketing_data
GROUP BY factor_level

UNION ALL

SELECT
    'Children Status' AS factor_category,
    CASE
        WHEN kidhome >= 1 THEN 'kid owner'
        WHEN teenhome >= 1 THEN 'teen owner'
        ELSE 'no kids'
    END AS factor_level,
    ROUND(AVG(numwebpurchases), 2) AS avg_web_purchases,
    COUNT(*) AS count_customers
FROM marketing_data
GROUP BY factor_level

UNION ALL

SELECT
    'Campaign Acceptance' AS factor_category,
    CASE
        WHEN acceptedcmp1 = 1 THEN 'Accepted Campaign 1'
        WHEN acceptedcmp2 = 1 THEN 'Accepted Campaign 2'
        WHEN acceptedcmp3 = 1 THEN 'Accepted Campaign 3'
        WHEN acceptedcmp4 = 1 THEN 'Accepted Campaign 4'
        WHEN acceptedcmp5 = 1 THEN 'Accepted Campaign 5'
        ELSE 'Did not accept campaign'
    END AS factor_level,
    ROUND(AVG(numwebpurchases), 2) AS avg_web_purchases,
    COUNT(*) AS count_customers
FROM marketing_data
GROUP BY factor_level

ORDER BY factor_category, avg_web_purchases DESC;