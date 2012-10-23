USE orderdatabase
SELECT customer.customer_id, customer.first_name, customer.last_name, T1.username, T1.order_id, T1.user_id
FROM
customer
LEFT OUTER
JOIN
   (SELECT user.customer_id, user.username, order_submitted.order_id, user.user_id
    FROM user LEFT OUTER
    JOIN order_submitted
    ON user.user_id = order_submitted.user_id) AS T1
ON T1.customer_id =customer.customer_id
GROUP BY customer.customer_id;

