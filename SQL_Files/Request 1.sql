SELECT market FROM dim_customer 
WHERE customer = 'Atliq Exclusive' AND region = 'APAC'
GROUP BY market
ORDER BY market ;


