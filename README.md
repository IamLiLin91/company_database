# Company_Database
![image](https://user-images.githubusercontent.com/109471364/179444195-3f7244ad-3d76-40fb-951f-2c0532e69483.png)

## Background
This project is to add stored functions, stored procedures and triggers to a database for a fictional company that sells knock-off antique items. It is not necessary to create these tables as they have been provided to you along with a small test dataset to work with. The incomplete text schema is as follows (there are 7 tables):

1. employee(employee_id, first_name, last_name, contact) where 
      - employee_id is the primary key
2. customer(cust_id, company_name, address, contact) where 
      - cust_id is the primary key
3. product(product_id, name, unit_price, remaining_stock, max_stock) where 
      - product_id is the primary key
4. supplier_order(supp_order_id, product_id, order_date, stock, delivered)
where:
      - supp_order_id is the primary key
      - product_id is the foreign key of the product table.
      - order_date is filled via the default timestamp value with current timestamp 
      - delivered is by default is false (aka 0 )
5. order_detail(order_detail_id, employee_id, product_id, cust_id, order_date, quantity, unit_price, discount) where:
      - order_detail_id is the primary key
      - employee_id is the foreign key referencing the employee table
      - product_id is the foreign key referencing the product table
      - cust_id is the foreign key referencing the customer table
      - order_date is filled via the default timestamp value with current timestamp
      - unit_price values are taken from the product table, attribute unit_price
6. payment(payment_id, order_detail_id, pay_method, pay_amt, pay_date, cc_no, cc_exp_date, cc_owner_name) where:
      - payment_id & order_detail_id are the primary keys. Note that payment and order numbers are treated as a candidate key and no 2 orders have the same    order_detail_id.
      - order_detail_id is the foreign key referencing the order_detail table.
      - pay_date is filled/updated via the default timestamp value with current timestamp
7. shipping_order (shipping_order_id, order_detail_id, shipping_method, shipping_addr) where:
      - shipping_order_id is the primary key
      - order_detail_id is the foreign key referencing the order_detail table
## Scripts
   - create_tables
   - populate_tables
   - qn_test_cases
   - Task_1
   - Task_2
   - Task_3
   - Task_4
   - Task_5(Optional)

