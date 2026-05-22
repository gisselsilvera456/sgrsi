CREATE DATABASE IF NOT EXISTS sgrsi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sgrsi;

-- Tabla de roles del sistema
CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre ENUM('admin', 'tecnico', 'solicitante') NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

-- Usuarios del sistema
CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena_hash VARCHAR(255) NOT NULL,
    rol_id INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);

-- Laboratorios físicos
CREATE TABLE laboratorios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(150),
    capacidad INT
);

-- Equipos por laboratorio
CREATE TABLE equipos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_patrimonial VARCHAR(50) UNIQUE NOT NULL,
    laboratorio_id INT,
    tipo ENUM('pc', 'monitor', 'teclado', 'mouse', 'otro'),
    estado ENUM('correcto', 'faltante', 'problema_hw', 'problema_sw', 'danado') DEFAULT 'correcto',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (laboratorio_id) REFERENCES laboratorios(id)
);

-- Tickets de soporte y solicitudes
CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    solicitante_id INT NOT NULL,
    asignado_a INT NULL,
    equipo_id INT,
    prioridad ENUM('baja', 'media', 'alta', 'critica') DEFAULT 'media',
    estado ENUM('abierto', 'en_proceso', 'resuelto', 'cerrado') DEFAULT 'abierto',
    descripcion TEXT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (solicitante_id) REFERENCES usuarios(id),
    FOREIGN KEY (asignado_a) REFERENCES usuarios(id),
    FOREIGN KEY (equipo_id) REFERENCES equipos(id)
);

-- Datos iniciales de prueba
INSERT INTO roles (nombre, descripcion) VALUES 
    ('admin', 'Administrador del sistema'),
    ('tecnico', 'Asistente técnico de mantenimiento'),
    ('solicitante', 'Docente o usuario que reporta incidencias');

-- Usuario admin por defecto (contraseña: admin123)
INSERT INTO usuarios (nombre_completo, correo, contrasena_hash, rol_id) 
VALUES ('Admin ITI', 'admin@iti.edu.uy', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 1);