WITH PaymentCounts AS (
    SELECT 
        city,
        payment,
        COUNT(payment) AS payment_count,
        dense_rank() OVER (PARTITION BY city ORDER BY COUNT(Payment) DESC) AS dr
    FROM walmartsales
    GROUP BY city, payment
)
SELECT city, payment, payment_count
FROM PaymentCounts
WHERE dr = 1;
