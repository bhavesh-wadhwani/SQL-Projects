SELECT DATE_FORMAT(STR_TO_DATE(Date,'%d-%m-%Y'), '%Y-%m') AS month, Gender, round(sum(total),0)as Total_Sales from walmartsales
group by month,gender
order by month;