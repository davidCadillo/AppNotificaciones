<?php
require_once 'User.php';
header('Content-Type application/json');
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['idUsuario']) && isset($_POST['password'])) {
        $idUsuario = $_POST['idUsuario'];
        $password = $_POST['password'];
        $retorno = User::obtenerUsuario($idUsuario, $password);
        if ($retorno) {
            $json['estado'] = 1;
            $json['tipoUsuario'] = $retorno['idtipoUsuario'];
            $apellidos = explode(" ", $retorno['apellidos']);
            $json['nombreUsuario'] = $retorno['nombres'] . $apellidos[0];
            $json['descripcion'] = 'OK';
            echo json_encode($json);
        } else {
            $json['estado'] = 2;
            $json['tipoUsuario'] = -2;
            $json['nombreUsuario'] = "no hay";
            $json['descripcion'] = 'Sin resultados';
            echo json_encode($json);
        }
    } else {
        $json['estado'] = 3;
        $json['tipoUsuario'] = -3;
        $json['nombreUsuario'] = "no hay";
        $json['descripcion'] = 'Parametros incompletos';
        echo json_encode($json);
    }
}