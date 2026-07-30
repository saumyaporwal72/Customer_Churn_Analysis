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
>
> - **Correlation with tenure:** **0.770**
> - **Correlation with MonthlyCharges:****0.634**
> ### 💡 Business Insight
> Customers who stay longer consistently generate higher cumulative revenue, as evidenced by the strong 0.77 correlation between tenure and Total Charges. This highlights that customer retention is not only a loyalty metric but also a key revenue driver, where extending customer relationships directly increases Customer Lifetime Value (CLV) and business profitability.
