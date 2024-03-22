/*Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This
analysis helps to get an idea of low and high-performing months and take strategic decisions. The final
report contains these columns:
Month
Year
Gross sales Amount */

select monthname(f.date) as month,f.fiscal_year,round(sum(g.gross_price*sold_quantity)/1000000,2) as Gross_sales_amt 
from fact_sales_monthly f
join dim_customer c using (customer_code)
join fact_gross_price g using (product_code)
where customer= "Atliq Exclusive"
group by monthname (f.date),f.fiscal_year
order by f.fiscal_year


