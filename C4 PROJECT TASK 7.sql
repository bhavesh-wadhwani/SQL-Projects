select `Product line`,`Customer type`,round(sum(total),0)as `Total Sales` ,count(`Product line`) as `Count of product lines`from walmartsales
group by `Customer type`,`Product line`
Order by `Customer type`,sum(total)desc;