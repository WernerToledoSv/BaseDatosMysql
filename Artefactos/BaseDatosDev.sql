CREATE DATABASE IF NOT EXISTS development;

-- Crear tablas en development
USE development;

CREATE TABLE departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE distrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    IdDepartamento INT,
    CONSTRAINT fk_distrito_departamento FOREIGN KEY (IdDepartamento) REFERENCES Departamento(id)
);

CREATE TABLE rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    IdDistrito INT,
    IdRol INT,
    username VARCHAR(50) NOT NULL UNIQUE CHECK (CHAR_LENGTH(username) >= 6),
    password VARCHAR(50) NOT NULL CHECK (CHAR_LENGTH(password) >= 6),
    nombres VARCHAR(255),
    apellidos VARCHAR(255),
    cel VARCHAR(8),
    email VARCHAR(255),
    fechaingreso DATE,
    estado CHAR(1) NOT NULL CHECK (estado IN ('A', 'B', 'E', 'I')),
    Direccion VARCHAR(255),
    CreadoPor VARCHAR(255),
    FechaCreacion DATETIME,
    EditadoPor VARCHAR(255),
    FechaEdicion DATETIME,
    EliminadoPor VARCHAR(255),
    FechaEliminacion DATETIME,
    CONSTRAINT fk_usuario_distrito FOREIGN KEY (IdDistrito) REFERENCES Distrito(id),
    CONSTRAINT fk_usuario_rol FOREIGN KEY (IdRol) REFERENCES rol(id)
);
