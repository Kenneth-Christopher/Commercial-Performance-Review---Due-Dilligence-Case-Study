With metric AS (
SELECT
	"Sub-Category",
	Category,
	round(sum(Sales),2) AS total_revenue,
	round(sum(Profit),2) AS total_profit,
	sum(Quantity) AS Quantity,
	round(sum(Sales)/sum(Quantity),2) AS average_selling_price,
	round((sum(Sales)-sum(Profit))/sum (Quantity),2) AS average_unit_cost,
	round(sum(Profit)/sum(Quantity),2) AS average_unit_profit,
	round(sum(Profit)/sum(Sales)*100,2) AS profit_margin,
	round(avg(Discount),2) as discount
FROM orders
GROUP BY "Sub-Category",Category
)
SELECT
	"Sub-Category",
	Category,
	total_revenue,
	total_profit,
	profit_margin,
	discount,
	CASE
		WHEN profit_margin < 0 AND discount > 0.20 THEN 'Pricing Risk-High Discounting'
		WHEN profit_margin < 0 AND discount < 0.10 THEN 'Cost Risk-Structural Issue'
		ELSE 'Acceptable'
	END AS commerical_risk_flag
FROM metric
ORDER BY profit_margin ASC
