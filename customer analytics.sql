use project_customer_segmentation;
select * from customer;

select * from customer where invoice_no is null;
select * from customer where gender is null;
select * from customer where age is null;
select * from customer where category is null;
select * from customer where quantity is null;
select * from customer where price is null;
select * from customer where payment_method is null;
select * from customer where invoice_date is null;
select * from customer where shopping_mall is null;

select distinct gender from customer;
select distinct age from customer;
select distinct category from customer;
select distinct quantity from customer;
select distinct price from customer;
select distinct payment_method from customer;
select distinct invoice_date from customer;
select distinct shopping_mall from customer;

select gender,round(count(distinct invoice_no)/(select count(distinct invoice_no) from customer)*100,2) as shopping_distribution from customer group by gender;
select gender,sum(quantity) as product_count from customer group by gender;
select gender,round(sum(price)/(select sum(price) from customer)*100,2) as total_sales from customer group by gender;


select  category,count(distinct invoice_no) as total_orders from customer group by category order by count(distinct invoice_no) desc;
select  category,gender,count(*)  as total_orders from customer group by gender,category order by gender;
select  category,count(*) as total_orders,(case when age<=18 then 'Teen' when age between 19 and 30 then '19-30' when age between 31 and 40 then '31-40' when age between 41 and 50 then '41-50' else '50+' end) as age_category from customer group by age_category,category;
select category,sum(quantity) as Products_sold from customer group by category order by  sum(quantity) desc;
select category,sum(price) as total_sales from customer group by category order by  sum(price) desc;
select category,payment_method,count(*)as Products_sold from customer group by category,payment_method;
select category,shopping_mall,count(*)as Products_sold from customer group by category,shopping_mall;


select (case when age<=18 then 'Teen' when age between 19 and 30 then '19-30' when age between 31 and 40 then '31-40' when age between 41 and 50 then '41-50' else '50+' end) as age_category,sum(quantity) as total_orders from customer group by age_category;
select (case when age<=18 then 'Teen' when age between 19 and 30 then '19-30' when age between 31 and 40 then '31-40' when age between 41 and 50 then '41-50' else '50+' end) as age_category,sum(price) as total_revenue from customer group by age_category;

-- Does the payment method have a relation with other columns?
select payment_method,count(*) as total_orders from customer group by payment_method; 
select gender,payment_method,count(*) as total_orders from customer group by gender,payment_method;
select (case when age<=18 then 'Teen' when age between 19 and 30 then '19-30' when age between 31 and 40 then '31-40' when age between 41 and 50 then '41-50' else '50+' end) as age_category,payment_method,count(*) as total_orders from customer group by age_category,payment_method;
select payment_method,sum(price) as total_sales from customer group by payment_method;
select category,payment_method,count(*) as total_orders from customer group by category , payment_method;
select shopping_mall,payment_method,count(*) as total_orders from customer group by payment_method , shopping_mall;

-- 10.	How is the distribution of the payment method?

select payment_method,round(count(*)/(select count(*) from customer)*100,2) as Payment_Distribution from customer group by payment_method;