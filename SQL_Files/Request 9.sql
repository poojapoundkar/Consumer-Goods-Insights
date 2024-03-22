/* Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage */
with x as (select c.channel,
round(sum(g.gross_price*s.sold_quantity)/100000,2) as gross_sales_mln
from fact_sales_monthly s
join dim_customer c using(customer_code)
join fact_gross_price g using(product_code)
where s.fiscal_year=2021
group by c.channel)
select channel, gross_sales_mln,
round((gross_sales_mln/(select sum(gross_sales_mln) from x))*100,2)
 as pct from x
order by gross_sales_mln desc;
