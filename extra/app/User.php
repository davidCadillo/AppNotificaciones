<?php

require_once 'Conexion.php';

class User
{

    public function __construct()
    {
    }

    public static function obtenerUsuario($idUsuario, $password)
    {
        try {
            $consulta = 'SELECT * FROM usuario WHERE idUsuario = ? AND password= ?';
            $query = Conexion::getInstance()->getDatabase()->prepare($consulta);
            $query->bindValue(1, $idUsuario, PDO::PARAM_STR);
            $query->bindValue(2, $password, PDO::PARAM_STR);
            $query->execute();
            $result = $query->fetch(PDO::FETCH_ASSOC);
            return $result;

        } catch (PDOException $e) {
            return -1;
        }

    }

}







