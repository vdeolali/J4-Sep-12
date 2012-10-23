USE orderdatabase
SELECT od.order_id, od.item_id, it.item_name, od.item_qty, it.item_price, od.item_qty*it.item_price as OV
FROM order_detail od INNER
JOIN item it
ON od.item_id=it.item_id
WHERE od.order_id = 29