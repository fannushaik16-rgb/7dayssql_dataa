use sql7challenge;
--- Q1 total sales values
select 
sum(oi.quantity*oi.price) as total_sales_value
from orders o
join order_items oi
on o.order_id  = oi.order_id
where o.status <> 'cancelled';
---- Q2 sales by product category

SELECT
    p.category,
    SUM(oi.quantity * oi.price) AS total_sales
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC
limit 3;
--- Q3 top 10 products by sales values
select 
p.product_name,
sum(oi.quantity*oi.price) as total_sales
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_id, p.product_name
order by total_sales desc
limit 10;
--- Q4 total quantity sold by product 
select 
p.product_name,
sum(oi.quantity*oi.price) as total_sales
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_id, p.product_name
order by total_sales desc
limit 10;
--- Q4 total quantity sold by product 
select 
p.product_name,
sum(oi.quantity*oi.price) as total_quantity_sold
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_id, p.product_name
order by total_quantity_sold desc;
--- Q5 average selling price by category


SELECT
    p.category,
    AVG(oi.price) AS average_selling_price
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY average_selling_price DESC;
-- Q6 sales by sales channel


SELECT
    o.*,
    SUM(oi.quantity * oi.price) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id
ORDER BY total_sales DESC;
--- Q7 estimated product profit

SELECT
    p.product_name,
    SUM(oi.quantity * (oi.price - p.cost)) AS estimated_profit
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY estimated_profit DESC;
--- Q8 top 5 categories by quantity sold
select p.category,
       sum(oi.quantity) as total_quan_sold
from orders o
join order_items oi on o.order_id = oi.order_id
join products p     on oi.product_id = p.product_id
where o.status <> 'cancelled'
group by p.category
order by total_quan_sold desc
limit 5;
---- insights 
1.category
2.best selling
3.sales channel
4.profitability
5.volume vs value

