SELECT state, vehicle_category, (SUM(electric_vehicles_sold)) / (SUM(total_vehicles_sold)) * 100 AS penetration_rate, fiscal_year
    FROM sales_by_states
    WHERE vehicle_category = '4-Wheelers' AND fiscal_year = 2024
    GROUP BY state
    ORDER BY penetration_rate DESC
    LIMIT 5;