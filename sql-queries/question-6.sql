SELECT 
    sales_total.maker,
    sales_total.total_ev_sold,
    sales_2022.starting_sales,
    sales_2024.ending_sales,
    (POWER(sales_2024.ending_sales / sales_2022.starting_sales, 1/2)) - 1 AS CAGR
FROM
    (SELECT 
        maker,
        SUM(electric_vehicles_sold) AS total_ev_sold

    FROM sales_by_makers
    WHERE fiscal_year BETWEEN 2022 AND 2024 AND vehicle_category = '4-Wheelers'
    GROUP BY maker
    ) AS sales_total

JOIN
    (SELECT
        maker,
        SUM(electric_vehicles_sold) AS starting_sales
    FROM sales_by_makers
    WHERE fiscal_year = 2022 AND vehicle_category = '4-Wheelers'
    GROUP BY maker
    ) AS sales_2022
ON sales_total.maker = sales_2022.maker
JOIN
    (SELECT
        maker,
        SUM(electric_vehicles_sold) AS ending_sales
    FROM sales_by_makers
    WHERE fiscal_year = 2024 AND vehicle_category = '4-Wheelers'
    GROUP BY maker
    ) AS sales_2024
ON sales_total.maker = sales_2024.maker

ORDER BY total_ev_sold DESC
LIMIT 5