--------------------Feature Time of day-------------------------------
--time of day
UPDATE [WalmartSalesData.csv]
SET Time_of_day = 
    CASE 
        WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        WHEN Time BETWEEN '16:01:00' AND '18:00:00' THEN 'Evening'
        WHEN Time BETWEEN '18:01:00' AND '23:59:59' THEN 'Night'
    END;

-- View the contents of the table
SELECT * FROM [WalmartSalesData.csv];

---------------------------------------------------------
-----------day_name--------------------
ALTER TABLE [WalmartSalesData.csv]
ADD Day_name VARCHAR(20);

Select * from [WalmartSalesData.csv]

UPDATE [WalmartSalesData.csv]
SET Day_name = DATENAME(dw,Date);

Select* from [WalmartSalesData.csv]

----------------------------------------------
--------------------Month name------------------------

alter table [WalmartSalesData.csv]
add month_name varchar(20)

update [WalmartSalesData.csv]
set month_name= DATENAME(month, Date)

--------------
---------------------------------------------------------------
------------------------Generic--------------------------------

--How  many unique cities?--
Select distinct city from [WalmartSalesData.csv]

--------which city which branch------
Select distinct city,branch from [WalmartSalesData.csv]

-----------unique product---------
Select distinct product_line from [WalmartSalesData.csv]


--------------What is the most common payment method------------
select payment,count(payment) as cnt from [WalmartSalesData.csv]
group by payment 
order by cnt DESC
------------------What is the most selling product line---------------
select Product_line,count(Product_line) as prd from [WalmartSalesData.csv]
group by Product_line 
order by prd DESC
----------------------

--------------what is the total revenue by month------------
select month_name as month, sum(total) as total_revenue from [WalmartSalesData.csv]
group by month_name
order by total_revenue desc

------what month had the largest cog?--------------
Select month_name as month, sum(cogs) as cogs from [WalmartSalesData.csv]
group by month_name
order by cogs desc

--------which product line had the largest revenue----
Select Product_line as Product,sum(total) as total_revenue from [WalmartSalesData.csv]
group by Product_line
order by total_revenue desc

-------which city had the largest revenue--------------
Select City, sum(total) as total_revenue from [WalmartSalesData.csv]
group by City
order by total_revenue desc

-------------------What product had the largest VAt--------------------
----
Select* from [WalmartSalesData.csv]
select Product_line as product, sum(Tax_5) as Tax from [WalmartSalesData.csv]
group by Product_line
order by Tax desc

------------------which branch sold more than avg product sold---------
Select Branch,sum(quantity) as qty from [WalmartSalesData.csv]
group by Branch
Having sum(quantity)> (Select Avg(quantity) from [WalmartSalesData.csv])

-------------most common product line by gender---
select Product_line as product,Gender as Gender,count(gender) as total_cnt from [WalmartSalesData.csv]
group by gender,Product_line
order by total_cnt desc

---------average rating of each product------------------------
Select Product_line ,AVG(rating) as avg_rating from [WalmartSalesData.csv]
group by Product_line
order by avg_rating desc

-------------------SALES----------------------------------------
------------------No of sales made in each time of the day per weekday-----
select Time_of_day as What_time, count(*) as total_sales from [WalmartSalesData.csv]
group by Time_of_day
order by total_sales desc

------------------Which type of customer brings for revenue----
Select Customer_type as customer,sum(total) as total_revenue from [WalmartSalesData.csv]
group by Customer_type
order by total_revenue desc

---------------which city has the largest tax/vat------------
Select * from [WalmartSalesData.csv]
Select City, AVg(Tax_5) as VAT from [WalmartSalesData.csv]
group by City
order by VAT desc

------------------which customer type pays the most in VAT---------------
Select Customer_type as Customer,avg(tax_5) as VAT from [WalmartSalesData.csv]
group by Customer_type
order by VAT desc