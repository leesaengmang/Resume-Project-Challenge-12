SELECT maker, SUM(electric_vehicles_sold) AS total_2wheelers_sales, fiscal_year FROM sales_by_makers
    WHERE vehicle_category = '2-Wheelers' AND fiscal_year = 2024
    GROUP BY maker
    ORDER BY total_2wheelers_sales 
    LIMIT 3; 