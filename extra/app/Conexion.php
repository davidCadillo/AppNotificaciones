<?php
/**
 * Clase que envuelve una instancia de la clase PDO
 * para el manejo de la base de datos
 */
require_once 'config.php';

class Conexion
{
    private static $db = null;
    private static $pdo;

    final private function __construct()
    {
    }

    /**
     * Retorna en la única instancia de la clase
     * @return Conexion|null
     */
    public static function getInstance()
    {
        if (self::$db === null) {
            self::$db = new self();
        }
        return self::$db;
    }

    /**
     * Crear una nueva conexión PDO basada en los datos de conexión
     * @return PDO Objeto PDO
     */
    public function getDatabase()
    {
        if (self::$pdo == null) {
            self::$pdo = new PDO('mysql:dbname=' . db_name . ';host=' . hostname, username, password, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
            self::$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$pdo;
    }


}
