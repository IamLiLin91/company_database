/* Q1 TEST CASES ----------------------------------------------------------------------------------------*/
-- SCENARIO 1 - testing for return of positive number
-- Expected Output: 46
SELECT est_remaining_stock(4, '00000905');

-- SCENARIO 2 - testing for return of negative number
-- Expected Output: -4
SELECT est_remaining_stock(54, '00000905');


/* Q2 TEST CASES  --------------------------------------------------------------------------------------*/
-- SCENARIO 1 - testing the math equation for calculating total payable without discount
-- Expected Output: 523.60 (without discount)
SELECT total_payable('x0000001');

-- SCENARIO 2 - testing the math equation for calculating total payable with discount
-- Important: do the checks for Q3 first
-- Expected Output: 817.57 (with discount)
SELECT total_payable('x0000003');


/* Q3 TEST CASES --------------------------------------------------------------------------------------*/
-- SCENARIO 1 - product stock initially at 100
/* Expected Output: 
    - order gets created with discount given
*/
INSERT INTO order_detail (order_detail_id, employee_id, product_id, cust_id, 
	quantity, unit_price) 
	SELECT 'x0000003', '00000001', '00000904', '00004002', 41, p.unit_price FROM product AS p
	WHERE p.product_id = '00000904';

-- SCENARIO 2 - product stock initially at 50
/* Expected Output:
    - order gets created without discount given
*/
INSERT INTO order_detail (order_detail_id, employee_id, product_id, cust_id, 
	quantity, unit_price) 
	SELECT 'x0000002', '00000001', '00000905', '00004002', 40, p.unit_price FROM product AS p
	WHERE p.product_id = '00000905';

-- SCENARIO 3 - product stock initially at 50
/* Expected Output: 
    - order does not get created
    - Error msg stating insufficient stock
*/
INSERT INTO order_detail (order_detail_id, employee_id, product_id, cust_id, 
	quantity, unit_price) 
	SELECT 'x0000004', '00000001', '00000905', '00004002', 42, p.unit_price FROM product AS p
	WHERE p.product_id = '00000905';


/* Q4 TEST CASES ------------------------------------------------------------------------------------*/
-- SCENARIO 1
-- Run this statement 2 or more times. There MUST only be 1 supplier order created
-- so long as the stock has not been delieved.
/* Expected output: 
    - Supplier order created for 96 items (i.e., max_stock - remaining_stock)
*/
UPDATE product SET remaining_stock = 4 WHERE product_id = '00000905';

-- SCENARIO 2
/* Expected output: 
    - Previous supplier_order attribute 'delivered', set to 1
    - Previous supplier_order attribute 'stock', remain as 96
    - In product table, remaining_stock (forcibly) updated to 50 for product_id = '00000905'
*/
UPDATE product SET remaining_stock = 50 WHERE product_id = '00000905';