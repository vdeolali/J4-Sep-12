DROP DATABASE IF EXISTS orderdatabase; 
CREATE DATABASE orderdatabase;
USE orderdatabase;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (customer_id INT(5) NOT NULL PRIMARY KEY, first_name CHAR(20) NOT NULL, last_name CHAR(20) NOT NULL, age INT(2), order_value DECIMAL(6,2));
INSERT INTO  customer (customer_id, first_name, last_name, age, order_value) VALUES (101, 'Steve', 'Ferrone',27, 100.00);
INSERT INTO  customer (customer_id, first_name, last_name, age, order_value) VALUES (102, 'Jay', 'Sebastian',42, 150.00);
INSERT INTO  customer (customer_id, first_name, last_name, age, order_value) VALUES (103, 'Keng', 'Loh',38, 200.00);
SELECT * FROM customer;

DROP TABLE IF EXISTS user;
CREATE TABLE user (user_id INT(5) not null primary key,
                   customer_id INT(5) not null,
	 	   username CHAR(20) not null,
		   password CHAR(20) not null);
INSERT INTO user (user_id, customer_id, username, password)
      VALUES (1, 101, 'sferrone', 'bluesky');
INSERT INTO user (user_id, customer_id, username, password)
      VALUES (2, 102, 'jsebastian', 'clearwater');
INSERT INTO user (user_id, customer_id, username, password)
      VALUES (3, 103, 'kloh', 'greentree');
SELECT * FROM user;
