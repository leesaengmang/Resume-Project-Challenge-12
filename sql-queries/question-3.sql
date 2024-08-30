SELECT table_2022.state, table_2022.PR_2022, table_2024.PR_2024, (table_2024.PR_2024 - table_2022.PR_2022) AS pr_difference
    FROM 
    (SELECT 
            state, 
            (SUM(electric_vehicles_sold)) / (SUM(total_vehicles_sold)) * 100 AS PR_2022, 
            fiscal_year
        FROM sales_by_states
            WHERE fiscal_year = 2022 AND vehicle_category = '4-Wheelers'
            GROUP BY state
    ) AS table_2022
JOIN
    (SELECT 
        state, 
        (SUM(electric_vehicles_sold)) / (SUM(total_vehicles_sold)) * 100 AS PR_2024, 
        fiscal_year
    FROM sales_by_states
        WHERE fiscal_year = 2024 AND vehicle_category = '4-Wheelers'
        GROUP BY state
    ) AS table_2024
ON table_2022.state = table_2024.state
HAVING pr_difference < 0;