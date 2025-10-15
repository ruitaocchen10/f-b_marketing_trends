-- What does the average customer look like?
SELECT
    ROUND(AVG(income), 2) AS average_income,
    ROUND(AVG(2015 - year_birth), 2) AS average_age,
    ROUND(AVG(kidhome + teenhome), 2) AS average_amt_of_kids
FROM marketing_data
;

-- Marital Status Breakdown
SELECT 
COUNT(marital_status) AS amount,
marital_status
FROM marketing_data
GROUP BY marital_status
ORDER BY amount DESC
;

-- Education Breakdown
SELECT 
COUNT(education) AS amount,
education
FROM marketing_data
GROUP BY education
ORDER BY amount DESC
;
