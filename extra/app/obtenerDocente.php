<?php
require_once 'Docente.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    if (isset($_GET['idUsuario'])) {
        $parametro = $_GET['idUsuario'];
        $retorno = Docente::getProfesor($parametro);
        if ($retorno) {
            $docente["cursosDocente"] = $retorno;
            print json_encode($docente);
        } else {
            print json_encode(
                array(
                    'estado' => '2',
                    'mensaje' => 'No se obtuvo el registro'
                )
            );
        }
    } else {
        print json_encode(
            array(
                'estado' => '3',
                'mensaje' => 'Se necesita un identificador'
            )
        );
    }
}