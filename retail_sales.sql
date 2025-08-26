create database sales;
use sales;


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date = "2022-11-05";

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from retail_sales
where category = 'clothing' 
and
quantity >= 4 
and
sale_date between '2022-11-01' and '2022-11-30'
order by sale_date asc;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category,
sum(total_sale) as net_sale
from retail_sales
group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age), category 
from retail_sales
where category = 'beauty'
group by category;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from retail_sales
where total_sale >1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select count(transaction_id) as total_number,category,gender
from retail_sales
group by gender,category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select 
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale
from retail_sales
group by year,month
order by year asc,avg_sale desc;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,sum(total_sale) as total_sale from retail_sales
group by customer_id
order by total_sale desc
limit 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct customer_id),category
from retail_sales
group by category;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
With hourly_sales
as 
(
select *,
case
when extract(hour from sale_time) <12 then 'morning'
when extract(hour from sale_time) between 12 and 17 then 'afternoon'
else 'evening'
end as shift
from retail_sales
)
select shift, count(*) as total_orders
from hourly_sales
group by shift;
 

