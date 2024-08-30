SELECT 
    current_table.vehicle_category,
    previous_table.previous_revenue,
    current_table.current_revenue,
    ((current_table.current_revenue - previous_table.previous_revenue) / previous_table.previous_revenue ) * 100 AS revenue_growth_rate

FROM 
    (SELECT
        vehicle_category,
        (SUM(electric_vehicles_sold) * 1500000) AS previous_revenue
    FROM sales_by_makers
    WHERE vehicle_category = "4-Wheelers" AND fiscal_year = 2023
    GROUP BY fiscal_year
    ) AS previous_table
JOIN
    (SELECT
        vehicle_category,
        (SUM(electric_vehicles_sold) * 1500000) AS current_revenue
    FROM sales_by_makers
    WHERE vehicle_category = "4-Wheelers" AND fiscal_year = 2024
    GROUP BY fiscal_year
    ) AS current_table
ON previous_table.vehicle_category = current_table.vehicle_category