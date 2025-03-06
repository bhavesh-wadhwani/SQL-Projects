##task 3 full part 
with CustomerSpending as (
select `customer ID`,sum(total) as total_purchase_amount
from walmartsales
group by `customer ID`
order by `customer ID`),
AverageSpending AS (
    SELECT 
        AVG(total_purchase_amount) AS avg_spending
    FROM CustomerSpending
)
select `customer ID`, total_purchase_amount,
case 
when total_purchase_amount< 21500 then "Low Spender"
when total_purchase_amount between 21500 and 22000 then "Medium Spender"
else "High Spender" end as Customer_Classification

,case 
when total_purchase_amount >(select avg_spending from AverageSpending) then "Above average spender"
when total_purchase_amount <=(select avg_spending from AverageSpending) then "Below average spender"
end as Customer_Avg_Spend_cat
from CustomerSpending
Order by total_purchase_amount desc;