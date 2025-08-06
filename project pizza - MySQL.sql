CREATE database pizza;
use pizza;
select * from `pizza`;

-- kpi --
-- Q 1 Total Revenue
select round(sum(total_price),0) as Total_Revenue from pizza;

-- Q 2 Average Order values
select * from pizza;
select count(distinct order_id) from pizza;

select sum(total_price)/count(distinct order_id)as"average order value"from pizza;

-- Q 3 Total Pizzas Sold
select sum(quantity) as "Total Pizzas Sold" from pizza;

-- Q 5 Total Orders
select count(distinct order_id) as "Total Orders"from pizza;

-- Q 4 daily trend for total Orders
select order_date,date_format(order_date,'%a') as'myday'
from pizza
where date_format(order_date,'%a')="thu";

select
	date_format(order_date,'%a') as order_day,
    count(distinct order_id) as Total_orders
from
	pizza
group by
	order_day
order by
	order_day
    ;

-- Q 6 Average pizzas per orders
select * from pizza;
select	sum(quantity)/count(distinct (order_id)) from pizza;

-- Q 7 Monthly Trend for orders
select
	date_format(order_date,'%M') as order_day,
    count(distinct order_id)as Total_orders
from
	pizza
group by
	order_day
order by
	order_day;
    
    select distinct pizza_category,round(sum(total_price)*100/(select sum(total_price)from pizza),3) as percentage from pizza group by pizza_category;
  -- Q 9 Totals pizzas sold by pizza catgeory
  select pizza_category,sum(quantity) as "total"
  from pizza
  group by pizza_category;
  
    -- Q 10 Bottom 5 pizzas sold by Quantity
    select pizza_name,quantity from pizza
    order by quantity desc
    limit 5;
    
      -- Q 11 Top 5 pizzas sold by Revenue
      select pizza_name,sum(total_price) as "total"
      from pizza
      group by pizza_name
      order by total desc
      limit 5;
      
        -- Q 12 Bottom 5 pizzas by Revenue
      select pizza_name,sum(total_price) as "total"
      from pizza
      group by pizza_name
      order by total 
      limit 5;
      
       -- Q 13 Top 5 pizzas by Quantity
      select pizza_name,sum(Quantity) as "total"
      from pizza
      group by pizza_name
      order by total desc
      limit 5;
      
       -- Q 14 Bottom 5 pizzas by Quantity
      select pizza_name,sum(Quantity) as "total"
      from pizza
      group by pizza_name
      order by total
      limit 5;