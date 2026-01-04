
CREATE DATABASE development CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;

USE development;


CREATE TABLE departamento(

    id INT PRIMARY KEY  AUTO_INCREMENT,
    nombre_departamento VARCHAR(30)

);

CREATE TABLE distrito(

    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_distrito VARCHAR(50),
    departamento_id INT,

    CONSTRAINT fk_departamento_id 
    FOREIGN KEY(departamento_id)
    REFERENCES departamento(id)
    ON UPDATE CASCADE

);




CREATE TABLE rol(

    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(30),
    descripcion VARCHAR(100)

);

-- DROP TABLE usuario;
CREATE TABLE usuario(

    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(20) UNIQUE,
    distrito_id INT,
    rol_id INT,
    contrasena varchar(255) NOT NULL,
    nombres VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    cel VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    estado ENUM ('a', 'b', 'e') NOT NULL DEFAULT 'a',
    direccion VARCHAR(100) NOT NULL,
    creado_por TEXT,
    fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    editado_por TEXT,
    fecha_edicion DATETIME,
    eliminado_por TEXT,
    fecha_eliminacion DATETIME,

    CONSTRAINT fk_distrito_id_usuario 
    FOREIGN KEY(distrito_id)
    REFERENCES distrito(id)
    ON UPDATE CASCADE,

    CONSTRAINT fk_rol_id_usuario
    FOREIGN KEY(rol_id)
    REFERENCES rol(id)
    ON UPDATE CASCADE
);




INSERT INTO departamento(nombre_departamento) VALUES("La Unión");

INSERT INTO distrito(nombre_distrito, departamento_id) VALUES("Santa Rosa de lima", 1);

INSERT INTO rol(nombre_rol) VALUES("usuario");


INSERT INTO usuarios (
    nombre_usuario,
    distrito_id,
    rol_id,
    contrasena,
    nombres,
    apellidos,
    cel,
    email,
    direccion
) VALUES (
    'pepino',
    1,
    1,
    '$2y$10$abcdefghijklmnopqrstuv', -- hash de contraseña
    'Juan',
    'López',
    '7890-1234',
    'juan.lopezpepito@email.com',
    'Colonia Centro'
);



--triggers

DELIMITER $$

CREATE TRIGGER triger
BEFORE INSERT ON usuario
FOR EACH ROW 
BEGIN

    SET NEW.creado_por = CURRENT_USER();

END$$

DELIMITER ;