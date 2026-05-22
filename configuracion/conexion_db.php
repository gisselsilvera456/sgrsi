<?php
// Parámetros de conexión a la base de datos
$servidor = '127.0.0.1';
$nombre_db = 'sgrsi';
$usuario_db = 'root';
$clave_db = '';
$codificacion = 'utf8mb4';

// Cadena de conexión DSN
$dsn = "mysql:host=$servidor;dbname=$nombre_db;charset=$codificacion";
$opciones_pdo = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $conexion = new PDO($dsn, $usuario_db, $clave_db, $opciones_pdo);
} catch (\PDOException $error) {
    // En producción, registrar en log en lugar de mostrar
    throw new \PDOException($error->getMessage(), (int)$error->getCode());
}
?>