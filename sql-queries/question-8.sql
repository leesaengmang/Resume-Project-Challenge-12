SELECT 
	month_num,
    SUM(electric_vehicles_sold) AS ev_sales,
    fiscal_year
    FROM sales_by_states
    WHERE fiscal_year = 2022
    GROUP BY month_num 
    ORDER BY month_num
    