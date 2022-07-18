/* Create a stored function that returns the estimated amount of stock left given the number of
units to sell and the product id. The return value can be either positive or negative. Name the
stored function est_remaining_stock .*/
USE shipping_company;
DROP FUNCTION IF EXISTS est_remaining_stock;

DELIMITER //
CREATE FUNCTION est_remaining_stock(qty INT, product_id CHAR(8))
    RETURNS INT
    BEGIN
    DECLARE EST_Qty_Left INT;
    SELECT (remaining_stock - qty) INTO EST_Qty_Left
    FROM product
    WHERE product.product_id = product_id;
    RETURN EST_Qty_Left;
END//
DELIMITER ;

