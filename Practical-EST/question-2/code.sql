DELIMITER //

CREATE PROCEDURE SwapSupplierCities(IN id1 INT, IN id2 INT)
BEGIN
    DECLARE city1 VARCHAR(50);
    DECLARE city2 VARCHAR(50);

    
    SELECT city INTO city1 FROM Tbl_Suppliers WHERE sup_id = id1;
    SELECT city INTO city2 FROM Tbl_Suppliers WHERE sup_id = id2;

    IF city1 IS NOT NULL AND city2 IS NOT NULL THEN
        UPDATE Tbl_Suppliers SET city = city2 WHERE sup_id = id1;
        UPDATE Tbl_Suppliers SET city = city1 WHERE sup_id = id2;
    END IF;
END //

DELIMITER ;