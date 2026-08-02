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

### bivariate Analysis

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
