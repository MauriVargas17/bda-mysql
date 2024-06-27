-- Load data into 'Contacto'
LOAD DATA INFILE '/var/lib/mysql-files/csv/contactos.csv'
INTO TABLE Contacto
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_contacto, email, telefono, created_at, updated_at);

-- Load data into 'Especialidad'
LOAD DATA INFILE '/var/lib/mysql-files/csv/especialidades.csv'
INTO TABLE Especialidad
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_especialidad, nombre, descripcion, created_at, updated_at);

-- Load data into 'Localidad'
LOAD DATA INFILE '/var/lib/mysql-files/csv/localidades.csv'
INTO TABLE Localidad
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_localidad, codigo_postal, nombre, created_at, updated_at);

-- Load data into 'Centro de Salud'
LOAD DATA INFILE '/var/lib/mysql-files/csv/centros_de_salud.csv'
INTO TABLE Centro_de_Salud
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_centro_de_salud, id_localidad, id_contacto, direccion, created_at, updated_at);

-- Load data into 'Paciente'
LOAD DATA INFILE '/var/lib/mysql-files/csv/pacientes.csv'
INTO TABLE Paciente
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_paciente, nombre, apellido, fecha_de_nacimiento, direccion, id_contacto, created_at, updated_at);

-- Load data into 'Profesional de Salud'
LOAD DATA INFILE '/var/lib/mysql-files/csv/profesionales_de_salud.csv'
INTO TABLE Profesional_de_Salud
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_profesional, nombre, apellido, disponibilidad, id_especialidad, id_contacto, created_at, updated_at);

-- Load data into 'Motivo'
LOAD DATA INFILE '/var/lib/mysql-files/csv/motivos.csv'
INTO TABLE Motivo
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_motivo, descripcion, created_at, updated_at);

-- Load data into 'Cita'
LOAD DATA INFILE '/var/lib/mysql-files/csv/citas.csv'
INTO TABLE Cita
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_cita, id_centro_de_salud, id_profesional, id_paciente, id_motivo, fecha, estado, created_at, updated_at);

