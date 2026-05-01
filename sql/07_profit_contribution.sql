WITH analysis AS(
	SELECT
		"Category" AS "product_category",
		round(sum(Sales),2) AS total_revenue,
		round(sum(Profit),2) AS total_profit,
		round(sum(Profit)/sum(Sales),2)*100 AS profit_margin,
		round(sum(Sales)/(SELECT sum(Sales)FROM orders)*100,2) AS revenue_share_pct,
		round(sum(Profit)/(Select sum(Profit)FROM orders)*100,2) AS profit_contribution_pct
FROM orders
GROUP BY Category
)
SELECT
	product_category,
	total_revenue,
	total_profit,
	profit_margin,
	revenue_share_pct,
	profit_contribution_pct,
	round((profit_contribution_pct-revenue_share_pct),2) AS profit_vs_revenue_gap
FROM analysis
ORDER BY profit_vs_revenue_gap DESC 
