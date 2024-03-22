WITH CTE1 AS 
	(SELECT P.segment AS A , COUNT(DISTINCT(FM.product_code)) AS B 
    FROM dim_product P, fact_sales_monthly FM
    WHERE P.product_code = FM.product_code
    GROUP BY FM.fiscal_year, P.segment
    HAVING FM.fiscal_year = "2020"),
CTE2 AS
    (
	SELECT P.segment AS C , COUNT(DISTINCT(FM.product_code)) AS D 
    FROM dim_product P, fact_sales_monthly FM
    WHERE P.product_code = FM.product_code
    GROUP BY FM.fiscal_year, P.segment
    HAVING FM.fiscal_year = "2021"
    )     
    
SELECT CTE1.A AS segment, CTE1.B AS product_count_2020, CTE2.D AS product_count_2021, (CTE2.D-CTE1.B) AS difference  
FROM CTE1, CTE2
WHERE CTE1.A = CTE2.C ;

