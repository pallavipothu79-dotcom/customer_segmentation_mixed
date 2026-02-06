
📌 Project Overview

This project analyzes customer data using SQL to perform customer segmentation based on demographic and behavioral attributes. It helps identify spending patterns, high-value customers, and product preferences using basic SQL queries.

🎯 Objective

Segment customers based on age, income, and spending behavior.
Identify high-spending and potential customers.
Analyze product preferences across different customer groups.
Practice core SQL concepts for data analysis.

🗂️ Dataset Description

The dataset contains customer information with the following columns:
Age – Customer age.
Gender – Male/Female.
Annual_Income – Yearly income of the customer.
Spending_Score – Customer spending behavior score.
Monthly_Visits – Number of store visits per month.
Preferred_Product – Customer’s preferred product category.

🛠️ SQL Concepts Used

SELECT, WHERE.
ORDER BY, LIMIT.
GROUP BY.
Aggregate functions (SUM, AVG, COUNT, MAX).
CASE statements for segmentation.

📊 Key Analysis & Queries

1.Retrieve all customers along with their age group (18–25, 26–35, 36–50, 50+).

select age,

case

	 WHEN age between 18 and 25 then '18-25'
   
	 WHEN age between 26 and 35 then '26-35'
   
	 WHEN age between 36 and 50 then '36-50'
   
	 else '50+'
   
	 end as age_group
   
from customer_segmentation

order by age ASC;

2.Find the total number of customers in each gender category.

select gender, count(*) as "number.of customers"

from customer_segmentation

group by gender;

3.Calculate the total spending of each customer and classify them as Low, Medium, or High value customers.

select spending_score,

case 

	WHEN spending_score<=30 then 'low'
  
	WHEN spending_score>100 then 'medium'
  
	else 'high'
  
	end as total_spending
  
from customer_segmentation

order by spending_score asc;

4.Which gender has a higher average spending score?

select round(avg(spending_score),2) as higher_avg_score,gender

from customer_segmentation

group by gender

order by higher_avg_score desc;

5.Calculate total and average income grouped by preferred product.

select sum(annual_income) as total_income, round(avg(annual_income),2) as avg_income,preffered_product

from customer_segmentation

group by preffered_product;

6.Show the top 5 customer_ages with the highest spending score.

select age,preffered_product,spending_score

from customer_segmentation

order by spending_score desc

limit 5;

💡 Insights
Identified high-value customers based on spending score.
Found product categories preferred by high-income groups.
Discovered potential customers with high income but low spending.

🚀 Tools Used

PostgreSQL / MySQL
pgAdmin / SQL Editor

👩‍💻 Skill Level

Beginner-friendly SQL project suitable for students and entry-level data roles.
