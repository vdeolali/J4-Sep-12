USE orderdatabase
SELECT order_submitted.order_id, sum( T1.item_qty*  T1.item_price) as OV, submit_date  
FROM
order_submitted
LEFT OUTER
JOIN
   (SELECT order_detail.order_id, item.item_price, order_detail.item_qty
    FROM item INNER
    JOIN order_detail
    ON item.item_id = order_detail.item_id) AS T1
ON T1.order_id =order_submitted.order_id
WHERE order_submitted.user_id=1
GROUP BY T1.order_id
ORDER BY order_submitted.submit_date asc;