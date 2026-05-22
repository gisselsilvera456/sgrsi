<?php
session_start();

/**
 * Verifica que la sesión activa tenga uno de los roles permitidos.
 * @param array $roles_permitidos Lista de roles válidos para acceder.
 */
function verificar_rol(array $roles_permitidos): void {
    if (!isset($_SESSION['rol_usuario']) || !in_array($_SESSION['rol_usuario'], $roles_permitidos)) {
        header('Location: /index.php?pagina=login&error=no_autorizado');
        exit;
    }
}

/**
 * Redirige a un módulo o página del sistema.
 * @param string $ruta Nombre de la página objetivo.
 */
function redirigir_a(string $ruta): void {
    header("Location: /index.php?pagina=$ruta");
    exit;
}
?>