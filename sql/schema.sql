CREATE TABLE marketing_data (
    ID INTEGER PRIMARY KEY,
    Year_Birth INTEGER,
    Education VARCHAR(20),
    Marital_Status VARCHAR(20),
    Income INTEGER,
    Kidhome INTEGER,
    Teenhome INTEGER,
    Dt_Customer DATE,
    Recency INTEGER,
    MntWines INTEGER,
    MntFruits INTEGER,
    MntMeatProducts INTEGER,
    MntFishProducts INTEGER,
    MntSweetProducts INTEGER,
    MntGoldProds INTEGER,
    NumDealsPurchases INTEGER,
    NumWebPurchases INTEGER,
    NumCatalogPurchases INTEGER,
    NumStorePurchases INTEGER,
    NumWebVisitsMonth INTEGER,
    AcceptedCmp3 INTEGER,
    AcceptedCmp4 INTEGER,
    AcceptedCmp5 INTEGER,
    AcceptedCmp1 INTEGER,
    AcceptedCmp2 INTEGER,
    Response INTEGER,
    Complain INTEGER,
    Country VARCHAR(100)
);

COPY marketing_data
FROM '/Users/ruitao/marketing_data/data/raw/marketing_data.csv'
DELIMITER ','
CSV HEADER;