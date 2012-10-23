USE orderdatabase;
DROP TABLE IF EXISTS item;
CREATE TABLE item (item_id INT(5) NOT NULL PRIMARY KEY, item_name CHAR(20) NOT NULL, item_price DECIMAL(6,2) NOT NULL);
INSERT INTO  item (item_id, item_name, item_price) VALUES (101, 'Pen', 2.00);
INSERT INTO  item (item_id, item_name, item_price) VALUES (102, 'Pencil', 1.00);
INSERT INTO  item (item_id, item_name, item_price) VALUES (103, 'Eraser', 0.50);

SELECT * FROM item;

DROP TABLE IF EXISTS order_submitted;
CREATE TABLE order_submitted (order_id INT(5) not null primary key,
                   user_id INT(5) not null,
	 	   submit_date DATETIME not null);
SELECT * FROM order_submitted;

DROP TABLE IF EXISTS order_detail;
CREATE TABLE order_detail (order_detail_id INT(5) NOT NULL PRIMARY KEY,
                           order_id INT(5) NOT NULL,
                           item_id INT(5) NOT NULL,
                           item_qty INT(5) NOT NULL);
