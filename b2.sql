CALL AddInventory(10, -500);
-- Do thủ tục không kiểm tra giá trị của p_quantity, hệ thống thực hiện phép tính cộng với số âm (stock_quantity + (-500)), dẫn đến việc trừ thẳng vào số lượng tồn kho hiện tại.

DROP PROCEDURE IF EXISTS AddInventory;
DELIMITER //

CREATE PROCEDURE AddInventory(IN p_item_id INT, IN p_quantity INT)
BEGIN
    -- Chỉ thực hiện cập nhật kho nếu số lượng truyền vào lớn hơn 0
    IF p_quantity > 0 THEN
        UPDATE Inventory
        SET stock_quantity = stock_quantity + p_quantity
        WHERE item_id = p_item_id;
    END IF;
END //

DELIMITER ;