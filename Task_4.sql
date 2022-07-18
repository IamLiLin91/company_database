/*Create a trigger that does the following:
inserts a supplier order when the product's remaining stock drops to less than or equal to
10, when there is no other (currently in delivery) orders for the same product
update the supplier order when the product has "arrive".
Name the trigger after_product_update .*/

USE shipping_company;

DROP TRIGGER IF EXISTS after_product_update;

DELIMITER //
CREATE TRIGGER after_product_update AFTER UPDATE ON product
FOR EACH ROW
BEGIN
     IF (NEW.remaining_stock <= 10) THEN
         IF NOT EXISTS(SELECT * FROM supplier_order 
             WHERE product_id = NEW.product_id AND delivered =0) THEN
            INSERT INTO supplier_order (product_id, stock) VALUES 
            (OLD.product_id, OLD.max_stock-NEW.remaining_stock);
         END IF;
    ELSE
       UPDATE supplier_order
       SET delivered = 1
       WHERE product_id = NEW.product_id;
    END IF;
    END //

DELIMITER ;
