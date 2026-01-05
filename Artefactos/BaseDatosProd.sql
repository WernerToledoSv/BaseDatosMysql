CREATE DATABASE IF NOT EXISTS production;

-- Crear tablas en development
USE production;

CREATE TABLE Departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Distrito (
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
    username VARCHAR(255) NOT NULL UNIQUE CHECK (CHAR_LENGTH(username) >= 6),
    password VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(password) >= 6),
    nombres VARCHAR(255),
    apellidos VARCHAR(255),
    cel VARCHAR(20),
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
