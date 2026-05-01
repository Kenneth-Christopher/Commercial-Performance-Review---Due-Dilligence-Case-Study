WITH yearly AS(
	SELECT
		substr("Order Date",7,4) AS year,
		round(sum(Sales),2) AS total_revenue,
		round(sum(Profit),2) AS total_profit,
		round(sum(Profit)/sum(Sales)*100,2) AS profit_margin,
		
	FROM orders
	Group BY year
	Order By year
)
Select
	year,
	total_revenue,
	total_profit,
	profit_margin,
	lag(total_revenue) OVER (ORDER BY year) AS previous_year_revenue,
	round(((total_revenue)-lag(total_revenue) OVER (ORDER BY year))/lag(total_revenue) OVER (ORDER BY year),2)*100 AS revenue_change_pct,
	round(((total_profit)-lag(total_profit) OVER (ORDER BY year))/lag(total_profit) OVER (ORDER BY year),2)*100 AS profit_change_pct
FROM yearly
	