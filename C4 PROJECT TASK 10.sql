SELECT 
    DAYNAME(STR_TO_DATE(date, '%d-%m-%Y')) AS day_of_week, 
    Round(SUM(Total),0) AS total_sales
FROM walmartsales
GROUP BY day_of_week
ORDER BY total_sales DESC
LIMIT 1;
