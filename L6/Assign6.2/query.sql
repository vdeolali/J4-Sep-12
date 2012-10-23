USE orderdatabase
SELECT order_submitted.order_id, temp.order_value
FROM 
(SELECT customer.customer_id, customer.first_name, customer.last_name, customer.order_value, user.username, user.user_id
FROM customer
LEFT OUTER
JOIN user
ON customer.customer_id = user.customer_id) AS temp
LEFT OUTER
JOIN order_submitted
ON temp.user_id = order_submitted.user_id;
