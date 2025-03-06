WITH ProfitByProductLine AS (
    SELECT 
        branch,
        `product line`,
        SUM(`gross income` - cogs) AS total_profit
    FROM walmartsales
    GROUP BY branch, `product line`
)
SELECT 
    branch,
    `product line`,
    total_profit
FROM (
    SELECT 
        branch,
        `product line`,
        total_profit,
        RANK() OVER (PARTITION BY branch ORDER BY total_profit DESC) AS rnk
    FROM ProfitByProductLine
) ranked
WHERE rnk = 1;
