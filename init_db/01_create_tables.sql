
CREATE TABLE Contacto (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255),
    telefono VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Localidad (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    codigo_postal VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Centro_de_Salud (
    id_centro_de_salud INT AUTO_INCREMENT PRIMARY KEY,
    id_localidad INT NOT NULL,
    id_contacto INT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_localidad) REFERENCES Localidad(id_localidad),
    FOREIGN KEY (id_contacto) REFERENCES Contacto(id_contacto)
);

CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    fecha_de_nacimiento DATE NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    id_contacto INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_contacto) REFERENCES Contacto(id_contacto)
);

CREATE TABLE Profesional_de_Salud (
    id_profesional INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    disponibilidad ENUM('Disponible', 'No Disponible') NOT NULL,
    id_especialidad INT NOT NULL,
    id_contacto INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad),
    FOREIGN KEY (id_contacto) REFERENCES Contacto(id_contacto)
);

CREATE TABLE Motivo (
    id_motivo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Cita (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_centro_de_salud INT NOT NULL,
    id_profesional INT NOT NULL,
    id_paciente INT NOT NULL,
    id_motivo INT NOT NULL,
    fecha DATETIME NOT NULL,
    estado ENUM('Activa', 'Cancelada', 'Completada') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_centro_de_salud) REFERENCES Centro_de_Salud(id_centro_de_salud),
    FOREIGN KEY (id_profesional) REFERENCES Profesional_de_Salud(id_profesional),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_motivo) REFERENCES Motivo(id_motivo)
);

CREATE TABLE CitaLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT NOT NULL,
    old_estado ENUM('Activa', 'Cancelada', 'Completada'),
    new_estado ENUM('Activa', 'Cancelada', 'Completada'),
    changed_by VARCHAR(255) NOT NULL,
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cita_id) REFERENCES Cita(id_cita)
);

