/*Create a trigger that makes sure that there is sufficient product stock for all new orders coming
in (use stored function created in Task 1), if there is not enough stock, an error message is
thrown. In addition, a 5% discount is given for all orders with a purchase quantity of more than 40
(ie: 41 and above) items (regardless of product). Minimum stock for all products cannot drop
below 10, exactly 10 is okay. So long as payment has not been processed, orders can still be
made. Examine Test Case for Task 3 & Point 7 (from above) carefully. Name the trigger
before_order .*/

USE shipping_company;
DROP TRIGGER IF EXISTS before_order;
 
DELIMITER //
CREATE TRIGGER before_order BEFORE INSERT ON order_detail
FOR EACH ROW
BEGIN
     IF (SELECT est_remaining_stock(NEW.quantity, NEW.product_id) < 10) THEN
     SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Insufficient Stock!";
     ELSE
      IF NEW.quantity > 40 THEN
         SET NEW.discount = 5;
      ELSE
         SET NEW.discount = 0;
         END IF;
      END IF;
    END //
DELIMITER ;