SELECT
	"Segment" AS customer_segment,
	round(sum(Sales),2) AS total_revenue,
	round(sum(Profit),2) AS total_profit,
	round(sum(Profit)/sum(Sales),2)*100 AS profit_margin,
	round(sum(Sales)/(SELECT Sum(Sales) FROM orders)*100,2) AS customer_segment_revenue_contribution_pct
From orders
GROUP BY "customer_segment"
ORDER BY "total_revenue" DESC
