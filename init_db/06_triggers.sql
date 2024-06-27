DELIMITER //

CREATE TRIGGER LogCitaUpdate
AFTER UPDATE ON Cita
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO CitaLog(cita_id, old_estado, new_estado, changed_by, change_date)
        VALUES (NEW.id_cita, OLD.estado, NEW.estado, CURRENT_USER(), NOW());
    END IF;
END //

DELIMITER ;
