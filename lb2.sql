CREATE DATABASE IF NOT EXISTS DetailShop;

CREATE TABLE DetailShop.product (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT references detailshop.order (customer_ID) ON DELETE NO ACTION ON update NO ACTION, 
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
stock_keeping_unit VARCHAR(255) NOT NULL,
price DECIMAL(32) NOT NULL,
tags_id SMALLINT UNSIGNED,
inventory_id SMALLINT UNSIGNED,
discount_id SMALLINT UNSIGNED,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (ID)
);

CREATE TABLE DetailShop.product_tags (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT unique references detailshop.product (tags_ID) ON DELETE NO ACTION ON update NO ACTION, 
name VARCHAR(255) NOT NULL,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (ID)
);

CREATE TABLE DetailShop.product_inventory (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT references detailshop.product (inventory_ID) ON DELETE NO ACTION ON update NO ACTION, 
quantity SMALLINT UNSIGNED,
PRIMARY KEY (ID)
);

CREATE TABLE DetailShop.product_discount (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT REFERENCES DetailShop.product (discount_ID) ON DELETE NO ACTION ON update NO ACTION, 
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
discount_percent DECIMAL,
active BOOLEAN,
created_at TIMESTAMP,
modified_at TIMESTAMP,
deleted_at TIMESTAMP,
PRIMARY KEY (ID)
);

CREATE TABLE DetailShop.USER (
ID INT UNSIGNED NOT NULL AUTO_INCREMENT REFERENCES DetailShop.Order (customer_ID) ON DELETE NO ACTION ON update NO ACTION, 
firstname VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
password TEXT NOT NULL,
email_adress TEXT NOT NULL,
phone_number TINYINT(24),
created_at TIMESTAMP,
PRIMARY KEY (ID) 
);

CREATE TABLE DetailShop.order (
customer_ID INT UNSIGNED NOT NULL , 
product_ID INT UNSIGNED NOT NULL , 
order_ID INT UNSIGNED NOT NULL AUTO_INCREMENT REFERENCES DetailShop.USER (ID) ON DELETE NO ACTION ON update NO ACTION,
PRIMARY KEY (order_ID) 
);
SHOW INDEX FROM detailshop.order;
ALTER TABLE DetailShop.order
add CONSTRAINT product_connect FOREIGN KEY (product_ID)
REFERENCES detailshop.product (ID) ON DELETE NO ACTION ON
UPDATE NO ACTION;

alter TABLE DetailShop.order
DROP FOREIGN KEY product_connect,
DROP INDEX product_connect;
SHOW INDEX FROM detailshop.order;

ALTER TABLE detailshop.order
add test2 int;
SHOW CREATE TABLE detailshop.ORDER;

ALTER TABLE detailshop.order
drop column test,
MODIFY COLUMN test2 int(22) NULL;
SHOW CREATE TABLE detailshop.ORDER;

SHOW CREATE TABLE detailshop.USER;
ALTER TABLE detailshop.user
MODIFY COLUMN FIRSTNAME CHAR(60) NULL;
SHOW CREATE TABLE detailshop.USER;

SHOW CREATE TABLE detailshop.product_inventory;
ALTER TABLE detailshop.PRODUCT_inventory
MODIFY quantity INT(32) UNSIGNED NOT NULL,
ADD COLUMN versionID TINYINT(8) UNSIGNED NOT NULL
AFTER
quantity,
ADD CONSTRAINT UNIQUE UQ_Message_version
(quantity, versionID);
DESCRIBE detailshop.product_inventory;

SHOW INDEX FROM detailshop.order;
ALTER TABLE DetailShop.order
add CONSTRAINT product_connect FOREIGN KEY (product_ID)
REFERENCES detailshop.product_inventory (quantity) ON DELETE CASCADE;
SHOW INDEX FROM detailshop.order;