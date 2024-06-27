DELIMITER //

CREATE PROCEDURE AgendarCita(
    IN _id_centro_de_salud INT,
    IN _id_profesional INT,
    IN _id_paciente INT,
    IN _id_motivo INT,
    IN _fecha DATETIME,
    IN _estado ENUM('Activa', 'Cancelada', 'Completada')
)
BEGIN
    DECLARE _available ENUM('Disponible', 'No Disponible');

    START TRANSACTION;

    SELECT disponibilidad INTO _available FROM Profesional_de_Salud WHERE id_profesional = _id_profesional;

    IF _available = 'Disponible' THEN
        INSERT INTO Cita (id_centro_de_salud, id_profesional, id_paciente, id_motivo, fecha, estado, created_at, updated_at)
        VALUES (_id_centro_de_salud, _id_profesional, _id_paciente, _id_motivo, _fecha, _estado, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

        UPDATE Profesional_de_Salud SET disponibilidad = 'No Disponible' WHERE id_profesional = _id_profesional;
        
        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //

DELIMITER ;
