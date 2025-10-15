# Marketing Campaign Analysis

A comprehensive analysis of customer behavior, campaign performance, and product preferences using SQL and Python to derive actionable marketing insights from a dataset of 2,240 customers.

## Business Impact

This analysis identifies key customer segments and channel behaviors that can drive marketing ROI. Key findings include higher-income customers making 40% more web purchases and distinct clustering patterns revealing four unique customer personas with different purchasing behaviors.

## Dataset Overview

**Source:** [Marketing Campaign Dataset](https://mavenanalytics.io/data-playground/marketing-campaign-results?utm_source=chatgpt.com)

The dataset contains customer demographics, purchasing behavior across 6 product categories, campaign acceptance rates, and channel preferences spanning 2012-2014.

**Key Metrics:**
- 2,240 customers across multiple countries
- 6 product categories (Wines, Meats, Fruits, Fish, Sweets, Gold)
- 5 marketing campaigns tracked
- 4 purchase channels (Web, Catalog, Store, Deals)

## Analysis Components

### 1. Customer Profiling
Analyzed demographic characteristics to understand the average customer base including income distribution, age demographics, education levels, and family composition.

**Tools:** PostgreSQL

**Key Findings:**
- Average customer income and age profiles
- Education and marital status distributions
- Family structure patterns

### 2. Campaign Performance Analysis
Evaluated the effectiveness of 5 marketing campaigns by measuring acceptance rates, total purchases generated, and revenue per customer.

**Tools:** PostgreSQL

**Key Insights:**
- Campaign-by-campaign comparison of total purchases and revenue
- Average spending per customer who accepted each campaign
- Best and worst performing campaigns identified

### 3. Product Category Performance
Assessed customer engagement and spending across 6 product categories to identify top performers and growth opportunities.

**Tools:** PostgreSQL

**Results:**
- Customer penetration rates by product category
- Revenue contribution by category
- Product affinity patterns

### 4. Customer Segmentation (K-Means Clustering)
Applied unsupervised machine learning to identify 4 distinct customer segments based on demographics, spending patterns, and purchasing behavior.

**Tools:** Python (pandas, scikit-learn), PostgreSQL

**Segmentation Features:**
- Income level
- Age
- Number of children
- Total spending
- Purchase frequency
- Recency of last purchase

**Output:** 4 customer personas with distinct characteristics for targeted marketing

### 5. Purchase Channel Analysis
Investigated factors driving web purchases including income brackets, education levels, website visit frequency, and family status.

**Tools:** PostgreSQL

**Insights:**
- Web purchase behavior by income bracket
- Education level impact on online shopping
- Relationship between website visits and conversions
- Impact of having children on web purchase frequency
- Campaign influence on web channel usage

## Technical Stack

**Database:** PostgreSQL 12+

**Languages & Libraries:**
- Python 3.8+
- pandas - Data manipulation
- psycopg2 - PostgreSQL adapter
- scikit-learn - K-means clustering and preprocessing
- matplotlib & seaborn - Data visualization

**Data Processing:**
- SQL for aggregations and transformations
- StandardScaler for feature normalization
- Elbow method for optimal cluster determination

## Project Structure

```
marketing_data_analysis/
├── data/
│   └── raw/
│       ├── marketing_data.csv
│       └── marketing_data_dictionary.csv
├── sql/
│   ├── schema.sql
│   ├── average_customer.sql
│   ├── campaign_success.sql
│   ├── product_performance.sql
│   ├── queries.sql
│   └── web_purchase_factors.sql
├── analysis/
│   └── scripts/
│       └── customer_profile_clustering.py
└── README.md
```

## Setup Instructions

### Prerequisites
- PostgreSQL (version 12+)
- Python 3.8+
- pip

### Database Setup

1. Create the PostgreSQL database:
```sql
CREATE DATABASE marketing_db;
```

2. Load the schema and data:
```bash
psql -U postgres -d marketing_db -f sql/schema.sql
```

### Python Environment Setup

Install required packages:
```bash
pip install pandas psycopg2 scikit-learn matplotlib seaborn
```

Update database credentials in `customer_profile_clustering.py`:
```python
connection = psycopg2.connect(
    host="localhost",
    database="marketing_db",
    user="your_username",
    password="your_password"
)
```

## Running the Analysis

### SQL Queries
Execute individual SQL files to generate specific insights:
```bash
psql -U postgres -d marketing_db -f sql/campaign_success.sql
```

### Python Clustering Analysis
Run the customer segmentation script:
```bash
python analysis/scripts/customer_profile_clustering.py
```

This generates cluster visualizations and segment profiles.

## Key Business Recommendations

Based on the analysis, consider:
1. Targeting high-income segments with premium product campaigns
2. Optimizing web experience for customers with higher visit frequencies
3. Tailoring campaigns to the 4 identified customer personas
4. Focusing on top-performing product categories and channels

## Future Enhancements

- Implement predictive modeling for campaign response rates
- Time-series analysis of purchase patterns
- Customer lifetime value calculations
- A/B testing framework for campaign optimization

## Author

**Ruitao Chen**

Feel free to connect or reach out with questions about this analysis.

## License

This project is available for educational and portfolio purposes.
