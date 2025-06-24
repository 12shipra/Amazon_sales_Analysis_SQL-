Create Database Amazon;

use Amazon;

Create table Amazon_sales
(Invoice_id varchar(20) PRIMARY KEY, 
Branch Varchar(10) NOT NULL,
City Varchar(30) NOT NULL,
Customer_type Varchar(30) NOT NULL,
Gender Varchar(30) NOT NULL,
Product_line Varchar(30) NOT NULL,
Unit_price Decimal(10,2) NOT NULL,
Quantity INT NOT NULL,
Tax Float(6,4) NOT NULL,
Total Decimal (10,2),
Date datetime NOT NULL,
Time timestamp NOT NULL,
Payment_mode Varchar(20) NOT NULL,
Cogs Decimal(10,2) NOT NULL,
Gross_margin_percentage Float(11,9) NOT NULL,
Gross_income Decimal(10,2) NOT NULL,
Rating Float(2,1));

select * from Amazon_sales;

## Some Business Oriented  based on (Revenue and  Product analysis, Customer behavior and Branch performance) ##

# 1: Total ordered by each Product_line?
Select 
Product_line,
sum(quantity) as Total_ordered 
from Amazon_sales
group by Product_line 
order by  Total_ordered desc;

# 2: Total revenue by each product_line?
Select Product_line,round(sum(total)) as Total_revenue
from Amazon_sales
group by Product_line
order by Total_revenue desc;

# 3: In which month revenue is very High?
Select 
monthname(date) as monthname,
round(sum(total)) as Total_revenue
from Amazon_sales
group by monthname(date)
order by Total_revenue desc;

# 4: Product demand by each Gender?
Select Gender,Product_line,sum(Quantity) as Total_ordered
from Amazon_sales
group by Gender,Product_line
order by Total_ordered desc;

# 5: In which city and Branch, Revenue is very high?
Select Branch,City,round(sum(total)) as Total_revenue
from Amazon_sales
group by City,Branch
order by Total_revenue desc;

# 6: Average rating per product_line?
Select Product_line,round(avg(rating),1) as Avg_rating
from Amazon_sales
group by Product_line
order by Avg_rating desc;

# 7: Which payment method occurs most frequently?
Select Payment,count(*) as Number_of_transaction
from Amazon_sales
group by Payment
order by Number_of_transaction desc;

# 8: Customer behaviour based on  Gender and Customer Type?
Select 
customer_type,Gender,
count(*) as No_of_purchase
from Amazon_sales
group by customer_type,Gender
order by customer_type;

# 9: On which particular day customer is more active?  
Select
dayname(Date) as day_name,
count(*) as total_order
from Amazon_sales
group by dayname(Date)
order by total_order desc;

# 10: On which particular time customers are more active? 
select 
Time_of_day,
count(*) as Number_of_order
from 
(select time,
case when time between "00:00:00:am"  and "12:00:00:am" then "Morning"
when time between "12:01:00:pm" and "4:00:00:pm" then "Afternoon"
else "Evening" 
end as Time_of_day
from Amazon_sales) as Time_of_day
group by Time_of_day
order by Number_of_order desc;

# 11: Customer Rating
Select Customer_rating,count(*) as Rating_status
from 
(select Rating,
case when rating>7 then "Good"
when rating between 4 and 6 then "Averege"
else "Poor" end as Customer_rating
from amazon_sales) as Rating_table
group by Customer_rating;


## Feature Engineering ##

## Time of day ##

select time,
case when time between "00:00:00:am"  and "12:00:00:am" then "Morning"
when time between "12:01:00:pm" and "4:00:00:pm" then "Afternoon"
else "Evening" 
end as Time_of_day
from Amazon_sales;

Alter table Amazon_sales add column Time_of_day varchar(20);

Update Amazon_sales set Time_of_day=(case 
when time between "00:00:00:am"  and "12:00:00:am" then "Morning"
when time between "12:01:00:pm" and "4:00:00:pm" then "Afternoon"
else "Evening" end);  

## Month_name ##

Select monthname(date) from Amazon_sales;

Alter table Amazon_sales add column Month_name varchar(10);

Update Amazon_sales set Month_name=monthname(date);

## Day_name ##

Select dayname(date) from Amazon_sales;

Alter table Amazon_sales add column Day_name varchar(20);

Update Amazon_sales set Day_name=dayname(date);


## Some Business Problems based ##

# 1: What is the count of distinct cities in the dataset?
Select 
count(distinct(city)) as Distinct_city 
from Amazon_sales;

# 2: For each branch, what is the corresponding city?
Select 
Branch,City 
from Amazon_sales
group by Branch,City;

# 3: What is the count of distinct product lines in the dataset?
Select 
count(distinct(Product_line)) as Type_of_product
from Amazon_sales;

# 4: In which month did the cost of goods sold reach its peak?
Select 
month_name,sum(cogs) as Total_cogs
from Amazon_sales 
group by month_name 
order by Total_cogs desc 
limit 1;

# 5: In which city was the highest revenue recorded?
Select 
City,round(sum(total)) as Revenue_by_each_city
from Amazon_sales 
group by City 
order by Revenue_by_each_city desc
limit 1;

# 6: For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad"?
Select product_line,Total,
case when Quantity>(select avg(Quantity) 
from Amazon_sales) then "Good"
else "Bad " end as Sales_category
from Amazon_sales;

# 7: Identify the branch that exceeded the average number of products sold?
SELECT branch, SUM(quantity) AS total_quantity
FROM amazon_sales
GROUP BY branch
HAVING SUM(quantity) > (
    SELECT AVG(total_quantity)
    FROM (
        SELECT branch, SUM(quantity) AS total_quantity
        FROM amazon_sales
        GROUP BY branch
    ) AS branch_totals
);

# 8: Which product line is most frequently associated with each gender?
Select 
Gender,Product_line,
row_number() over(order by Number_of_order desc)
as Rank_wise
from 
(Select 
Gender,Product_line,count(*) as Number_of_order
from Amazon_sales 
group by Gender,Product_line) as Order_table;


# 9: Count the sales occurrences for each time of day on every weekday.
Select 
Day_name,Time_of_day,count(*) as Number_of_order
from Amazon_sales 
group by Day_name,Time_of_day
order by Number_of_order desc;

# 10: Identify the customer type contributing the highest revenue.?
Select 
Customer_type,round(sum(total)) as Revenue
from Amazon_sales 
group by Customer_type 
order by Revenue desc;

# 11: What is the count of distinct customer types in the dataset?
Select 
count(distinct(customer_type)) as unique_customer_type
from Amazon_sales;

# 12: What is the count of distinct payment methods in the dataset?
Select 
count(distinct(payment)) as Payment_mode
from Amazon_sales;

# 13: Which customer type occurs most frequently?
Select 
Customer_type,count(*) as Maximum_order
from Amazon_sales group by Customer_type
order by Maximum_order desc 
limit 1;

# 14: Identify the customer type with the highest purchase frequency?
Select 
Customer_type,sum(quantity) as Total_order
from Amazon_sales 
group by Customer_type
order by Total_order desc;

# 15: Determine the predominant gender among customers?
Select 
Gender,count(*) as Number_of_order
from Amazon_sales 
group by Gender
order by Number_of_order desc;

# 16: Examine the distribution of genders within each branch?
Select 
Gender,Branch,count(*) as Order_by_Gender_and_Customer_type
from Amazon_sales 
group by Gender,Branch
order by Gender;

# 17: Identify the time of day when customers provide the most ratings?
Select 
Time_of_day,count(rating) as Rating 
from Amazon_sales 
group by Time_of_day
order by Rating desc;

# 18: Determine the time of day with the highest customer ratings for each branch?
Select 
Branch,Time_of_day,count(rating) as Rating
from Amazon_sales 
group by Branch,Time_of_day
order by Rating desc;

# 19: Identify the day of the week with the highest average ratings?
Select 
Day_name,Avg(rating) as Average_rating
from Amazon_sales 
group by Day_name
order by Average_rating desc 
limit 1;

# 20: Determine the day of the week with the highest average ratings for each branch?
Select 
Branch,Day_name,round(Avg(rating),2) as Average_rating
from Amazon_sales 
group by Branch, Day_name
order by Average_rating;



