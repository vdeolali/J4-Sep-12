SELECT user.user_id, user.customer_id, user.username, order_submitted.order_id
    FROM user LEFT OUTER
    JOIN order_submitted
    ON user.user_id = order_submitted.user_id;