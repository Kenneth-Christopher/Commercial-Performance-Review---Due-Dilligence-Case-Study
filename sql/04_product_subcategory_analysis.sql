SELECT
	"Sub-Category",
	"Category",
	round(sum(Sales),2) AS total_revenue,
	round(sum(Profit),2) AS total_profit,
	round(sum(Profit)/sum(Sales),2)*100 AS profit_margin,
	round(sum(Sales)/(SELECT Sum(Sales) FROM orders)*100,2) AS product_subcategory_contribution_pct
From orders
GROUP BY "Sub-Category"
ORDER BY "profit_margin" DESC
