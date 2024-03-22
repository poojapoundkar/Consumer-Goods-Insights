/* Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order */

with x as (select p.product_code,p.division,p.product,sum(sold_quantity) as total_sold_qty,
RANK() OVER(PARTITION BY P.division ORDER BY SUM(S.sold_quantity) DESC) AS 'Rank_Order'
from dim_product p
join fact_sales_monthly s
using (product_code)
where fiscal_year="2021"
group by p.product_code, p.product, p.division
order by sum(sold_quantity) desc)
select * from x
where rank_order in (1,2,3) order by division, rank_order

