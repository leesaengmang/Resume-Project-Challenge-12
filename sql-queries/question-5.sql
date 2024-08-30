SELECT 
    state, 
    SUM(electric_vehicles_sold) AS total_ev_sales,
    (SUM(electric_vehicles_sold)) / (SUM(total_vehicles_sold)) AS penetration_rate
    FROM new_schema.sales_by_states
    WHERE fiscal_year = 2024 AND state = 'Delhi'
    GROUP BY state