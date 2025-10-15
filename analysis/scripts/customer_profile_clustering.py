import pandas as pd 
import psycopg2 #SQL Database Adapter for Python
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt
import seaborn as sns

connection = psycopg2.connect(
    host="localhost",
    database="marketing_db",
    user="postgres",
    password="Rc3288.2016"
)

query = '''
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
'''

df = pd.read_sql(query, connection)

features_for_clustering = df[['income', 'age', 'num_kids', 'total_spending', 'total_purchases', 'recency']].copy()
features_for_clustering = features_for_clustering.dropna()

scaler = StandardScaler()
scaled_features = scaler.fit_transform(features_for_clustering)

inertias = []
K_range = range(2, 11)

for k in K_range:
    kmeans = KMeans(n_clusters=k, random_state=42)
    kmeans.fit(scaled_features)
    inertias.append(kmeans.inertia_)

plt.figure(figsize=(10,6))
plt.plot(K_range, inertias, 'bo-')
plt.xlabel('Number of Clusters')
plt.ylabel('Inertia')
plt.title('Elbow Method - Finding Optimal Clusters')
plt.show()

optimal_k = 4
kmeans = KMeans(n_clusters=optimal_k, random_state=42)
df['cluster'] = kmeans.fit_predict(scaled_features)

cluster_profiles = df.groupby('cluster').agg({
    'income': 'mean',
    'age': 'mean',
    'num_kids': 'mean',
    'total_spending': 'mean',
    'total_purchases': 'mean',
    'recency': 'mean',
    'education': lambda x: x.mode()[0] if not x.mode().empty else 'Unknown',
    'marital_status': lambda x: x.mode()[0] if not x.mode().empty else 'Unknown'
}).round(2)

cluster_profiles['count'] = df.groupby('cluster').size()

print("\n=== CUSTOMER SEGMENTS ===\n")
print(cluster_profiles)

for cluster_id in range(optimal_k):
    cluster_data = df[df['cluster'] == cluster_id]
    
    print(f"\n--- CLUSTER {cluster_id} ---")
    print(f"Size: {len(cluster_data)} customers")
    print(f"Average Income: ${cluster_data['income'].mean():,.0f}")
    print(f"Average Age: {cluster_data['age'].mean():.0f}")
    print(f"Average Kids: {cluster_data['num_kids'].mean():.1f}")
    print(f"Average Spending: ${cluster_data['total_spending'].mean():,.0f}")
    print(f"Most Common Education: {cluster_data['education'].mode()[0]}")
    print(f"Most Common Marital Status: {cluster_data['marital_status'].mode()[0]}")
    
plt.figure(figsize=(10, 6))
scatter = plt.scatter(df['income'], df['total_spending'], 
                     c=df['cluster'], cmap='viridis', alpha=0.6)
plt.xlabel('Income')
plt.ylabel('Total Spending')
plt.title('Customer Segments')
plt.colorbar(scatter, label='Cluster')
plt.show()

connection.close()