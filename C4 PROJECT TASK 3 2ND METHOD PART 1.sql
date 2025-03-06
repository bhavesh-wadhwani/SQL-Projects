with CustomerSpending as (
select `customer ID`,sum(total) as total_purchase_amount
from walmartsales
group by `customer ID`
order by `customer ID`)
select `customer ID`, total_purchase_amount,
case 
when total_purchase_amount< 21500 then "Low Spender"
when total_purchase_amount between 21500 and 22000 then "Medium Spender"
else "High Spender" end as Customer_Classification
from CustomerSpending;
