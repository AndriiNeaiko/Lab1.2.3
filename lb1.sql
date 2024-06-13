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

show tables;