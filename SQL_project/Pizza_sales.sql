select * from pizza_sales;

select count(pizza_id)  as Total_id
from pizza_sales;

# Finding total revenue
select sum(total_price) as Total_Revenue
from pizza_sales;

# Average order value
select sum(total_price) / count(distinct(order_id)) as Average_order_value
from pizza_sales;

# Finding Total pizza sold
select sum(quantity) as Total_pizza_sold from pizza_sale;

# Total order placed
select count(distinct(order_id)) as Total_orders from pizza_sales;

# Average pizza per order
select cast(sum(quantity) / count(distinct(order_id)) as decimal(10,2)) as Average_pizzas_per_order   from pizza_sales;

# Daily trends for order
SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

# hourly trend  
SELECT HOUR(order_time) AS order_hours,
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
order by HOUR(order_time);

# Percentage of sales by pizza category
SELECT 
    pizza_category,
    sum(total_price) as Total_sales,
    SUM(total_price) * 100 / (
        SELECT SUM(total_price) 
        FROM pizza_sales 
        WHERE MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) = 1
    ) AS PCT
FROM pizza_sales 
WHERE MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')) = 1
GROUP BY pizza_category;

# percentage of sale by pizza size 
SELECT 
    pizza_size,
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales,
    CAST(
        SUM(total_price) * 100 / (
            SELECT SUM(total_price)
            FROM pizza_sales
            WHERE QUARTER(STR_TO_DATE(order_date, '%Y-%m-%d')) = 1
        ) 
    AS DECIMAL(10,2)) AS PCT
FROM pizza_sales 
WHERE QUARTER(STR_TO_DATE(order_date, '%Y-%m-%d')) = 1
GROUP BY pizza_size;

#Total pizza sold by pizza category
select pizza_category , sum(quantity) as Total_pizza_sold from pizza_sales
group by pizza_category;

# top % best seller by total pizza sold
select pizza_name , sum(quantity) as Total_pizza_sold 
from pizza_sales
where month(str_to_date(order_date , '%Y-%m-%d')) = 8
group by pizza_name
order by sum(quantity) desc
limit 5;

# bottom 5 sold or less sold
select pizza_name , sum(quantity) as Total_pizza_sold 
from pizza_sales
group by pizza_name
order by sum(quantity) ASC
limit 5;