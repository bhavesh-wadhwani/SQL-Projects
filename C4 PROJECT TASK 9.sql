select `Customer ID`,round(sum(Total),0) as Sales_Revenue from walmartsales
group by `Customer ID`
Order by Sales_Revenue desc
Limit 5 ;