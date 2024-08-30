SELECT maker, SUM(electric_vehicles_sold) AS total_4wheelers_sales, fiscal_year FROM sales_by_makers
    WHERE vehicle_category = '4-Wheelers' AND fiscal_year = 2022
    GROUP BY maker
    ORDER BY total_4wheelers_sales DESC
    LIMIT 5;
    
SELECT maker, SUM(electric_vehicles_sold) AS total_ev_sold, fiscal_year, quarter FROM sales_by_makers
    WHERE vehicle_category = '4-Wheelers' AND fiscal_year = 2022 AND maker = 'Tata Motors'
    GROUP BY quarter;