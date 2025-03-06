SELECT 
    w1.`Customer ID`,
    w1.`Date` AS first_purchase_date,
    w2.`Date` AS repeat_purchase_date,
    DATEDIFF(STR_TO_DATE(w2.`Date`, '%d-%m-%Y'), STR_TO_DATE(w1.`Date`, '%d-%m-%Y')) AS days_between_purchases
FROM walmartsales w1
JOIN walmartsales w2 
    ON w1.`Customer ID` = w2.`Customer ID` 
    AND STR_TO_DATE(w1.`Date`, '%d-%m-%Y') < STR_TO_DATE(w2.`Date`, '%d-%m-%Y') 
    AND DATEDIFF(STR_TO_DATE(w2.`Date`, '%d-%m-%Y'), STR_TO_DATE(w1.`Date`, '%d-%m-%Y')) <=30;
