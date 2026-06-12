-- 1. Total Orders 

select count(*) as total_orders
from orders;



-- 2. Total Customers

select count(distinct customer_id) as total_customers
from customers;


-- 3.Total_revenue

select round(sum(payment_value)) as total_revenue
from payments;


-- 4.Average_Order_Value

select round(avg(payment_value),2) as avg_order_value
from payments;


-- 5. Revenue By Payment Type 

select payment_type,
round(sum(payment_value),2) as total_revenue
from payments
group by payment_type 
order by total_revenue desc ;


-- 6. Monthly Revenue

select MONTHNAME(order_purchase_timestamp)month,
round(sum(payment_value),2) as monthly_revenue
from orders o 
join payments p
on o.order_id = p.order_id
group by month
order by monthly_revenue desc;


-- 7. Top 15 Customers By Revenue

select customer_id,
sum(payment_value) as revenue
from orders o 
join payments p 
on o.order_id = p.order_id
group by customer_id
order by revenue desc 
limit 15;


-- 8.Orders Per State 

select customer_state,
count(order_id ) as orders_count
from customers c 
join orders o
on c.customer_id =  o.customer_id
group by customer_state 
order by orders_count desc ;


-- 9. Average Review Score

select round(avg(review_score),2) as Avg_review_score
from reviews;


-- 10. Reviews Distribution

Select review_score ,
count(*) reviews_count
from reviews
group by review_score 
order by reviews_count desc;


-- 11. Delivery Delay Date

select round(
100.0*sum(
case when order_delivered_customer_date >
order_estimated_delivery_date
then 1 else 0
end)/count(*),2)as delay_percentage
from orders;


-- 12.Monthly Order Growth

select 
monthname(order_purchase_timestamp) as month ,
count(*) as orders
from orders
group by month 
order by orders;


-- 13. Customers_lifetime_value

select DISTINCT  customer_id ,
sum(payment_value) as lifetime_value
from orders o 
join payments p  
on o.order_id = p.order_id 
group by customer_id 
order by lifetime_value desc;


-- 14. Revenue by Product Category

select product_category_name ,  
sum(payment_value) as revenue 
from order_items oi 
join payments p
on oi.order_id = p.order_id
join products pr
on oi.product_id = pr.product_id
group by product_category_name 
order by revenue desc ;  


-- 15. Seller Performance 

select distinct seller_id , 
count(order_id) as total_orders 
from order_items
group by seller_id 
order by total_orders desc ;

-- 16. Revenue By State

select customer_state , 
sum(payment_value) as revenue
from customers c 
join orders o
on c.customer_id = o.customer_id
join payments p 
on o.order_id = p.order_id 
group  by customer_state 
order by  revenue desc;


-- 17. Repeated_customers 

select customer_id ,
count(order_id)  as  order_count 
from orders 
group by customer_id 
having order_count > 1
order by order_count desc;


-- 18. Monthly Active Customers 

select 
monthname(order_purchase_timestamp) as month , 
count(distinct customer_id) 
from orders 
group by month ;


-- 19.Top Selling Products 

select product_category_name , 
count(*) as sold 
from products 
group BY product_category_name 
order by sold desc;


-- 20. Revenue Leakage Analysis

select review_score , 
round(avg(payment_value),2) as avg_order_value
from reviews r
join payments p 
on r.order_id = p.order_id
group by review_score 
order by review_score ;


-- Coholt Analysis

select customer_unique_id,
count(*) AS order_count
from customers c
join orders o
on c.customer_id = o.customer_id
group by customer_unique_id
having count(*) > 1
order by order_count desc;









































































































































































































































































































































































