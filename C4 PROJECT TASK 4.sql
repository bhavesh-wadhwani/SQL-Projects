WITH ProductLineStats AS (
    SELECT 
        `Product line`,
        AVG(`Total`) AS avg_sales,
        STDDEV(`Total`) AS stddev_sales
    FROM walmartsales
    GROUP BY `Product line`
)
SELECT 
    ws.`Invoice ID`,
    ws.`Product line`,
    ws.`Total`,
    pls.avg_sales,
    pls.stddev_sales,
    CASE
	WHEN ws.`Total` > (pls.avg_sales + 2 * pls.stddev_sales) THEN 'High Sales Anomaly'
	ELSE 'Low Sales Anomaly'
 END AS sales_anomaly
FROM walmartsales ws
JOIN ProductLineStats pls
    ON ws.`Product line` = pls.`Product line`
ORDER BY ws.`Product line`, sales_anomaly DESC;