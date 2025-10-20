# Marketing Campaign Analysis

Analyzing customer behavior, campaign performance, and product preferences using SQL and Python to derive actionable marketing insights from a Kaggle dataset.

## Dataset Overview

**Source:** [Marketing Campaign Dataset](https://mavenanalytics.io/data-playground/marketing-campaign-results?utm_source=chatgpt.com)

The dataset contains customer demographics, purchasing behavior across 6 product categories, campaign acceptance rates, and channel preferences spanning 2012-2014.

## Analysis Components

### 1. Campaign Performance Analysis
Evaluated the effectiveness of 5 marketing campaigns by measuring acceptance rates, total purchases generated, and revenue per customer.

**Tools:** PostgreSQL

**Results:**
- Campaign 5 won with 15% acceptance and $263k revenue
- Campaign 5 has best ROI at $1,616 per customer
- Campaign 2 failed catastrophically (1.3% acceptance) — discontinue immediately

### 2. Product Category Performance
Assessed customer engagement and spending across 6 product categories to identify top performers and growth opportunities.

**Tools:** PostgreSQL

**Results:**
- Wines ($681k) and Meat ($374k) dominate—76% of total revenue
- Fruits ($59k) are the worst performer despite good reach
- Meat has 100% penetration—every customer buys it

### 3. Customer Segmentation (K-Means Clustering)
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

### 4. Purchase Channel Analysis
Investigated factors driving web purchases including income brackets, education levels, website visit frequency, and family status.

**Tools:** PostgreSQL

**Results:**
- Upper-middle income ($60-80k) customers make the most web purchases (5.66 avg)
- Critical paradox: Customers who visit the website MORE make FEWER purchases—this indicates serious conversion problems

## Tableau Visualizations

**Source:**: https://public.tableau.com/app/profile/ruitao.chen/viz/MarketingCampaignAnalysis_17606248101080/Dashboard1

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

## Key Business Recommendations

Based on the analysis:
1. Fix Campaign 2 - Either redesign completely or kill it and reallocate budget.
2. Optimize for High-Income Customers - The $60K-$90K income bracket makes 184% more web purchases than the lowest bracket. Web experience should prioritize this segment.
3. Solve the Web Browsing Problem - Customers visiting 7+ times per month actually purchase LESS than those visiting 3-4 times. This suggests friction in your checkout or decision-making process.
4. Tailoring campaigns to the 4 identified customer personas

## Author

**Ruitao Chen**

Feel free to connect or reach out with questions about this analysis.

## License

This project is available for educational and portfolio purposes.
