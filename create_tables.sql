DROP DATABASE IF EXISTS shipping_company;
CREATE DATABASE IF NOT EXISTS shipping_company;
USE shipping_company;

/* Delete the tables if they already exist */
DROP TABLE IF EXISTS shipping_order;
DROP TABLE IF EXISTS supplier_order;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;



/* Create the schema for our tables */
CREATE TABLE employee (employee_id CHAR(8),
    first_name VARCHAR(50), last_name VARCHAR(50), contact VARCHAR(15),
    PRIMARY KEY(employee_id) ) engine=InnoDB;

CREATE TABLE customer (cust_id CHAR(8),
    company_name VARCHAR(200), address VARCHAR(500), contact VARCHAR(15),
    PRIMARY KEY(cust_id) ) engine=InnoDB;

CREATE TABLE product (product_id CHAR(8),
    name TEXT, unit_price DECIMAL(10,2), remaining_stock INT, max_stock INT,
    PRIMARY KEY(product_id) ) engine=InnoDB;

CREATE TABLE supplier_order (supp_order_id INT AUTO_INCREMENT,
    product_id CHAR(8), order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
    stock INT, delivered TINYINT(1) DEFAULT 0,
    PRIMARY KEY(supp_order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE
    ) engine=InnoDB;

CREATE TABLE order_detail (order_detail_id CHAR(8),
    employee_id CHAR(8), product_id CHAR(8), cust_id CHAR(8), 
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, quantity INT,
    unit_price DECIMAL(10,2), discount DECIMAL (5,2),
    CONSTRAINT check_quantity check(quantity > 0),
    PRIMARY KEY(order_detail_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
    ) engine=InnoDB;

CREATE TABLE payment (payment_id INT AUTO_INCREMENT,
    order_detail_id CHAR(8) UNIQUE, pay_method VARCHAR(20),
    pay_amt DECIMAL(15,2), 
    pay_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    cc_no VARCHAR(20),
    cc_exp_date VARCHAR(10),
    cc_owner_name VARCHAR(100),
    PRIMARY KEY(payment_id, order_detail_id),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id) ON DELETE CASCADE
    ) engine=InnoDB;

CREATE TABLE shipping_order (shipping_order_id INT AUTO_INCREMENT,
    order_detail_id CHAR(8), shipping_method VARCHAR(50),
    shipping_addr VARCHAR(500),
    PRIMARY KEY(shipping_order_id),
    FOREIGN KEY (order_detail_id) REFERENCES order_detail(order_detail_id) ON DELETE CASCADE
    ) engine=InnoDB;