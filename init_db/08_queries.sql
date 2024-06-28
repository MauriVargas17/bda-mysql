SELECT *
FROM Paciente
INTO OUTFILE '/var/lib/mysql-files/csv/query_pacientes.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';

SELECT *
FROM Profesional_de_Salud
INTO OUTFILE '/var/lib/mysql-files/csv/query_profesionales_de_salud.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SELECT C.*, CS.direccion AS CentroDireccion, L.nombre AS LocalidadNombre
FROM Cita C
JOIN Centro_de_Salud CS ON C.id_centro_de_salud = CS.id_centro_de_salud
JOIN Localidad L ON CS.id_localidad = L.id_localidad
INTO OUTFILE '/var/lib/mysql-files/csv/query_citas_centro_localidad.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SELECT C.*, P.nombre AS PacienteNombre, P.apellido AS PacienteApellido, 
       PS.nombre AS ProfesionalNombre, PS.apellido AS ProfesionalApellido, 
       M.descripcion AS MotivoDescripcion
FROM Cita C
JOIN Paciente P ON C.id_paciente = P.id_paciente
JOIN Profesional_de_Salud PS ON C.id_profesional = PS.id_profesional
JOIN Motivo M ON C.id_motivo = M.id_motivo
INTO OUTFILE '/var/lib/mysql-files/csv/query_citas_detalles.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SELECT *
FROM Centro_de_Salud
INTO OUTFILE '/var/lib/mysql-files/csv/query_centros_de_salud.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';


SELECT *
FROM Especialidad
INTO OUTFILE '/var/lib/mysql-files/csv/query_especialidades.csv'
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n';
