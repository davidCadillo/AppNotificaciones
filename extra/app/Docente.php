<?php
require_once 'Conexion.php';

class Docente
{
    function __construct()
    {
    }

    public static function getProfesor($idUsuario)
    {
        try {
            // Preparar sentencia
            $query = Conexion::getInstance()->getDatabase()->prepare("call consultarCursosByDocente(?)");
            $query->bindValue(1, $idUsuario, PDO::PARAM_STR);
            $query->execute();
            $row = $query->fetchAll(PDO::FETCH_ASSOC);
            return $row;

        } catch (PDOException $e) {
            return -1;
        }
    }


}
