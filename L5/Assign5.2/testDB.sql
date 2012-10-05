DROP DATABASE IF EXISTS testdatabase; 
CREATE DATABASE testdatabase;
USE testdatabase;
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (customer_id INT(5) NOT NULL PRIMARY KEY, first_name CHAR(20) NOT NULL, last_name CHAR(20) NOT NULL, age INT(2), order_value DECIMAL(6,2));
INSERT INTO  customer (customer_id, first_name, last_name, age, order_value) VALUES (101, 'John', 'Smith',35, 100.00);
INSERT INTO  customer (customer_id, first_name, last_name, age, order_value) VALUES (102, 'Judy', 'Miller',30, 150.00);
INSERT INTO  customer (customer_id, first_name, last_name, age, order_value) VALUES (103, 'Neil', 'Armstrong',25, 200.00);
SELECT * FROM customer;

DROP TABLE IF EXISTS address;
CREATE TABLE address (address_id INT(5) not null primary key,
                   customer_id INT(5) not null,
	 	   address_line1 CHAR(30) not null,
		   city CHAR(20) not null,
                   state CHAR(2) not null,
                   zip int(5) not null);
INSERT INTO address (address_id, customer_id, address_line1, city, state, zip)
      VALUES (1,101, '1234 Main St', 'Atlanta', 'GA', 10000);

INSERT INTO address (address_id, customer_id, address_line1, city, state, zip)
      VALUES (2,102, '2000 Miller Ave', 'Boston', 'MA', 20000);

INSERT INTO address (address_id, customer_id, address_line1, city, state, zip)
      VALUES (3,103, '5000 North Drive', 'Chicago', 'IL', 30000);
