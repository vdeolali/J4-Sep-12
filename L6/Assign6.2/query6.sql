SELECT cs.first_name, cs.last_name, cs.customer_id, us.username, us.user_id, os.submit_date
FROM customer cs INNER
JOIN user us ON cs.customer_id = us.customer_id
INNER JOIN order_submitted os ON us.user_id = os.user_id
WHERE order_id = 29
