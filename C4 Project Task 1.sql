WITH MonthlySales AS (
    SELECT 
        Branch,
        DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%Y'), '%Y-%m') AS Month,
        SUM(Total) AS TotalSales
    FROM walmartsales
    GROUP BY Branch, Month
),
GrowthRate AS (
    SELECT 
        m1.Branch,
        m1.Month,
        m1.TotalSales,
        (m1.TotalSales - m2.TotalSales) / NULLIF(m2.TotalSales, 0) * 100 AS GrowthPercentage
    FROM MonthlySales m1  
    LEFT JOIN MonthlySales m2 
        ON m1.Branch = m2.Branch
        AND DATE_FORMAT(DATE_SUB(STR_TO_DATE(CONCAT(m1.Month, '-01'), '%Y-%m-%d'), INTERVAL 1 MONTH), '%Y-%m') = m2.Month
)
SELECT 
    Branch,
    AVG(GrowthPercentage) AS AvgGrowthRate
FROM GrowthRate
GROUP BY Branch
ORDER BY AvgGrowthRate DESC
Limit 1 ;