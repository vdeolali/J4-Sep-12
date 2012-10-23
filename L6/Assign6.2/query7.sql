SELECT sum(it.item_price * od.item_qty) as value
FROM order_detail od INNER JOIN item it
ON od.item_id = it.item_id
WHERE od.order_id = 28