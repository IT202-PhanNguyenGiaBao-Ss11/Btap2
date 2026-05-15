DELIMITER // 

CREATE PROCEDURE addInventory (IN p_item_id INT, IN p_quantity INT)
BEGIN 
    UPDATE Inventory 
    SET stock_quantity = stock_quantity + p_quantity
    WHERE item_id = p_item_id;
END //

DELIMITER ;

CALL addInventory (5,-200);

-- update gây mất hàng trong kho vì update chỉ kiểm tra và thay đổi những món hàng có id trùng với id nhập vào chứ không 
-- kiểm tra số lượng nhập vào dẫn đến bị trừ hàng 

DROP PROCEDURE addInventory;
DELIMITER // 

CREATE PROCEDURE addInventory (IN p_item_id INT, IN p_quantity INT)
BEGIN 
    IF p_quantity < 0 
        THEN SELECT 'so hang khong duoc be hon 0' AS 'error';
        RETURN;
    END IF;

    UPDATE Inventory 
    SET stock_quantity = stock_quantity + p_quantity
    WHERE item_id = p_item_id;
END //

DELIMITER ;


