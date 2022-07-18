/*Create a stored procedure to process the payment of the order. This stored procedure accepts
the order_detail_id , payment_method , cc_no , cc_exp_date , cc_owner_name , shipping_mtd ,
shipping_addr as inputs. There are no outputs. The procedure is to use the stored functions
(from Task 1 & 2) to help with the logic. Name the stored procedure process_payment .
So long as the estimated remaining stock is not less than 0, the payment will go through, otherwise
and error is thrown. A shipping order will also be created once the payment is successful.
Note: When testing task 5, if there is not enough product stock for your test cases, manually
update the product's remaining stock to simulate the "arrival of new stock" (linked to Task 4).*/

USE shipping_company;

DROP PROCEDURE IF EXISTS process_payment;

DELIMITER //
CREATE PROCEDURE process_payment (IN para_order_detail_id CHAR(8), IN para_pay_method VARCHAR(20), IN para_cc_no VARCHAR(20), IN para_cc_exp_date VARCHAR(10), IN para_cc_owner_name VARCHAR(100), IN para_shipping_method VARCHAR(50), IN para_shipping_addr VARCHAR(500))
        BEGIN
            DECLARE order_qty INT;
            DECLARE order_prod_id CHAR(8);
            DECLARE order_amt DECIMAL(15,2); 

            SELECT quantity INTO order_qty
            FROM order_detail
            WHERE order_detail.order_detail_id = para_order_detail_id;

            SELECT product_id INTO order_prod_id
            FROM order_detail
            WHERE order_detail.order_detail_id = para_order_detail_id;


            (SELECT total_payable(para_order_detail_id)) INTO order_amt;

            IF (SELECT est_remaining_stock(order_qty, order_prod_id) <= 0)
            THEN
                SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "No Stocks!";
            ELSE
                INSERT INTO payment(order_detail_id, pay_method, pay_amt, cc_no, cc_exp_date, cc_owner_name) VALUES (para_order_detail_id, para_pay_method, order_amt, para_cc_no, para_cc_exp_date, para_cc_owner_name);
                INSERT INTO shipping_order(order_detail_id, shipping_method, shipping_addr) VALUES (para_order_detail_id, para_shipping_method, para_shipping_addr);
                UPDATE product
                SET remaining_stock = (SELECT est_remaining_stock(order_qty, order_prod_id))
                WHERE product_id = order_prod_id;
            END IF;
        END //
DELIMITER ;

    