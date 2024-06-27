
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE USER 'usuario_profesional_salud'@'%' IDENTIFIED BY 'admin123';
GRANT SELECT, INSERT, UPDATE ON SEDES.Paciente TO 'usuario_profesional_salud'@'%';
GRANT SELECT, INSERT, UPDATE ON SEDES.Cita TO 'usuario_profesional_salud'@'%';
GRANT SELECT ON SEDES.Profesional_de_Salud TO 'usuario_profesional_salud'@'%';
GRANT SELECT ON SEDES.Especialidad TO 'usuario_profesional_salud'@'%';
FLUSH PRIVILEGES;

CREATE USER 'usuario_personal_citas'@'%' IDENTIFIED BY 'admin123';
GRANT SELECT, INSERT, UPDATE ON SEDES.Cita TO 'usuario_personal_citas'@'%';
GRANT SELECT ON SEDES.Paciente TO 'usuario_personal_citas'@'%';
GRANT SELECT ON SEDES.Profesional_de_Salud TO 'usuario_personal_citas'@'%';
GRANT SELECT ON SEDES.Especialidad TO 'usuario_personal_citas'@'%';
FLUSH PRIVILEGES;
