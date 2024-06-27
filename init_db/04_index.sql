CREATE FULLTEXT INDEX ft_idx_descripcion ON Especialidad(descripcion);

CREATE FULLTEXT INDEX ft_idx_descripcion_motivo ON Motivo(descripcion);

CREATE INDEX idx_email ON Contacto(email);