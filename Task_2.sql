/*Create a stored function that calculates the total payable amount (inclusive of discount, if any).
This function takes the order_detail_id and returns the total payable amount rounded up to
the nearest cent. Name the stored function total_payable .*/

USE shipping_company;
DROP FUNCTION IF EXISTS total_payable;

DELIMITER //

CREATE FUNCTION total_payable(order_detail_id CHAR(8))
RETURNS DECIMAL(10,2)
BEGIN
DECLARE total_amt DECIMAL(10,5);
SELECT ((1-(discount/100))*(unit_price*quantity)) INTO total_amt
FROM order_detail
WHERE order_detail.order_detail_id = order_detail_id;
RETURN CEILING(total_amt * 100)/100;
END//
DELIMITER ;
