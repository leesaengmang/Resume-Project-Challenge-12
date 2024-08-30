SELECT 
    sales_total.state,
    sales_total.total_sales,
    sales_2022.starting_sales,
    sales_2024.ending_sales,
    (POWER(sales_2024.ending_sales / sales_2022.starting_sales, 1/2)) - 1 AS CAGR
FROM
    (SELECT 
        state,
        SUM(total_vehicles_sold) AS total_sales

    FROM sales_by_states
    WHERE fiscal_year BETWEEN 2022 AND 2024
    GROUP BY state
    ) AS sales_total

JOIN
    (SELECT
        state,
        SUM(total_vehicles_sold) AS starting_sales
    FROM sales_by_states
    WHERE fiscal_year = 2022 
    GROUP BY state
    ) AS sales_2022
ON sales_total.state = sales_2022.state
JOIN
    (SELECT
        state,
        SUM(total_vehicles_sold) AS ending_sales
    FROM sales_by_states
    WHERE fiscal_year = 2024 
    GROUP BY state
    ) AS sales_2024
ON sales_total.state = sales_2024.state

ORDER BY CAGR DESC
LIMIT 10