with average_purchase as
(select `Customer ID`, sum(total) as total_purchase from walmartsales
group by  `Customer ID` 
order by total_purchase)
select  avg(total_purchase) from average_purchase;