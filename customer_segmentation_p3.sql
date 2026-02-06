DROP TABLE IF EXISTS customer_segmentation;
--creating table
create table customer_segmentation(
age int ,
Annual_income int,
spending_score int,
Monthly_visits int,
Gender char(7),
Preferred_product varchar(15)
);
Alter table customer_segmentation
drop constraint
customer_segmentation_pkey;
--Data exploration
select*from customer_segmentation;

select count(*)
from customer_segmentation;

--data cleaning
select*from customer_segmentation
where age IS NULL
or
annual_income IS NULl
or
spending_score IS NULl
or
monthly_visits IS NULl
or
gender IS NULL
or
preffered_product IS NULL;

--Data analysis
select*from customer_segmentation
limit 10;

--My findings
--1.Retrieve all customers along with their age group (18–25, 26–35, 36–50, 50+).
select age,
case
	 WHEN age between 18 and 25 then '18-25'
	 WHEN age between 26 and 35 then '26-35'
	 WHEN age between 36 and 50 then '36-50'
	 else '50+'
	 end as age_group
from customer_segmentation
order by age ASC;

--2.Find the total number of customers in each gender category.
select gender, count(*) as "number.of customers"
from customer_segmentation
group by gender;

--3.Calculate the total spending of each customer and classify them as Low, Medium, or High value customers.
select spending_score,
case 
	WHEN spending_score<=30 then 'low'
	WHEN spending_score>100 then 'medium'
	else 'high'
	end as total_spending
from customer_segmentation
order by spending_score asc;
--4.Which gender has a higher average spending score?
select round(avg(spending_score),2) as higher_avg_score,gender
from customer_segmentation
group by gender
order by higher_avg_score desc;

--5.Calculate total and average income grouped by preferred product.
select sum(annual_income) as total_income, round(avg(annual_income),2) as avg_income,preffered_product
from customer_segmentation
group by preffered_product;

--6.Show the top 5 customer_ages with the highest spending score.
select age,preffered_product,spending_score
from customer_segmentation
order by spending_score desc
limit 5;
--end of the project--






