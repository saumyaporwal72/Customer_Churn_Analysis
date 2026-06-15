create database if not exists Churn_Customer_db;
show databases;
use Churn_Customer_db;

CREATE TABLE customer_churn (
    id INT PRIMARY KEY,
    gender VARCHAR(50),
    SeniorCitizen INT,
    Partner VARCHAR(50),
    Dependents VARCHAR(50),
    tenure INT,
    PhoneService VARCHAR(50),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(50),
    OnlineBackup VARCHAR(50),
    DeviceProtection VARCHAR(50),
    TechSupport VARCHAR(50),
    StreamingTV VARCHAR(50),
    StreamingMovies VARCHAR(50),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(50),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn INT,
    tenure_bucket VARCHAR(30),
    Annual_Revenue DECIMAL(10,2),
    PhoneService_bin INT,
    MultipleLines_bin INT,
    InternetService_bin INT,
    OnlineSecurity_bin INT,
    OnlineBackup_bin INT,
    DeviceProtection_bin INT,
    TechSupport_bin INT,
    StreamingTV_bin INT,
    StreamingMovies_bin INT,
    Service_Count INT,
    Avg_spend_per_service DECIMAL(10,2),
    High_Risk_Flag INT
);

SHOW VARIABLES LIKE 'secure_file_priv';
SET GLOBAL local_infile = 1;


LOAD DATA INFILE 'Customer_Churn_Cleaned.csv'
INTO TABLE customer_churn
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from customer_churn;
select max(id) from customer_churn;

#the total number of customers and the total number of churned customers from your dataset.
select count(*) as total_customer , sum(case when churn = 1 then 1 else 0 end) as churned_customer,
sum(case when churn = 0 then 1 else 0 end) as retained_customer from customer_churn;

#What is the churn rate of the dataset? Write the SQL to calculate it as a percentage.
select count(*) as total_customer,
sum(case when churn = 1 then 1 else 0 end) as churned_customer,
round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as customer_churn_pct
from customer_churn;

#How many distinct values exist in the Contract column?
select distinct(contract) as dis_constract from customer_churn;

SELECT Contract, COUNT(*) AS customer_count
FROM customer_churn
GROUP BY Contract
ORDER BY customer_count DESC;

#Write a query to find all customers who are on a Month-to-month contract AND have churned.
select id, contract, monthlyCharges, tenure
from customer_churn
where contract = 'Month-to-month' and churn = 1 
order by monthlyCharges desc;

#What is the average, minimum, and maximum monthly charge across all customers?
select avg(monthlyCharges) as average_Charges,
min(monthlyCharges) as min_charges,
max(monthlyCharges) as max_charges,
stddev(monthlycharges) as stddev_charges
from customer_churn;

#List all customers who have been with the company for more than 5 years (60 months).
select id, tenure, contract
from customer_churn
where tenure > 60;


#churn rate of 5+year of customer
select count(*) as total_order,
round(sum(case when churn =1 then 1 else 0 end)*100/count(*),2) as churn_rate_pct
from customer_churn
where tenure>60;


# find the total annual revenue at risk from churned customers?
select count(*) as churned_customerr,
round(sum(monthlyCharges*12),2) as total_annual_revenue_at_risk,
round(avg(monthlyCharges*12),2) as average_value_per_churner
from customer_churn
where churn =1;

#find all NULL values in the TotalCharges column 
select count(*) as total_null_values
from customer_churn
where TotalCharges is NULL;

#show the count of customers grouped by both gender and churn status
select count(*) as total_customers, gender, case when churn = 1 then 'churned' else 'retained'  end as churn_status,
round(count(*) * 100.0 /sum(count(*)) over (partition by gender), 2) as pct_within_gender
from customer_churn
group by gender, churn_status;

#Find all customers who have Fiber Optic internet but do NOT have Tech Support.
select  ID , monthlyCharges , InternetService , Techsupport
from customer_churn
where InternetService = 'Fiber optic' and TechSupport = 'No'
order by monthlyCharges desc;


#what is their churn rate vs those WITH tech support
select count(*),round(sum(case when churn = 1 then 1 else 0 end)/count(*)*100,2) as churned_rate_pct,TechSupport
from customer_churn
group by TechSupport;

#Write a query using HAVING to find contract types where the average monthly charge is above $65.
select contract , Avg(MonthlyCharges) as average_monlthy_Charges
from customer_churn
group by contract
having avg(MonthlyCharges) > 65;


# find the top 5 highest-paying churned customers?
select id,monthlyCharges, round((monthlyCharges*12),2) as annual_charges,tenure, PaymentMethod
from customer_churn
where churn = 1
order by annual_charges desc
limit 5;

#Find the churn rate for each combination of Contract type and Internet Service type
select count(*) ,contract, InternetService, round(sum(case when churn = 1 then 1 else 0 end)*100/count(*),2) as churn_rate_pct,
       round(sum(case when  Churn='Yes' then MonthlyCharges*12 else 0 end),2) AS revenue_at_risk
from customer_churn
group by contract , InternetService;

#Find all customers whose monthly charge is above the average monthly charge of churned customers.
select id, monthlyCharges, contract , tenure from 
customer_churn
where monthlyCharges > (select avg(monthlyCharges) from customer_churn
where churn =1 );

select contract from customer_churn;
#Categorise all customers into risk tiers: High Risk, Medium Risk, Low Risk based on contract and tenure.
select id, contract , tenure, MonthlyCharges,
case when contract = 'Month-to-month' and tenure <=12 then 'High Risk'
when contract = 'Month-to-month' and tenure >12 then 'Medium Risk'
when contract = 'One year' then 'Medium Risk'
when contract = 'Two year' then 'Low Risk'
else 'unknown'
end as risk_Tier
 from customer_churn
 order by monthlyCharges;
 
#Validate: does risk tier actually predict churn?
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

#Calculate the average tenure separately for churned and retained customers. What does the difference tell you?
select churn,count(*) as customers,round(max(tenure),2) as maximum_tenure,
round(min(tenure),2) as minimum_tenure,
round(sum(tenure),2) as total_tenure,
round(avg(tenure),2) as average_tenure,
round(stddev(tenure),2) as std_tenure
from customer_churn
group by churn;

#Using a CTE, find the top 3 payment methods by churn rate within each contract type.
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

#Find all payment methods where more than 500 customers have churned.
select  PaymentMethod , count(*) as total_customer,sum(case when churn = 1 then 1 else 0 end)as churned
from customer_churn
group by PaymentMethod
having sum(case when churn = 1 then 1 else 0 end) >500
order by churned desc;

#Create tenure buckets (0-12, 13-24, 25-36, 36+) and find churn rate and average monthly charge for each.
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

#method 2 
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

#find customers whose monthly charge is above the average of their own contract type.
with contract_avg as(
select contract, MonthlyCharges,avg(MonthlyCharges) over(partition by contract) as avg_contract_charge
from customer_churn
)
select MonthlyCharges
from contract_avg
where MonthlyCharges > avg_contract_charge;

#Find customers whose monthly charges are in the top 10% of all customers. What percentage of them churned?
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

#Show the count and percentage of customers by SeniorCitizen status and whether they have a partner or dependents.
select case when SeniorCitizen = 1 then 'Senior' else 'Non-Senior' end as citizen_type,
partner,Dependents, count(*) as total_customers,
round(count(*)*100/sum(count(*)) over(),2) as pct_of_total,
round(sum(case when churn = 1 then 1 else 0 end),2) as churned,
round(sum(case when churn = 1 then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_churn
group by SeniorCitizen , Partner, Dependents
order by churn_rate;


#The PaymentMethod column has long names. Write a query to extract only the first word and group churn by it.
select 
SUBSTRING_INDEX(PaymentMethod, ' ', 1)     as first_word,       
round(sum(case when churn = 1 then 1 else 0 end)*100/count(*),2) as churn_rate
from customer_churn
group by PaymentMethod 
order by churn_rate desc;

#Create a unified summary showing churn statistics for both Senior and Non-Senior citizens using UNION ALL.
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

#Using EXISTS, find all customers who exist in both a churned segment and have monthly charges above $70.
select id, MonthlyCharges, tenure , churn
from customer_churn cc
where churn = 1
and  exists (select 1 from customer_churn c
where MonthlyCharges >70 and c.id = cc.id
);

#Write that labels each customer as 'High Value' (MonthlyCharges > 70), 'Mid Value' (40-70), or 'Low Value' (<40) and shows the churn rate per tier.
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

#Find the payment method with the highest churn rate within the Month-to-month contract type only.
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

# window functions, show each customer's monthly charge alongside the average monthly charge of their contract type — all in one query without GROUP BY.

select ID, MonthlyCharges, churn, 
avg(MonthlyCharges) over(partition by contract) as average_MonthlyCharges,
MonthlyCharges - avg(MonthlyCharges) over( partition by contract) as difference_charges
from customer_churn
order by average_MonthlyCharges;


#Using LEAD() and LAG(), simulate a month-over-month churn rate change analysis. (Assume you have a snapshot_month column.)
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

#Identify customers in the top 20% by monthly charges who are also in the bottom 20% by tenure (newest high-value customers). What is their churn rate?
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


#Show the cumulative number of churned customers and cumulative revenue lost, ordered by monthly charge descending.

select MonthlyCharges,
sum(case when churn = 1 then 1 else 0 end) over(order by MonthlyCharges desc rows between unbounded preceding and current row) as cumulative_customer,
sum(case when churn = 1 then MonthlyCharges*12 else 0 end) over(order by MonthlyCharges desc rows between unbounded preceding and current row) as cumulative_revenuelost
from customer_churn
where churn = 1;

#Rank all customers by monthly charge within their tenure bucket. Show the top-ranked customer per bucket.
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

#Highest  tenure bucket customer per contract type
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


#I have two queries that return the same result — one using a subquery, one using a JOIN. Which is faster for 10 million rows and why?
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

# so here cte query run faster then the sub query cte= 1.703 sec where as subquery = 3.3828

#Divide customers into quartiles based on monthly charges. Show churn rate and revenue at risk per quartile.
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

#For each contract type, find the customer who has been with the company the longest and their churn status.
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

# a query:(1) segments customers by risk, (2) calculates churn rate per segment, (3) ranks segments, and (4) recommends an action for each.
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





