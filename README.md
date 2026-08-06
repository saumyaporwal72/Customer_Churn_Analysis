## Customer Churn Analysis & Prediction
 
## Project Overview

Customer churn is one of the biggest challenges faced by subscription-based businesses. This project analyzes customer behavior, identifies factors contributing to churn, and develops predictive insights to help businesses improve customer retention.

The analysis combines data cleaning, exploratory data analysis (EDA), feature engineering, SQL analysis, and Power BI dashboarding to uncover patterns behind customer attrition and provide actionable business recommendations.

## Business Objective

The primary goals of this project are:

- Identify key factors influencing customer churn.
- Analyze customer demographics and service usage patterns.
- Measure revenue at risk due to customer attrition.
- Discover high-risk customer segments.
- Provide data-driven recommendations to improve retention.
- Build interactive dashboards for business stakeholders.

## Tools & Technologies
- Python :
Pandas,
NumPy,
Matplotlib,
Seaborn
- SQL:
Data extraction,
Aggregation,
Customer segmentation,
- Power BI :
Interactive dashboards
KPI tracking
Churn visualization

## Dataset Description

The dataset contains customer information including:

- Customer Demographics
- Contract Type
- Tenure
- Monthly Charges
- Total Charges
- Internet Services
- Additional Services
- Payment Methods
- Churn Status

## Exploratory Data Analysis (EDA)

The Exploratory Data Analysis (EDA) phase was conducted to understand the characteristics of the dataset, identify patterns, detect anomalies, and uncover the key factors influencing customer churn. The analysis is divided into Univariate, Bivariate, and Multivariate Analysis.

The EDA phase focuses on understanding customer behavior, identifying churn patterns, and uncovering relationships between customer demographics, services, and churn.


### Univariate Analysis
1- Churn Distribution

<img width="919" height="293" alt="image" src="https://github.com/user-attachments/assets/71c97a25-ba53-4e1d-a6df-e39f23608ebe" />


> ### 💡 Business Insight
> The company retains 77.5% of its customers; however, the 22.5% churn rate equates to 133,817 lost customers, highlighting a meaningful opportunity to    improve retention and protect recurring revenue.
>
> -  **Retention Rate:** **77.5%**
> -  **Churn Rate:** **22.5%**
> -  **Customers Lost:** **133,817**
> -  **Business Impact:** Nearly **1 in 4 customers** churn, representing a significant opportunity to improve customer retention and protect recurring revenue.


2- Tenure- Customer Lifecycle

<img width="886" height="254" alt="image" src="https://github.com/user-attachments/assets/f697de4f-a705-4de5-a309-122d48911897" />

> ### 💡 Business Insight
> Customer tenure follows a healthy lifecycle, with 48.7% of customers classified as Loyal (37+ months). Since customer churn typically occurs during the early stages of the customer journey, improving onboarding, engagement, and personalized support during the first three years can substantially enhance long-term retention.
>
> - **Average Tenure:** **36.6 months**
> - **Median Tenure:** **35 months**
> - **50% of customers stay between 12 and 62 months**
> - **48.7% of customers have remained loyal for over 37 months**

3- Monthly Charges- Price Distribution
<img width="894" height="252" alt="image" src="https://github.com/user-attachments/assets/29e898dc-5b6c-4c1c-a8e3-b8f6fc1655ce" />

> ### 💡 Business Insight
> The average monthly charge ($66) is lower than the median ($74), indicating that lower-priced plans pull the average downward while most customers actually pay around $74 per month. This suggests a customer base skewed toward medium-to-high value subscriptions, providing strong opportunities for revenue growth through targeted upselling and retention initiatives.

4- Total Charges

<img width="883" height="328" alt="image" src="https://github.com/user-attachments/assets/715c6905-2a94-4147-9238-92b263df2bf5" />

> ### 💡 Business Insight
> - **Correlation with tenure:** **0.770**
> - **Correlation with MonthlyCharges:** **0.634**

> Customers who stay longer consistently generate higher cumulative revenue, as evidenced by the strong 0.77 correlation between tenure and Total Charges. This highlights that customer retention is not only a loyalty metric but also a key revenue driver, where extending customer relationships directly increases Customer Lifetime Value (CLV) and business profitability.

5- Categorical Columns — Frequency Distribution (gender, SeniorCitizen, Partner, Dependents, PhoneService, PaperlessBilling)

<img width="885" height="525" alt="image" src="https://github.com/user-attachments/assets/822c0f70-0b01-4e68-9b99-8797e79ff3fc" />

> ### 💡 Business Insight
> 
> 6 bar charts in a 2×3 grid. Gender: nearly 50/50 (male 50.3%, female 49.7%). SeniorCitizen: heavily skewed — only 11.4% senior. Partner: 52.1% have a partner. Dependents: only 30.3% have dependents. PhoneService: 93.9% have phone service. PaperlessBilling: 61.5% use paperless billing.
> 
> Gender is nearly balanced — unlikely to be a strong churn predictor. (2) SeniorCitizen is imbalanced (88.6% non-senior) — we will check if bivariate analysis is statistically reliable for the 11.4% senior group. (3) Only 30% have dependents — dependents create switching friction (family plans), so this might reduce churn. (4) 93.9% phone service penetration means PhoneService binary adds little value — Service_Count is better


6- Contract Type — Billing Category Contract (3 categories: Month-to-month, One year, Two year)

<img width="878" height="394" alt="image" src="https://github.com/user-attachments/assets/af30935b-c942-4d17-8bbb-7fa28d512c85" />

> ### 💡 Business Insight
>
> Horizontal bar: Month-to-month is by far the largest group (~50.3%), One year ~18.2%, Two year ~31.5%. Donut chart confirms the skew. Month-to-month customers dominate the dataset.
>
> Contract type distribution showed 50.3% of customers on month-to-month contracts — the majority in the highest-risk segment. This means even a 5% improvement in month-to-month retention impacts more than 3,500 customers. The high concentration in month-to-month made it the single most important segment to investigate in the bivariate analysis
>

7- InternetService — Service Type InternetService (3 categories: DSL, Fiber optic, No)

<img width="844" height="318" alt="image" src="https://github.com/user-attachments/assets/5342d07e-4115-4872-b6fa-74caac1d222d" />


> ### 💡 Business Insight
> Panel 1: Fiber Optic ~45.8%, DSL ~30.5%, No Internet ~23.7%.
> Panel 2: Fiber Optic customers pay ~92/mon, dsl~62/mo, No Internet pays ~$21/mo. The charge gap between Fiber and DSL is enormous.


8- PaymentMethod — Billing Channel PaymentMethod (4 categories: Bank transfer auto, Credit card auto, Electronic check, Mailed check)

<img width="830" height="353" alt="image" src="https://github.com/user-attachments/assets/d3205c4b-884e-4f44-a6fe-bbaf7b8d6933" />

> ### 💡 Business Insight
>
> Panel 1: Electronic check is the LARGEST single payment method (36.2%),Bank transfer auto (20.4%),Credit card auto (22.5%),Mailed(20.8%). Panel 2: Auto vs Manual is approximately 43% auto, 57% manual. The majority of customers use manual payment methods.
> 
> Electronic check being the single largest payment method . 57% of customers use manual payment — this is the target population for auto-pay enrollment campaigns. If we can shift electronic check users to bank transfer auto, we expect significant churn reduction.


9- Service Columns — Adoption Rate OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies

<img width="893" height="488" alt="image" src="https://github.com/user-attachments/assets/07630416-7480-42cd-8b65-e47e89a6be58" />

> ### 💡 Business Insight
> Service Adoption Rates (% Yes):
  OnlineSecurity      : 27.6%
  OnlineBackup        : 34.2%
  DeviceProtection    : 34.7%
  TechSupport         : 27.8%
  StreamingTV         : 40.4%
  StreamingMovies     : 40.6%
>
> Service adoption rates showed all six add-ons have 25-45% adoption among internet customers — all are viable for bivariate analysis. Streaming services had the highest adoption (40.6%) while security had lower (~29%). This motivated my Service_Count feature engineering: summing these binary columns into one stickiness measure.

10- Service Count

<img width="978" height="496" alt="image" src="https://github.com/user-attachments/assets/d45edd9b-5a91-4989-bb51-d65c54690613" />

> ### 💡 Business Insight
> The service count distribution confirms that most customers have 1-4 services — the low end of the spectrum. The fact that very few customers have 5+ services is an OPPORTUNITY: these high-stickiness customers are underrepresented but have the lowest churn. Driving more customers to 5+ services (through bundling) is the key retention lever.

11- SeniorCitizen — Demographic Vulnerability SeniorCitizen (binary: 0=Non-Senior, 1=Senior)

<img width="965" height="413" alt="image" src="https://github.com/user-attachments/assets/cb1fe536-0db7-4969-8e6c-f7a6a96aa734" />

> ### 💡 Business Insight
> Seniors represent only 11.4% of customers — a meaningful but minority group. The fact that seniors pay SLIGHTLY MORE than non-seniors suggests they are not in the cheapest tier. This makes the bivariate finding important: if senior churn is disproportionately high, it is not because they are avoiding high-cost services — it might be a service quality or usability issue.

### Bivariate Analysis

1-Contract Type vs Churn

<img width="964" height="440" alt="image" src="https://github.com/user-attachments/assets/c53a5040-f1f9-489a-8d31-3d1c450872c1" />

> ### 💡 Business Insight
> Panel 1: Month-to-month ~42.1% churn (red, well above average), One year ~5.8% (blue, below average), Two year ~1% (blue, well below average). Panel 2: Month-to-month has by far the highest revenue at risk ($121900+). The difference is stark and immediately visually obvious.
> Month-to-month customers churn at 42.1% vs 1% for two-year — a difference. This is the single most powerful finding in the entire project. Business recommendation: offer targeted incentives to migrate month-to-month customers to annual contracts. Even converting 15% of month-to-month customers saves significant annual revenue. The revenue at risk panel quantifies exactly what is at stake.


2-Tenure vs Churn

<img width="969" height="334" alt="image" src="https://github.com/user-attachments/assets/eca40199-2028-4d8b-92b2-c4351fb41581" />

> ### 💡 Business Insight
> The raw churn rates fluctuated heavily across tenure values, so I used a rolling average to smooth noise and reveal the underlying churn trend more clearly.
> Tenure bivariate analysis revealed churn as a first-year problem: 49% of new customers (0-12 months) churn vs 7% of loyal customers (36+ months). The KDE comparison showed churned customers have a median tenure of 10 months — they leave early. This recommended a Year-1 engagement programme with structured check-ins at months 3, 6, and 12.


3- MonthlyCharges vs Churn

<img width="959" height="375" alt="image" src="https://github.com/user-attachments/assets/a4cd6de8-17af-4735-b53d-f598842abb40" />

> ### 💡 Business Insight
> The boxplot revealed that churned customers had a noticeably higher median monthly charge and a wider IQR, indicating both higher pricing and greater variability among churned users
> KDE: churned distribution shifts RIGHT — churned customers cluster more at 
20. Box plot: churned median ~
61 — a clear 
30 has only ~3% churn, >
20 more per month than retained customers. However: this relationship is CONFOUNDED by service type. Fiber Optic customers pay more AND churn more — so the charge-churn relationship may be partly explained by service type rather than price alone.


4-InternetService vs Churn

<img width="966" height="429" alt="image" src="https://github.com/user-attachments/assets/8cf05871-a137-43f3-af94-adcbc414b93b" />

> ### 💡 Business Insight
>Bar chart: Fiber Optic ~41.5% churn (way above average), DSL ~10.3% (slightly below average), No Internet ~1.4% (well below average). Revenue at risk panel: Fiber Optic dominates — representing 60%+ of total revenue at risk despite being only 44% of customers.
> Fiber Optic customers churn at 41.5% and represent the majority of revenue at risk. This confirms the B3 MonthlyCharges finding: the high-charge, high-churn relationship is largely driven by Fiber Optic customers. Recommendation: a dedicated Fiber Optic retention programme — proactive value communication, tech support bundling, and early contract upgrade offers for Fiber Optic customers on month-to-month contracts.

5- PaymentMethod vs Churn

<img width="953" height="410" alt="image" src="https://github.com/user-attachments/assets/0a1692e1-9901-4ddd-a055-6a571751712d" />

> ### 💡 Business Insight
> Panel 1: Electronic check 48.9% churn (highest, red), Mailed check 8.0%, Credit card auto 6.9%, Bank transfer auto 7.7%. Panel 2: Auto-pay (7.3%) vs Manual payment (34%) — *5Times. The gap between auto and manual is enormous.
>
> Electronic check customers churn at 48.9% — the highest of any payment method. Auto-pay customers (bank transfer + credit card) churn at only ~16 %. The 2x differential between auto and manual payment is a clear engagement signal. Recommendation: at account setup, actively encourage auto-pay enrollment with a $5/month discount — this single intervention could reduce churn among the 56% of customers on manual payment.

6- TechSupport vs Churn

<img width="964" height="428" alt="image" src="https://github.com/user-attachments/assets/6c112653-6b35-4f1e-b725-c23331d909e0" />

> ### 💡 Business Insight
> Panel 1: Without tech support ~40.5% churn, With tech support ~9.6% churn — a massive 27 percentage point gap. Panel 2: the tech support effect holds within EACH contract type — confirming it is not just confounded by contract type.
> Tech support has the largest WITHIN-SERVICE-TYPE effect of any binary service column: 40.5% churn without vs 9.6% with — across all contract types. Recommendation: actively upsell tech support to Fiber Optic customers on month-to-month contracts.

7- Service_Count vs Churn

<img width="950" height="372" alt="image" src="https://github.com/user-attachments/assets/7b485396-0882-435f-a656-629ce4ff5a42" />

> ### 💡 Business Insight
> Dual-axis chart: churn rate LINE clearly decreases as service count increases — from ~35% at 0 services to ~2.1% at 8 services. Customer COUNT bars show most customers have 1-4 services. The stickiness hypothesis is confirmed: more services = significantly lower churn. Summary table shows the monotonic decrease
> STICKINESS HYPOTHESIS CONFIRMED: churn drops from ~35% (0 services) to ~2.1% (8 services) monotonically. This validates the Service_Count feature engineering from Week 1. The most actionable recommendation: offer service bundle upgrades to high-risk customers with Service_Count <= 2.

8- SeniorCitizen vs Churn

<img width="970" height="433" alt="image" src="https://github.com/user-attachments/assets/52b78acc-5ddd-44cd-941e-c2ff97657387" />

> ### 💡 Business Insight
> Senior churn ~50%, Non-senior ~19% — significant 30pp gap. Panel 2: Within each contract type, senior churn is higher than non-senior but the gap narrows. Month-to-month: senior ~58%, non-senior ~43% — nearly 15% difference. The raw gap is partly confounded by seniors being more likely on month-to-month contracts.

9- Partner & Dependents vs Churn

<img width="986" height="302" alt="image" src="https://github.com/user-attachments/assets/22bbc4c8-5ec1-48ae-a026-b837fe7d98e7" />


> ### 💡 Business Insight
> Panel 1: Without partner ~32.5% churn, With partner ~13.4% — 13pp gap. Panel 2: Without dependents ~29.1% churn, With dependents ~7.5% — 23pp gap. Panel 3: The lowest churn segment is Partner=Yes + Dependents=Yes . The highest is Partner=No + Dependents=No .
> Family status creates clear switching friction. Customers with both a partner AND dependents on the account churn at only 12% — less than half the overall rate. Solo customers (no partner, no dependents) churn at 21% — 1 point above average Recommendation: when designing retention campaigns, deprioritise customers with dependents (they have natural retention factors). Focus on single customers with no family plan obligation

10- Gender vs Churn

<img width="732" height="502" alt="image" src="https://github.com/user-attachments/assets/71f1b841-0139-4b9d-b75c-6bff8203fa97" />

> ### 💡 Business Insight
> Gender shows NO significant relationship with churn (p > 0.05, difference < 1pp). This is an important negative finding: (1) Gender should receive low feature importance in the model — if it gets high importance, suspect data issues. (2) Retention campaigns should NOT be gender-targeted — waste of segmentation effort. (3) Confirms that our churn model is equitable across genders — no discriminatory patterns.

11- PaperlessBilling vs Churn

<img width="1103" height="485" alt="image" src="https://github.com/user-attachments/assets/5ed4249b-f834-419d-b076-4b59a962eb8f" />


> ### 💡 Business Insight
> Panel 1: Paperless billing YES 31.9% churn, NO 7.5% churn — a 24.4pp gap. Paperless billing customers churn MORE. Average charge is higher for paperless (
47). Panel 2: The effect holds across contract types.
> Counter-intuitive finding: paperless billing customers churn MORE than paper billing. Possible explanations: (1) Paperless customers are more digitally sophisticated — they comparison shop online and find alternatives easily. (2) They tend to have higher monthly charges (they correlate with Fiber Optic). (3) Paper bills create inertia — physical reminders keep you thinking about the service. This is a nuanced finding that requires careful interpretation before recommending 'push more customers to paperless

### Multi-Factor Segment Analysis

<img width="1119" height="486" alt="image" src="https://github.com/user-attachments/assets/d211f972-1347-49e2-a476-4cbc16e2502b" />

> ### 💡 Business Insight
> Heatmap: Month-to-month + Fiber Optic = the darkest red cell (~55% churn). Two-year contracts are all green regardless of internet type. Revenue at risk chart: Month-to-month + Fiber Optic is the #1 segment by far. Month-to-month + DSL is #2.
> The HIGHEST RISK COMBINATION is Month-to-month + Fiber Optic — the intersection of the most flexible contract AND the most expensive service. This segment represents the single largest block of revenue at risk. The retention team should call these customers first. The specific offer: 'Upgrade to annual contract + Tech Support bundle at 15% discount.' This one segment drives the primary recommendation of the entire project

## Revenue at Risk — Executive Summary Chart

<img width="1100" height="433" alt="image" src="https://github.com/user-attachments/assets/ae793212-c6d9-4839-a050-3c6497ae8b15" />

> ### 💡 Business Insight
> Panel 1: Month-to-month contract represents 93%+ of total revenue at risk. Panel 2: Fiber Optic represents 91%+ of total revenue at risk. Panel 3: Combined programme (contract upgrade + auto-pay + tech support bundling) estimated to save 25% of at-risk revenue. Total annual revenue at risk: approximately $1.3-1.5M.

### Overall Key Business Insights



> Customer retention is the biggest revenue driver. Customers with longer tenure generate significantly higher lifetime revenue, with Total Charges strongly correlated with Tenure (r = 0.77). Improving retention directly increases Customer Lifetime Value (CLV).
> 
> Month-to-month customers represent the highest business risk. With a 42.1% churn rate, they account for the majority of customers and revenue at risk, making contract migration the highest-impact retention strategy.
> 
> The first year is the critical churn period. Nearly 49% of customers in their first 12 months churn, emphasizing the need for stronger onboarding, proactive engagement, and early customer success programs.
> 
> Fiber Optic customers are the most valuable yet the most vulnerable. Despite generating higher monthly revenue, they exhibit the highest churn rate (41.5%) and contribute the largest share of revenue at risk, making them a priority for retention initiatives.
> 
> Customer engagement significantly reduces churn. Customers with Tech Support, multiple subscribed services, and automatic payment methods consistently show much lower churn rates, indicating that service adoption and convenience strengthen customer loyalty.
> 
> Family relationships improve retention. Customers with partners and dependents are substantially less likely to churn, suggesting that bundled or family-oriented offerings naturally increase switching costs and long-term loyalty.
> 
> Demographics play a limited role. Gender has no statistically meaningful relationship with churn, indicating that retention efforts should focus on customer behavior, contract type, pricing, and service usage rather than demographic segmentation.
> 
> The highest-risk customer segment is clear. Customers on Month-to-Month contracts using Fiber Optic services represent the single largest concentration of churn and revenue risk. This segment should be the primary focus of targeted retention campaigns.

 ###  Business Recommendations
 
1. Improve Customer Onboarding
> Focus on customers during their first year, as this is when most churn happens.
> Send welcome emails, product guides, and regular follow-ups to keep new customers engaged.
>
2. Encourage Long-Term Contracts
> Offer discounts or rewards to encourage Month-to-Month customers to switch to 1-year or 2-year plans.
> Longer contracts help improve customer retention.
> 
3. Focus on Fiber Optic Customers
> Fiber Optic customers have the highest churn rate.
> Improve service quality, provide faster support, and offer special retention deals to this group.
> 
4. Promote More Services
> Encourage customers to subscribe to additional services such as Tech Support, Online Security, or Streaming.
> Customers using more services are less likely to leave.
> 
5. Increase Auto-Pay Adoption
> Encourage customers using Electronic Check to switch to Auto-Pay by offering small discounts or cashback.
> Auto-Pay customers have better retention.
> 
6. Target High-Risk Customers
> Identify customers with Month-to-Month contracts, Fiber Optic service, and few subscribed services.
>Reach out to them with personalized offers before they decide to leave.
> 
7. Build Customer Loyalty
> Reward long-term customers with loyalty points, exclusive offers, or renewal discounts.
> This helps increase customer satisfaction and reduces churn.
> 
8. Use Data to Predict Churn
> Build a churn prediction model to identify customers who are likely to leave.
> Contact these customers early with personalized retention campaigns


# 📂 Dataset

This project uses a **Customer Churn** dataset containing customer demographics, account information, subscribed services, billing details, and churn status. The dataset was imported into **MySQL** for SQL-based analysis.

## 📊 Dataset Overview

| Attribute | Details |
|-----------|---------|
| Dataset Name | Customer Churn Dataset |
| Total Records | 594,194 |
| Total Features | 21 |
| Database | MySQL |
| File Format | CSV |
| Target Variable | Churn |

---

## 🗂️ SQL Table Schema

```sql
customer_churn
```

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| customerID | VARCHAR | Unique customer identifier |
| gender | VARCHAR | Customer gender |
| SeniorCitizen | INT | Senior citizen (0 = No, 1 = Yes) |
| Partner | VARCHAR | Whether the customer has a partner |
| Dependents | VARCHAR | Whether the customer has dependents |
| tenure | INT | Number of months the customer has stayed |
| PhoneService | VARCHAR | Phone service subscription |
| MultipleLines | VARCHAR | Multiple phone lines |
| InternetService | VARCHAR | Type of internet service |
| OnlineSecurity | VARCHAR | Online security subscription |
| OnlineBackup | VARCHAR | Online backup subscription |
| DeviceProtection | VARCHAR | Device protection subscription |
| TechSupport | VARCHAR | Tech support subscription |
| StreamingTV | VARCHAR | Streaming TV subscription |
| StreamingMovies | VARCHAR | Streaming movies subscription |
| Contract | VARCHAR | Contract type |
| PaperlessBilling | VARCHAR | Paperless billing status |
| PaymentMethod | VARCHAR | Customer payment method |
| MonthlyCharges | DECIMAL | Monthly subscription charges |
| TotalCharges | DECIMAL | Total amount charged |
| Churn | VARCHAR | Customer churn status (Yes/No) |

---

## 🎯 Target Variable

**Churn**

- **1** → Customer has left the company.
- **0** → Customer is still an active customer.



### the total number of customers and the total number of churned customers from your dataset.
```sql
select count(*) as total_customer , sum(case when churn = 1 then 1 else 0 end) as churned_customer,
sum(case when churn = 0 then 1 else 0 end) as retained_customer from customer_churn;
```

### What is the churn rate of the dataset? Write the SQL to calculate it as a percentage.
```sql
Select count(*) as total_customer,
sum(case when churn = 1 then 1 else 0 end) as churned_customer,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as customer_churn_pct
from customer_churn;
```

### How many distinct values exist in the Contract column?
```sql
select distinct(contract) as dis_constract from customer_churn;
```

```sql
SELECT Contract, COUNT(*) AS customer_count
FROM customer_churn
GROUP BY Contract
ORDER BY customer_count DESC;
```

### Write a query to find all customers who are on a Month-to-month contract AND have churned.
```sql
select id, contract, monthlyCharges, tenure
from customer_churn
where contract = 'Month-to-month' and churn = 1 
order by monthlyCharges desc;
```

### What is the average, minimum, and maximum monthly charge across all customers?
```sql
select avg(monthlyCharges) as average_Charges,
min(monthlyCharges) as min_charges,
max(monthlyCharges) as max_charges,
stddev(monthlycharges) as stddev_charges
from customer_churn;
```

### List all customers who have been with the company for more than 5 years (60 months).
```sql
select id, tenure, contract
from customer_churn
where tenure > 60;
```


### churn rate of 5+year of customer
```sql
select count(*) as total_order,
round(sum(case when churn =1 then 1 else 0 end)*100/count(*),2) as churn_rate_pct
from customer_churn
where tenure>60;
```


### find the total annual revenue at risk from churned customers?
```sql
select count(*) as churned_customerr,
round(sum(monthlyCharges*12),2) as total_annual_revenue_at_risk,
round(avg(monthlyCharges*12),2) as average_value_per_churner
from customer_churn
where churn =1;
```

### find all NULL values in the TotalCharges column 
```sql
select count(*) as total_null_values
from customer_churn
where TotalCharges is NULL;
```

### show the count of customers grouped by both gender and churn status
```sql
select count(*) as total_customers, gender, case when churn = 1 then 'churned' else 'retained'  end as churn_status,
round(count(*) * 100.0 /sum(count(*)) over (partition by gender), 2) as pct_within_gender
from customer_churn
group by gender, churn_status;
```

### Find all customers who have Fiber Optic internet but do NOT have Tech Support.
```sql
select  ID , monthlyCharges , InternetService , Techsupport
from customer_churn
where InternetService = 'Fiber optic' and TechSupport = 'No'
order by monthlyCharges desc;
```


### what is their churn rate vs those WITH tech support
```sql
select count(*),round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churned_rate_pct,TechSupport
from customer_churn
group by TechSupport;
```

### Write a query using HAVING to find contract types where the average monthly charge is above $65.
```sql
select contract , Avg(MonthlyCharges) as average_monlthy_Charges
from customer_churn
group by contract
having avg(MonthlyCharges) > 65;
```


### find the top 5 highest-paying churned customers?
```sql
select id,monthlyCharges, round((monthlyCharges*12),2) as annual_charges,tenure, PaymentMethod
from customer_churn
where churn = 1
order by annual_charges desc
limit 5;
```

### Find the churn rate for each combination of Contract type and Internet Service type
```sql
select count(*) ,contract, InternetService, round(sum(case when churn = 1 then 1 else 0 end)*100/count(*),2) as churn_rate_pct,
       round(sum(case when  Churn='Yes' then MonthlyCharges*12 else 0 end),2) AS revenue_at_risk
from customer_churn
group by contract , InternetService;
```

### Find all customers whose monthly charge is above the average monthly charge of churned customers.
```sql
select id, monthlyCharges, contract , tenure from 
customer_churn
where monthlyCharges > (select avg(monthlyCharges) from customer_churn
where churn =1 );
```

### select contract from customer_churn;Categorise all customers into risk tiers: High Risk, Medium Risk, Low Risk based on contract and tenure.
```sql
select id, contract , tenure, MonthlyCharges,
case when contract = 'Month-to-month' and tenure <=12 then 'High Risk'
when contract = 'Month-to-month' and tenure >12 then 'Medium Risk'
when contract = 'One year' then 'Medium Risk'
when contract = 'Two year' then 'Low Risk'
else 'unknown'
end as risk_Tier
 from customer_churn
 order by monthlyCharges;
 ```
 
### Validate: does risk tier actually predict churn?
```sql
select risk_tier ,count(*) as customers, round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate_pct
from(select churn ,
case when contract = 'Month-to-month' and tenure <=12 then 'High Risk'
when contract = 'Month-to-month' and tenure >12 then 'Medium Risk'
when contract = 'One year' then 'Medium Risk'
when contract = 'Two year' then 'Low Risk'
else 'unknown'
end as risk_tier
from customer_churn)t
group by risk_tier 
order by churn_rate_pct;
```

### Calculate the average tenure separately for churned and retained customers. What does the difference tell you?
```sql
select churn,count(*) as customers,round(max(tenure),2) as maximum_tenure,
round(min(tenure),2) as minimum_tenure,
round(sum(tenure),2) as total_tenure,
round(avg(tenure),2) as average_tenure,
round(stddev(tenure),2) as std_tenure
from customer_churn
group by churn;
```

### Using a CTE, find the top 3 payment methods by churn rate within each contract type.
```sql
with churn_by_segment as(
select contract, PaymentMethod,count(*), sum(case when churn =1 then 1 else 0 end) as churned ,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from customer_churn
group by contract, PaymentMethod),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY Contract ORDER BY churn_rate DESC) AS rnk
    FROM churn_by_segment)
select * from ranked;

### Find all payment methods where more than 500 customers have churned.
select  PaymentMethod , count(*) as total_customer,sum(case when churn = 1 then 1 else 0 end)as churned
from customer_churn
group by PaymentMethod
having sum(case when churn = 1 then 1 else 0 end) >500
order by churned desc;
```

### Create tenure buckets (0-12, 13-24, 25-36, 36+) and find churn rate and average monthly charge for each.
```sql
select count(*) as customers ,case when tenure between 0 and 12 then '1.tenure_bucket'
when tenure between 13 and 24 then '2.tenure_bucket'
when tenure between 25 and 36  then '3.tenure_bucket'
else '4.tenure_bucket' end as tenure_bucket,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate,
round(avg(MonthlyCharges),2) as Avg_Monthly_charges
from customer_churn
group by case when tenure between 0 and 12 then '1.tenure_bucket'
when tenure between 13 and 24 then '2.tenure_bucket'
when tenure between 25 and 36  then '3.tenure_bucket'
else '4.tenure_bucket' end ;
```

## method 2 
```sql
WITH tenure_groups AS (
    SELECT 
        CASE 
            WHEN tenure BETWEEN 0 AND 12 THEN '1.tenure_bucket'
            WHEN tenure BETWEEN 13 AND 24 THEN '2.tenure_bucket'
            WHEN tenure BETWEEN 25 AND 36 THEN '3.tenure_bucket'
            ELSE '4.tenure_bucket'
        END AS tenure_bucket,
        churn,
        MonthlyCharges
    FROM customer_churn
)
SELECT 
    tenure_bucket,
    COUNT(*) AS customers,
    ROUND(SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS churn_rate,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_charges
FROM tenure_groups
GROUP BY tenure_bucket;
```

### find customers whose monthly charge is above the average of their own contract type.
```sql
with contract_avg as(
select contract, MonthlyCharges,avg(MonthlyCharges) over(partition by contract) as avg_contract_charge
from customer_churn
)
select MonthlyCharges
from contract_avg
where MonthlyCharges > avg_contract_charge;
```

### Find customers whose monthly charges are in the top 10% of all customers. What percentage of them churned?
```sql
with top_customers as
(select *, ntile(10) over(partition by MonthlyCharges) as decile
from customer_churn)
select  count(*)as Total_customers , round(sum(case when churn = 1 then  1 else 0 end)/count(*)*100,2) as churn_rate  from top_customers
where decile = 1;

with top10_mysql AS (
    SELECT *,
        NTILE(10) OVER (ORDER BY MonthlyCharges DESC) AS decile
    FROM customer_churn
)
SELECT
    COUNT(*) AS top10_customers,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate_pct,
    ROUND(SUM(CASE WHEN Churn='Yes' THEN MonthlyCharges*12 ELSE 0 END),2) AS revenue_at_risk
FROM top10_mysql
WHERE decile = 1;
```

### Show the count and percentage of customers by SeniorCitizen status and whether they have a partner or dependents.
```sql
select case when SeniorCitizen = 1 then 'Senior' else 'Non-Senior' end as citizen_type,
partner,Dependents, count(*) as total_customers,
round(count(*)*100/sum(count(*)) over(),2) as pct_of_total,
round(sum(case when churn = 1 then 1 else 0 end),2) as churned,
round(sum(case when churn = 1 then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_churn
group by SeniorCitizen , Partner, Dependents
order by churn_rate;
```


### The PaymentMethod column has long names. Write a query to extract only the first word and group churn by it.
```sql
select 
SUBSTRING_INDEX(PaymentMethod, ' ', 1)     as first_word,       
round(sum(case when churn = 1 then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_churn
group by PaymentMethod 
order by churn_rate desc;
```

### Create a unified summary showing churn statistics for both Senior and Non-Senior citizens using UNION ALL.
```sql
select 'senior_customer' as Segment,count(*) as senior_customers, sum(case when churn = 1 then 1 else 0 end) as churned,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from  customer_churn
where SeniorCitizen = 1
union all
select 'Non_senior_customer' as Segment,count(*) as non_senior_customers, sum(case when churn = 1 then 1 else 0 end) as churned,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from  customer_churn
where SeniorCitizen = 0
union all
select 'All customer' as Segment, count(*) as total_customers,
sum(case when churn = 1 then 1 else 0 end) as churned,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from customer_churn;
```

### Using EXISTS, find all customers who exist in both a churned segment and have monthly charges above $70.
```sql
select id, MonthlyCharges, tenure , churn
from customer_churn cc
where churn = 1
and  exists (select 1 from customer_churn c
where MonthlyCharges >70 and c.id = cc.id
);
```

### Write that labels each customer as 'High Value' (MonthlyCharges > 70), 'Mid Value' (40-70), or 'Low Value' (<40) and shows the churn rate per tier.
```sql
select (case when MonthlyCharges >70  then 'High_Value'
when MonthlyCharges between 40 and 70 then 'Mid_Value'
when MonthlyCharges <40 then 'Low_Value'
else 'unknown'
end) as Monthly_tier,
count(*) as customers,
round(sum(case when churn = 1 then 1 else 0 end),2) as churnned,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from customer_churn
group by Monthly_tier
order by churn_rate;
```

### Find the payment method with the highest churn rate within the Month-to-month contract type only.
```sql
with churn_payment as
(select * from customer_churn
where contract = 'Month-to-month'
),
payment_method as (select count(*) as customers, PaymentMethod , round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from churn_payment 
group by PaymentMethod)
select PaymentMethod , max(churn_rate)
from payment_method
group by PaymentMethod;
```

### window functions, show each customer's monthly charge alongside the average monthly charge of their contract type — all in one query without GROUP BY.
```sql
select ID, MonthlyCharges, churn, 
avg(MonthlyCharges) over(partition by contract) as average_MonthlyCharges,
MonthlyCharges - avg(MonthlyCharges) over( partition by contract) as difference_charges
from customer_churn
order by average_MonthlyCharges;
```


### Using LEAD() and LAG(), simulate a month-over-month churn rate change analysis. (Assume you have a snapshot_month column.)
```sql
with monthly_stats as (
select tenure as monthly_proxy,
avg(MonthlyCharges),
count(*) as customers,
sum(case when churn = 1 then 1 else 0 end) as churneed_customer,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from customer_churn
group by tenure)
select 
monthly_proxy,
customers,
churn_rate,
lag(churn_rate,1) over(order by monthly_proxy)as prev_month,
lead(churn_rate,1) over(order by monthly_proxy)as next_month,
churn_rate - lag(churn_rate,1) over(order by monthly_proxy)as difference_rate_from_prev
from monthly_stats
order by monthly_proxy;
```

### Identify customers in the top 20% by monthly charges who are also in the bottom 20% by tenure (newest high-value customers). What is their churn rate?
```sql
with grouped as(
select 
MonthlyCharges,
id,
churn,
tenure,
ntile(5) over(order by MonthlyCharges desc) as grp_monthlycharges,
ntile(5) over( order by tenure) as grp_tenure
from customer_churn)
select 
count(*) as customers,
round(avg(MonthlyCharges),2) as avg_MonthlyCharge,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from grouped
where grp_monthlycharges = 1 and
grp_tenure = 1 ;
```


### Show the cumulative number of churned customers and cumulative revenue lost, ordered by monthly charge descending.
```sql
select MonthlyCharges,
sum(case when churn = 1 then 1 else 0 end) over(order by MonthlyCharges desc rows between unbounded preceding and current row) as cumulative_customer,
sum(case when churn = 1 then MonthlyCharges*12 else 0 end) over(order by MonthlyCharges desc rows between unbounded preceding and current row) as cumulative_revenuelost
from customer_churn
where churn = 1;
```

### Rank all customers by monthly charge within their tenure bucket. Show the top-ranked customer per bucket.
```sql
with ranked as(
select *, 
case when tenure <12 then "1. New"
when tenure between 12 and 24 then "2.Growing"
else "3.Loyal" end as tenure_buc ,
rank() over( partition by case when tenure < 12 then "1. New"
when tenure between 13 and 36 then "2.Growing"
else "3.Loyal" end   order by MonthlyCharges desc) as Rank_in_bucket
from customer_churn)
select id, MonthlyCharges,tenure_buc,Rank_in_bucket
from ranked
where Rank_in_bucket =1;
```

### Highest  tenure bucket customer per contract type
```sql
with t as(
select * , case when tenure <12 then '1.New'
when tenure between 13 and 36 then '2.Growing'
else '3.Loyal'
end as tenure_basket,
rank()over(partition by case when tenure <12 then '1.New'
when tenure between 13 and 36 then '2.Growing'
else '3.Loyal'
end , contract order by tenure desc) as rank_tenure
from customer_churn)
select contract, tenure_basket, count(*) as customers
from t
where rank_tenure = 1
group by tenure_basket , contract;
```


### I have two queries that return the same result — one using a subquery, one using a JOIN. Which is faster for 10 million rows and why?
```sql
SELECT * FROM customer_churn
WHERE MonthlyCharges > (
    SELECT AVG(MonthlyCharges) FROM customer_churn WHERE Contract = 'Month-to-month'
);

-- Method B: JOIN with CTE (faster, scalable)
WITH contract_avg AS (
    SELECT Contract, AVG(MonthlyCharges) AS avg_charge
    FROM customer_churn
    GROUP BY Contract
)
SELECT t.* FROM customer_churn t
JOIN contract_avg ca ON t.Contract = ca.Contract
WHERE t.MonthlyCharges > ca.avg_charge;
```


### Divide customers into quartiles based on monthly charges. Show churn rate and revenue at risk per quartile.
```sql
with quartile as(
select * , ntile(4) over(order by MonthlyCharges) as quartile4
from customer_churn)
select case when quartile4 = 1 then '1.25%_lower'
when quartile4 = 2 then '2.25%_Midlower'
when quartile4 = 3 then '3.25%_Mid'
else '4.25%_Higher'
end as div_quartile,
count(*) as customer,
min(MonthlyCharges) as minimum_Charges,
max(MonthlyCharges) as maximum_Charges,
round(sum(case when churn = 1 then 1 else 0 end),2) as churnned,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate
from quartile
group by quartile4
order by quartile4;
```
 
### For each contract type, find the customer who has been with the company the longest and their churn status.
```sql
with longest as(
select  id, contract, MonthlyCharges, tenure,churn,
FIRST_VALUE(id) over(partition by contract order by tenure desc
Rows between unbounded PRECEDING and unbounded following ) as longest_tenure_id,
ROW_NUMBER() over( partition by Contract order by tenure desc) as rn
from customer_churn
)
select Contract, id, tenure, MonthlyCharges , churn
from longest
where rn =1 
order by tenure desc;
#Method 2:
WITH t AS (
    SELECT  
        id, 
        contract, 
        tenure, 
        MonthlyCharges, 
        churn,
        ROW_NUMBER() OVER (
            PARTITION BY Contract 
            ORDER BY tenure DESC
        ) AS rn
    FROM customer_churn
)

SELECT 
    Contract, id, tenure, MonthlyCharges, churn 
FROM t
WHERE rn = 1
ORDER BY tenure DESC;
```

### a query:(1) segments customers by risk, (2) calculates churn rate per segment, (3) ranks segments, and (4) recommends an action for each.
``` sql
with risk_scored as(
select id, Contract, tenure, MonthlyCharges, TechSupport, Churn,
case when Contract = 'Month-to-month' and tenure <=12 and TechSupport = 'No' Then 4 
when Contract = 'Month-to-month' and tenure <=12 then 3
when Contract = 'Month-to-month' and tenure >12 then 2 
else 1
end as risk_score
from customer_churn),
segment_stats as(
select risk_score,
count(*) as customers,
round(sum(case when Churn = 1 then 1 else 0 end)/count(*)*100,2) as churn_rate,
round(sum(case when Churn = 1 then MonthlyCharges*12 end),2) as rev_at_risk
from risk_scored
group by risk_score
),
ranked_segment as(
select *, rank() over(order by rev_at_risk desc) as priority_rank
from segment_stats
)
select priority_rank,risk_score,customers,churn_rate,rev_at_risk,
case  when risk_score = 4 then 'Urgent: offer contract upgarde _tech support bundle'
when risk_score = 3 then 'High: Proactive outreach, offer loyalty discount'
when risk_score = 2 then 'Medium: check-in call, highlight service upgrades'  
else 'Low: Monitor quarterly, no immediate action needed'
end as recommended_action
from ranked_segment
order by priority_rank;
```
