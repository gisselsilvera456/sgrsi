<?php
require_once 'configuracion/conexion_db.php';
require_once 'plantillas/seguridad.php';

// Página solicitada por GET, valor por defecto: panel principal
$pagina_solicitada = $_GET['pagina'] ?? 'panel';
$paginas_permitidas = ['login', 'panel', 'laboratorios', 'equipos', 'tickets'];

if (!in_array($pagina_solicitada, $paginas_permitidas)) {
    $pagina_solicitada = 'panel';
}

include 'plantillas/encabezado.php';

switch ($pagina_solicitada) {
    case 'login':
        include 'modulos/auth/login.php';
        break;
    case 'panel':
        include 'modulos/panel/index.php';
        break;
    case 'laboratorios':
        verificar_rol(['admin', 'tecnico']);
        include 'modulos/laboratorios/index.php';
        break;
    case 'equipos':
        verificar_rol(['admin', 'tecnico']);
        include 'modulos/equipos/index.php';
        break;
    case 'tickets':
        include 'modulos/tickets/index.php';
        break;
}

include 'plantillas/pie_pagina.php';
?>